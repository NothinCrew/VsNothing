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
haxelib setup C:\HaxeToolKit\haxe\lib
haxelib install flixel 5.5.0
haxelib set flixel 5.5.0
haxelib install flixel-addons 3.2.1
haxelib set flixel-addons 3.2.1
haxelib git flxanimate https://github.com/ShadowMario/flxanimate dev
haxelib git hxCodec https://github.com/polybiusproxy/hxCodec.git
haxelib git hxdiscord_rpc https://github.com/MAJigsaw77/hxdiscord_rpc.git
haxelib install newgrounds
haxelib install lime 8.0.1
haxelib set lime 8.0.1
haxelib git linc_luajit https://github.com/superpowers04/linc_luajit.git
haxelib install openfl 9.3.2
haxelib set openfl 9.3.2
haxelib git SScript https://github.com/SScript-Guy/SScript-new
haxelib install tjson 1.4.0
haxelib set tjson 1.4.0
haxelib git linc_luajit https://github.com/superpowers04/linc_luajit.git
haxelib install openfl 9.3.2
haxelib set openfl 9.3.2
haxelib git SScript https://github.com/SScript-Guy/SScript-new
haxelib install tjson 1.4.0
haxelib set tjson 1.4.0
cls
title auto-set-id47 - Installing Flixel
echo Installing haxe bullshit
haxelib run lime setup flixel
haxelib run lime setup
echo Haxe bullshit done
pause >nul
goto morebullshit

:morebullshit
title auto-set-id47 - Dependencies again yes
haxelib install flixel-tools
haxelib run flixel-tools setup
haxelib set flixel 5.5.0
haxelib set flixel-addons 3.2.1
haxelib set lime 8.0.1
haxelib set openfl 9.3.2
haxelib set tjson 1.4.0
haxelib git SScript https://github.com/SScript-Guy/SScript-new
haxelib git flxanimate https://github.com/ShadowMario/flxanimate dev
haxelib git hxCodec https://github.com/polybiusproxy/hxCodec.git
haxelib git hxdiscord_rpc https://github.com/MAJigsaw77/hxdiscord_rpc.git
title auto-set-id47 - You're ready to go!
echo Done!
pause
exit
