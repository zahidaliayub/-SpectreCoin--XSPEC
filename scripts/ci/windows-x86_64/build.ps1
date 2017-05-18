echo "windows-x86_64/build.ps1"

$env:Path = "C:/tools/msys64/usr/bin;$env:Path"
$env:Path = "C:/tools/msys64/mingw64/bin;$env:Path"
$env:Path = "C:/tools/msys64/mingw64/x86_64-w64-mingw32/bin;$env:Path"
$env:Path = "C:/tools/msys64/mingw64/qt5-static/bin;$env:Path"

function Build-Qt5
{
    echo "TODO: Use Qt version >=5.9.0 compiled from source."
}
Build-Qt5

function Build-Project
{
    cd "$env:VAGRANT_BUILD_DIR"
    qmake -r CONFIG-=debug CONFIG+=release "$env:VAGRANT_SOURCE_DIR"/*.pro
    mingw32-make -j 1
}
Build-Project
