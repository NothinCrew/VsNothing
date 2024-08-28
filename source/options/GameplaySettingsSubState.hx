package options;

import flash.text.TextField;
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

using StringTools;

class GameplaySettingsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Gameplay Settings';
		rpcTitle = 'Gameplay Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option('Controller Mode',
			'Check this if you want to play with\na controller instead of using your Keyboard.',
			'controllerMode',
			'bool',
			false);
		addOption(option);

		//I'd suggest using "Downscroll" as an example for making your own option since it is the simplest here
		var option:Option = new Option('Downscroll', //Name
			'If checked, notes go Down instead of Up, simple enough.', //Description
			'downScroll', //Save data variable name
			'bool', //Variable type
			false); //Default value
		addOption(option);

		var option:Option = new Option('Middlescroll',
			'If checked, your notes get centered.',
			'middleScroll',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Opponent Notes',
			'If unchecked, opponent notes get hidden.',
			'opponentStrums',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Ghost Tapping',
			"If checked, you won't get misses from pressing keys\nwhile there are no notes able to be hit.",
			'ghostTapping',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Auto-Pause if Focus Lost',
			"If unchecked, the game won't pause when your game loses focus.",
			'autoPause',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Complex Accuracy',
			"If checked, accuracy is MS-based instead of rating-based.",
			'complexAccuracy',
			'bool',
			false);
		addOption(option);
		
		var option:Option = new Option('Beginning Sync',
			"If checked, the game will resync the vocals for the first 500ms of a song.",
			'startingSync',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Remove Perfect!! Judgement',
			"If checked, removes the Perfect judgement.",
			'noMarvJudge',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Disable Reset Button',
			"If checked, pressing Reset won't do anything.",
			'noReset',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Disable Chart Editor',
			"If checked, disables the Chart Editor. Try opening it with this option enabled and see what happens!",
			'antiCheatEnable',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Instant Respawn',
			"Instantly respawn when you die.",
			'instaRestart',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('More Spammable Inputs',
			'If checked, the input system is more spammable.',
			'ezSpam',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Shit Gives Miss',
			"If checked, hitting a Shit rating will count as a miss.",
			'shitGivesMiss',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('SGM Intensity:',
			"How intense would you want the threshold for missing from a rating to be?",
			'ratingIntensity',
			'string',
			'Normal',
			['Normal', 'Harsh', 'Very Harsh']);
		addOption(option);

		var option:Option = new Option('Enable Taunt Key',
			"If checked, pressing the Taunt key will make BF go HEY!!",
			'spaceVPose',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Ghost Tapping Plays Anim',
			"If checked, Ghost Tapping will play BF's animations.",
			'ghostTapAnim',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Enable Miss Sound',
			"If checked, re-enables the miss sound when you miss a note.",
			'missSoundShit',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Hitsound Volume',
			'Funny notes does \"Tick!\" when you hit them."',
			'hitsoundVolume',
			'percent',
			0);
		addOption(option);
		option.scrollSpeed = 1.6;
		option.minValue = 0.0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		option.onChange = onChangeHitsoundVolume;

		var hitsoundList:Array<String> = Paths.mergeAllTextsNamed('sounds/hitsounds/list.txt');
		if (hitsoundList.length > 0)
		{
			if (!hitsoundList.contains(ClientPrefs.hitsoundType))
				ClientPrefs.hitsoundType = hitsoundList[0];

			var option:Option = new Option('Hitsound:',
				"What type of hitsound would you like?",
				'hitsoundType',
				'string',
				'osu!mania',
				hitsoundList);
			addOption(option);
		}

		var option:Option = new Option('Rating Offset',
			'Changes how late/early you have to hit for a "Sick!"\nHigher values mean you have to hit later.',
			'ratingOffset',
			'int',
			0);
		option.displayFormat = '%vms';
		option.scrollSpeed = 20;
		option.minValue = -30;
		option.maxValue = 30;
		addOption(option);

		var option:Option = new Option('Perfect! Hit Window',
			'Changes the amount of time you have\nfor hitting a "Perfect!" in milliseconds.',
			'perfectWindow',
			'int',
			22);
		option.displayFormat = '%vms';
		option.scrollSpeed = 15;
		option.minValue = 1;
		option.maxValue = ClientPrefs.sickWindow - 1;
		addOption(option);

		var option:Option = new Option('Sick! Hit Window',
			'Changes the amount of time you have\nfor hitting a "Sick!" in milliseconds.',
			'sickWindow',
			'int',
			45);
		option.displayFormat = '%vms';
		option.scrollSpeed = 15;
		option.minValue = ClientPrefs.perfectWindow + 1;
		option.maxValue = ClientPrefs.goodWindow - 1;
		addOption(option);

		var option:Option = new Option('Good Hit Window',
			'Changes the amount of time you have\nfor hitting a "Good" in milliseconds.',
			'goodWindow',
			'int',
			90);
		option.displayFormat = '%vms';
		option.scrollSpeed = 30;
		option.minValue = ClientPrefs.sickWindow + 1;
		option.maxValue = ClientPrefs.badWindow - 1;
		addOption(option);

		var option:Option = new Option('Bad Hit Window',
			'Changes the amount of time you have\nfor hitting a "Bad" in milliseconds.',
			'badWindow',
			'int',
			135);
		option.displayFormat = '%vms';
		option.scrollSpeed = 60;
		option.minValue = ClientPrefs.goodWindow + 1;
		option.maxValue = 135;
		addOption(option);

		var option:Option = new Option('Safe Frames',
			'Changes how many frames you have for\nhitting a note earlier or late.',
			'safeFrames',
			'float',
			10);
		option.scrollSpeed = 5;
		option.minValue = 2;
		option.maxValue = 20;
		if (ClientPrefs.safeFrames > 10) option.displayFormat = '%v (Will not save)';
		option.changeValue = 0.1;
		addOption(option);
		
		var option:Option = new Option('Voiid-Styled Troll Mode',
			"If checked, Troll Mode's speed change will behave like in Voiid Chronicles 1.5/2.0",
			'voiidTrollMode',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Troll Mode Speed Limit:',
			"Do you want a speed limit on Troll Mode? If so, how high do you want it? \n(Low = 1024x, Medium = 2048x, High = 5120x and Highest = 10000x)",
			'trollMaxSpeed',
			'string',
			'Medium',
			['Disabled', 'Lowest', 'Lower', 'Low', 'Medium', 'High', 'Highest']);
		addOption(option);

		cameras = [FlxG.cameras.list[FlxG.cameras.list.length-1]];

		super();
	}

	function onChangeHitsoundVolume()
	{
		if (ClientPrefs.hitsoundType != 'none'){
			final hitSoundString:String = ClientPrefs.hitsoundType;
			FlxG.sound.play(Paths.sound("hitsounds/" + Std.string(hitSoundString).toLowerCase()), ClientPrefs.hitsoundVolume);
		}
	}
}