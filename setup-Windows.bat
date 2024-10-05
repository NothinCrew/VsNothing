@echo off
title auto-set-id47 - Installing Haxe and VS
echo Installing dependencies for building...
echo This will install 5 GB of stuff but trust me its going to help
curl -# -O https://download.visualstudio.microsoft.com/download/pr/3105fcfe-e771-41d6-9a1c-fc971e7d03a7/8eb13958dc429a6e6f7e0d6704d43a55f18d02a253608351b6bf6723ffdaf24e/vs_Community.exe
vs_Community.exe --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 --add Microsoft.VisualStudio.Component.Windows10SDK.19041 -p
echo You can delete the setup file later.
curl -L -# -O https://github.com/HaxeFoundation/haxe/releases/download/4.3.6/haxe-4.3.6-win64.exe
haxe-4.3.6-win64.exe
echo You can delete the setup file later.
cls
title auto-set-id47 - Installing dependencies
haxelib setup C:\haxelib
echo haxelib path is C:\haxelib
haxelib --global install hmm
haxelib --global run hmm setup
hmm install
haxelib run lime setup
lime setup mac
lime setup linux
lime setup windows
title auto-set-id47 - You're ready to go!
echo Done!
pause
exit
