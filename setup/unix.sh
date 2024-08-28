#!/bin/sh
# SETUP FOR MAC AND LINUX SYSTEMS!!!
# REMINDER THAT YOU NEED HAXE INSTALLED PRIOR TO USING THIS
# https://haxe.org/download
echo Installing dependencies...
echo This might take a few moments depending on your internet speed.
haxelib install lime
haxelib install openfl
haxelib install flixel 5.6.2
haxelib install flixel-addons 3.2.2
haxelib install flixel-tools 1.5.1
haxelib install flixel-ui	
haxelib install hscript
haxelib install hxcpp-debug-server
haxelib git hxcpp https://github.com/HaxeFoundation/hxcpp/
haxelib git hxCodec https://github.com/polybiusproxy/hxCodec
haxelib git flxanimate https://github.com/ShadowMario/flxanimate dev
haxelib git linc_luajit https://github.com/superpowers04/linc_luajit.git
haxelib git hxdiscord_rpc https://github.com/MAJigsaw77/hxdiscord_rpc
echo Finished!
