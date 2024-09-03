package options;

import flash.text.TextField;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;
import openfl.display.Stage;
import openfl.Lib;

using StringTools;

class GraphicsSettingsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Graphics';
		rpcTitle = 'Graphics Settings Menu'; //for Discord Rich Presence

		//I'd suggest using "Low Quality" as an example for making your own option since it is the simplest here
		var option:Option = new Option('Low Quality', //Name
			'If checked, disables some background details,\ndecreases loading times and improves performance.', //Description
			'lowQuality', //Save data variable name
			'bool', //Variable type
			false); //Default value
		addOption(option);

		var option:Option = new Option('Anti-Aliasing',
			'If unchecked, disables anti-aliasing, increases performance\nat the cost of sharper visuals.',
			'globalAntialiasing',
			'bool',
			true);
		option.showBoyfriend = true;
		option.onChange = onChangeAntiAliasing; //Changing onChange is only needed if you want to make a special interaction after it changes the value
		addOption(option);

		var option:Option = new Option('Shaders', //Name
			'If unchecked, disables shaders.\nIt\'s used for some visual effects, and also CPU intensive for weaker PCs.', //Description
			'shaders', //Save data variable name
			'bool', //Variable type
			true); //Default value
		addOption(option);

		var option:Option = new Option('GPU Caching', //Name
			"If checked, allows the GPU to be used for caching textures, decreasing RAM usage.\nDon't turn this on if you have a shitty Graphics Card.", //Description
			'cacheOnGPU',
			'bool',
			false); //Don't turn this on by default
		addOption(option);
		
		var option:Option = new Option('Automatic Note Spawn Time', //Name
			"If checked, the Notes' spawn time will instead depend on the scroll speed. \nUseful if you don't want notes just spawning out of thin air. \nNOTE: Disable this if you use Lua Extra Keys!!", //Description
			'dynamicSpawnTime', //Save data variable name
			'bool', //Variable type
			true); //Default value
		addOption(option);

		var option:Option = new Option('Note Spawn Time', //Name
			'Changes how early/close a note needs to be before it appears on screen.', //Description
			'noteSpawnTime', //Save data variable name
			'float', //Variable type
			1); //Default value
		option.scrollSpeed = 2;
		option.minValue = 0.01;
		option.maxValue = 10;
		option.changeValue = 0.1;
		option.displayFormat = '%vX';
		addOption(option);

		// The "Memory Leaks" meme is dead...

		#if !html5 
		#if desktop
		//different res cant really be done on browser lol
		var option:Option = new Option('Resolution: ',
			"What resolution do you want the game to run in?",
			'resolution',
			'string',
			'1280x720',
			//9p,     18p,    36p, 	   72p,       120p,      144p,      270p       360p,      540p,      720p,       1080p (HD),  1440p (FHD),  2160p (UHD, 4K) yeah i went a bit too far with these
			['16x9', '32x18', '64x36', '128x72', '214x120', '256x144', '480x270', '640x360', '960x540', '1280x720', '1920x1080', '2560x1440', '3840x2160']);
		addOption(option);
		option.onChange = onChangeResolution;
		#end
		
		//Apparently other framerates isn't correctly supported on Browser? Probably it has some V-Sync shit enabled by default, idk
		var option:Option = new Option('Framerate',
			"Pretty self explanatory, isn't it?",
			'framerate',
			'int',
			60);
		addOption(option);

		option.scrollSpeed = 120;
		option.minValue = 1;
		option.maxValue = 1000;
		option.displayFormat = '%v FPS';
		option.onChange = onChangeFramerate;
		#end

		cameras = [FlxG.cameras.list[FlxG.cameras.list.length-1]];

		super();
	}

	function onChangeAntiAliasing()
	{
		for (sprite in members)
		{
			var sprite:Dynamic = sprite; //Make it check for FlxSprite instead of FlxBasic
			var sprite:FlxSprite = sprite; //Don't judge me ok
			if(sprite != null && (sprite is FlxSprite) && !(sprite is FlxText)) {
				sprite.antialiasing = ClientPrefs.globalAntialiasing;
			}
		}
	}

	function onChangeFramerate()
	{
		if(ClientPrefs.framerate > FlxG.drawFramerate)
		{
			FlxG.updateFramerate = ClientPrefs.framerate;
			FlxG.drawFramerate = ClientPrefs.framerate;
		}
		else
		{
			FlxG.drawFramerate = ClientPrefs.framerate;
			FlxG.updateFramerate = ClientPrefs.framerate;
		}
	}
	function onChangeResolution() {
		#if desktop
    		var resolutionValue = cast(ClientPrefs.resolution, String); // Assuming 'clientprefs.resolution' holds the selected resolution

    		if (resolutionValue != null) {
        		var parts = resolutionValue.split('x');
        
        		if (parts.length == 2) {
            			var width = Std.parseInt(parts[0]);
            			var height = Std.parseInt(parts[1]);
            
            			if (width != null && height != null) {
					CoolUtil.resetResScale(width, height);
                			FlxG.resizeGame(width, height);
					lime.app.Application.current.window.width = width;
					lime.app.Application.current.window.height = height;
            			}
        		}
    		}
		#end
	}
}