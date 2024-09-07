::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDVbTQy+GG6pDaET+NTN/MmIrUEvUfIwa4bP1aaXHOUL+kr2Yaop03hPn/cbBRVccQW4Ug09p1JLtWuLec6fvG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDVbTQy+GGS5E7gZ5vzo092OrEkSQ/F/a4rPz6TOJu8BqmPKU9gozn86
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
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
