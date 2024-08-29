// Note combo bullshit

import openfl.media.Sound;

class NoteCombo {
    private var lastMustHit:Bool = false;
    private var noteHits:Int = 0;
    private var seperatedHits:String = "";

    public function new() {
        onCreatePost();
    }

    private function onCreatePost() {
        lastMustHit = mustHitSection;
        var comboSound:Sound = Assets.getSound("comboSound");

        var x:Float = defaultBoyfriendX / 10 + getProperty("boyfriend.x") / 4;
        var y:Float = defaultBoyfriendY / 10 + getProperty("boyfriend.y") / 6 + 300;
        if (getPropertyFromClass("PlayState", "isPixelStage") || getProperty("camGame.zoom") > 1) {
            x -= 180;
            y /= 1.3;
        }
        makeAnimatedHaxeSprite("noteCombo", "noteCombo", x, y);
        setScrollFactor("noteCombo", 0.5, 0.5);

        addAnimationByPrefix("noteCombo", "appear", "appear", 24, false);
        addAnimationByPrefix("noteCombo", "disappear", "disappear", 40, false);

        setProperty("noteCombo.visible", false);
        setProperty("noteCombo.active", false);
        setProperty("noteCombo.antialiasing", getPropertyFromClass("ClientPrefs", "globalAntialiasing"));

        addHaxeSprite("noteCombo", true);

        for (i in 1...4) {
            var tag:String = "noteComboN" + i;
            makeAnimatedHaxeSprite(tag, "noteComboNumbers", x - 170 + i * 160, y + 110 - i * 50);
            setScrollFactor(tag, 0.5, 0.5);
            scaleObject(tag, 0.99, 0.99);
            for (m in 0...10) {
                addAnimationByPrefix(tag, m + "a", m + "_appear", 24, false);
                addAnimationByPrefix(tag, m + "d", m + "_disappear", 24, false);
            }
            setProperty(tag + ".visible", false);
            setProperty(tag + ".active", false);
            addHaxeSprite(tag, true);
        }
    }

    private function animBullshit(anim:String, force:Bool = false) {
        playAnim("noteCombo", anim, force);

        var ox:Float = 0;
        var oy:Float = 0;
        if (anim == "disappear") {
            ox = -150;
        }

        setProperty("noteCombo.offset.x", ox);
        setProperty("noteCombo.offset.y", oy);
    }

    public function onUpdate() {
        if (lastMustHit != mustHitSection) {
            lastMustHit = mustHitSection;
            if (!lastMustHit && noteHits > 12 && (curBeat % 4 == 0 || curBeat % 6 == 0)) {
                playSound("comboSound");

                setProperty("noteCombo.visible", true);
                setProperty("noteCombo.active", true);
                animBullshit("appear", true);

                seperatedHits = "";
                var wtf:String = Std.string(noteHits);
                for (i in 0...3) {
                    var num:String = StringTools.substr(wtf, i, 1);
                    if (num != "") {
                        seperatedHits += num;
                    } else {
                        seperatedHits = " " + seperatedHits;
                    }
                }

                for (i in 1...4) {
                    var tag:String = "noteComboN" + i;
                    var num:String = StringTools.substr(seperatedHits, i - 1, 1);
                    if (num != "" && num != " ") {
                        setProperty(tag + ".visible", true);
                        setProperty(tag + ".active", true);
                        objectPlayAnimation(tag, num + "a");
                    } else {
                        setProperty(tag + ".visible", false);
                        setProperty(tag + ".active", false);
                    }
                }

                noteHits = 0;
            }
        }

        if (getProperty("noteCombo.animation.finished")) {
            var ateUrFrame:String = getProperty("noteCombo.animation.curAnim.name");
            if (ateUrFrame == "appear") {
                animBullshit("disappear");
                for (i in 1...4) {
                    var tag:String = "noteComboN" + i;
                    var num:String = StringTools.substr(seperatedHits, i - 1, 1);
                    if (num != "" && num != " ") {
                        objectPlayAnimation(tag, num + "d");
                    }
                }
            } else if (ateUrFrame == "disappear") {
                setProperty("noteCombo.visible", false);
                setProperty("noteCombo.active", false);
            }
            // not same frame length but who tf cares
            var noteHits:Int = 0;

            public function new() {
            }
        
            function updateFrames(seperatedHits:String) {
                for (i in 1...4) {
                    var tag:String = 'noteComboN' + i;
                    var num:String = StringTools.substr(seperatedHits, i - 1, 1);
                    if (num != '' && num != ' ') {
                        setProperty(tag + '.visible', false);
                        setProperty(tag + '.active', false);
                    }
                }
            }
        
            function goodNoteHit(id:Int, direction:Int, noteType:String, isSustainNote:Bool) {
                if (!isSustainNote) noteHits++;
            }
        
            function noteMissPress() {
                noteHits = 0;
            }
        
            function noteMiss() {
                noteHits = 0;
            }
        
            function setProperty(tag:String, value:Bool) {
        }
    }
}

