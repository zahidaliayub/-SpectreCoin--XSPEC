echo "windows-x86/bootstrap.ps1"

# 1. Installing Chocolatey...
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

# 2. Installing PowerShell Community Extensions (PSCX)...
choco install --confirm pscx

# 3. Installing Git...
choco install --confirm git -params '"/GitAndUnixToolsOnPath"'

# 4. Installing MSYS2...
choco install --confirm msys2

# 5. MSYS2: Installing pre-compiled Qt 5.x, compiler and some other developer tools...
C:\tools\msys64\usr\bin\bash.exe -l -c @"
    pacman -S --refresh --needed --noconfirm base-devel wget
    pacman -S --refresh --needed --noconfirm mingw-w64-i686-toolchain
    pacman -S --refresh --needed --noconfirm mingw-w64-i686-jasper
    pacman -S --refresh --needed --noconfirm mingw-w64-i686-qt5-static
"@

# 6. Creating build directoty...
New-Item -Force -ItemType directory -Path "$env:VAGRANT_BUILD_DIR"
cd "$env:VAGRANT_BUILD_DIR"
