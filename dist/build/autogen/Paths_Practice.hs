{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_Practice (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/keaton/.cabal/bin"
libdir     = "/Users/keaton/.cabal/lib/x86_64-osx-ghc-8.0.2/Practice-1.0"
dynlibdir  = "/Users/keaton/.cabal/lib/x86_64-osx-ghc-8.0.2"
datadir    = "/Users/keaton/.cabal/share/x86_64-osx-ghc-8.0.2/Practice-1.0"
libexecdir = "/Users/keaton/.cabal/libexec"
sysconfdir = "/Users/keaton/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Practice_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Practice_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "Practice_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "Practice_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Practice_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Practice_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
