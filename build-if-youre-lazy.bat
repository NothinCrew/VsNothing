@echo off
title HaxeFlixel : Building project
echo Building...
lime test windows -debug --haxelib=hxcpp-debug-server --connect 6000
title HaxeFlixel : Project running
echo HaxeFlixel project instance running
pause
exit