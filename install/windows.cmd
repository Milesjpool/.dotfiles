if not exist "%userprofile%\.gitconfig" mklink %userprofile%\.gitconfig "%cd%\git\.gitconfig"

if not exist ".\git\.gitconfig.private" mk "%cd%\git\.gitconfig.private"
if not exist "%userprofile%\.gitconfig.private" mklink %userprofile%\.gitconfig.private "%cd%\git\.gitconfig.private" 