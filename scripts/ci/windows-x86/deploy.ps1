echo "windows-x86/deploy.ps1"

$env:Path = "C:/tools/msys64/usr/bin;$env:Path"
$env:Path = "C:/tools/msys64/mingw64/bin;$env:Path"
$env:Path = "C:/tools/msys64/mingw64/i686-w64-mingw32/bin;$env:Path"
$env:Path = "C:/tools/msys64/mingw64/qt5-static/bin;$env:Path"

cd "$env:VAGRANT_BUILD_DIR"
mingw32-make -j 1 deploy
