package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.sound.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.addons.display.FlxBackdrop;
import openfl.display.BlendMode;
import flixel.util.FlxAxes;

class ResultsScreenSubState extends MusicBeatSubstate {
	var background:FlxSprite;
	var resultsText:FlxText;
	var results:FlxText;
	var songNameText:FlxText;
	var difficultyNameTxt:FlxText;
	var judgementCounterTxt:FlxText;

	public var iconPlayer1:HealthIcon;
	public var iconPlayer2:HealthIcon;

	var checker:FlxBackdrop;

	public function new(daResults:Array<Int>, campaignScore:Int, songMisses:Int, ratingPercent:Float, ratingName:String) {
		super();

		var leDate = Date.now();
		if (leDate.getHours() >= 6 && leDate.getHours() <= 18) {
		FlxG.sound.playMusic(Paths.music('PeggleCreditsOST'), 0);
		} else {
		FlxG.sound.playMusic(Paths.music('PeggleNightsProgressOST'), 0);
		}		
		FlxG.sound.music.fadeIn(2, 0, 0.5);

		background = new FlxSprite(0, 0).loadGraphic(Paths.image('aboutMenu'));
		background.scale.set(1.1, 1.1);
		background.color = FlxColor.fromRGB(100, 100, 0);
		if (songMisses == 0 && daResults[1] > 0) background.color = FlxColor.CYAN;
		if (songMisses == 0 && daResults[2] > 0) background.color = FlxColor.GREEN;
		if (songMisses > 0)
		{
			if (ratingPercent >= 90) background.color = FlxColor.CYAN;
			if (ratingPercent >= 80) background.color = FlxColor.GREEN;
			if (ratingPercent >= 70) background.color = FlxColor.YELLOW;
			if (ratingPercent >= 50) background.color = FlxColor.RED;
			if (ratingPercent >= 30) background.color = FlxColor.PURPLE;
			if (ratingPercent < 30) background.color = FlxColor.BLACK;
		}
		background.scrollFactor.set();
		background.updateHitbox();
		background.screenCenter();
		background.antialiasing = ClientPrefs.globalAntialiasing;
		add(background);

		checker = new FlxBackdrop(Paths.image('checker', 'preload'), FlxAxes.XY);
		checker.scale.set(4, 4);
		checker.color = 0xFFb8860b;
		checker.blend = BlendMode.LAYER;
		add(checker);
		checker.scrollFactor.set(0, 0.07);
		checker.alpha = 0.2;
		checker.updateHitbox();

		resultsText = new FlxText(5, 0, 0, 'RESULTS', 72);
		resultsText.scrollFactor.set();
		resultsText.setFormat(Paths.font("vcr.ttf"), 48, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		resultsText.updateHitbox();
		add(resultsText);

		results = new FlxText(5, resultsText.height, FlxG.width, '', 48);
		results.text = 'Perfect: ' + daResults[0] + '\nSicks: ' + daResults[1] + '\nGoods: ' + daResults[2] + '\nBads: ' + daResults[3] + '\nShits: ' + daResults[4];
		results.scrollFactor.set();
		results.setFormat(Paths.font("vcr.ttf"), 24, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		results.updateHitbox();
		add(results);

		songNameText = new FlxText(0, 155, 0, '', 124);
		songNameText.text = "Song: " + PlayState.SONG.song;
		songNameText.scrollFactor.set();
		songNameText.setFormat(Paths.font("vcr.ttf"), 72, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		songNameText.updateHitbox();
		songNameText.screenCenter(X);
		add(songNameText);

		difficultyNameTxt = new FlxText(0, 155 + songNameText.height, 0, '', 100);
		difficultyNameTxt.text = "Difficulty: " + CoolUtil.difficultyString();
		difficultyNameTxt.scrollFactor.set();
		difficultyNameTxt.setFormat(Paths.font('vcr.ttf'), 48, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		difficultyNameTxt.updateHitbox();
		difficultyNameTxt.screenCenter(X);
		add(difficultyNameTxt);

		judgementCounterTxt = new FlxText(0, difficultyNameTxt.y + difficultyNameTxt.height + 45, FlxG.width, '', 86);
		judgementCounterTxt.text = 'Score: ' + campaignScore + '\nMisses: ' + songMisses + '\nAccuracy: ' + ratingPercent + '%\nRating: ' + ratingName;
		judgementCounterTxt.scrollFactor.set();
		judgementCounterTxt.setFormat(Paths.font("vcr.ttf"), 36, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		judgementCounterTxt.updateHitbox();
		judgementCounterTxt.screenCenter(X);
		add(judgementCounterTxt);

		iconPlayer1 = new HealthIcon(PlayState.SONG.player1, true);
		iconPlayer1.setGraphicSize(Std.int(iconPlayer1.width * 1.2));
		iconPlayer1.updateHitbox();
		add(iconPlayer1);

		iconPlayer2 = new HealthIcon(PlayState.SONG.player2, false);
		iconPlayer2.setGraphicSize(Std.int(iconPlayer2.width * 1.2));
		iconPlayer2.updateHitbox();
		add(iconPlayer2);

		resultsText.alpha = 0;
		results.alpha = 0;
		songNameText.alpha = 0;
		difficultyNameTxt.alpha = 0;
		judgementCounterTxt.alpha = 0;
		iconPlayer1.alpha = 0;
		iconPlayer2.alpha = 0;

		iconPlayer1.setPosition(FlxG.width - iconPlayer1.width - 10, FlxG.height - iconPlayer1.height - 15);
		iconPlayer2.setPosition(10, iconPlayer1.y);

		FlxTween.tween(background, {alpha: 1}, 0.4, {ease: FlxEase.quartInOut});
		FlxTween.tween(resultsText, {alpha: 1, y: 5}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.2});
		FlxTween.tween(songNameText, {alpha: 1, y: songNameText.y + 5}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.2});
		FlxTween.tween(difficultyNameTxt, {alpha: 1, y: difficultyNameTxt.y + 5}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.4});
		FlxTween.tween(results, {alpha: 1, y: results.y + 5}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.6});
		FlxTween.tween(judgementCounterTxt, {alpha: 1, y: judgementCounterTxt.y + 5}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.6});
		FlxTween.tween(iconPlayer1, {alpha: 1, y: FlxG.height - iconPlayer1.height - 5}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.8});
		FlxTween.tween(iconPlayer2, {alpha: 1, y: FlxG.height - iconPlayer2.height - 5}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.8});

		cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];

	}

	override function update(elapsed:Float) {
		super.update(elapsed);
		checker.x += 0.45 / (ClientPrefs.framerate / 60);
		checker.y += (0.16 / (ClientPrefs.framerate / 60));

		if (controls.ACCEPT) {
			if (PlayState.isStoryMode)
				FlxG.switchState(StoryMenuState.new);
			else
				PlayState.instance.endSong();
		}
	}
	
	override function destroy(){
		checker = FlxDestroyUtil.destroy(checker);
		super.destroy();
	}
}
