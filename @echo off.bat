@echo off
echo 修复VS Code设置文件权限...
echo.

:: 确保VS Code已关闭
taskkill /f /im code.exe >nul 2>&1

:: 设置文件路径变量
set settings_file=%APPDATA%\Code\User\settings.json

:: 检查文件是否存在
if not exist "%settings_file%" (
  echo 错误: 未找到settings.json文件
  echo 路径: %settings_file%
  goto end
)

:: 修改文件权限
echo 正在修改权限...
icacls "%settings_file%" /grant "%USERNAME%":(F) /T

echo.
echo 完成！现在你应该可以编辑settings.json文件了。
echo 请重新启动VS Code并尝试编辑设置。

:end
pause
