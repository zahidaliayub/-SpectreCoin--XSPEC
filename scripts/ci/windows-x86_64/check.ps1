echo "windows-x86_64/check.ps1"

$env:Path = "C:/tools/msys64/usr/bin;$env:Path"
$env:Path = "C:/tools/msys64/mingw64/bin;$env:Path"
$env:Path = "C:/tools/msys64/mingw64/x86_64-w64-mingw32/bin;$env:Path"
$env:Path = "C:/tools/msys64/mingw64/qt5-static/bin;$env:Path"

cd "$env:VAGRANT_BUILD_DIR"
mingw32-make -j 1 check
