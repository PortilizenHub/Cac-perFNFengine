package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class ModSubState extends MusicBeatSubstate
{
    var modList:Array<String> = ['introMod', 'iconMod'];
    var modListVAL:Array<Bool> = [introModVAR, iconModVAR];

    public static var introModVAR:Bool = false;
    public static var iconModVAR:Bool = false;
    public static var splitlsModVAR:Bool = false;

    var curSelected:Int = 0;
	var grpOptionsTexts:FlxTypedGroup<FlxText>;

    public function new():Void
    {
        super();
    }

    override function create()
    {
        super.create();

		grpOptionsTexts = new FlxTypedGroup<FlxText>();
		add(grpOptionsTexts);

        for (i in 0...modList.length)
            {
                var modText:FlxText = new FlxText(20, 20 + (i * 60), 0, modList[i] + ": " + modListVAL[i], 32);
                modText.ID = i;
                grpOptionsTexts.add(modText);
            }
    }
    
        override function update(elapsed:Float)
    {
        super.update(elapsed);

        modListVAL = [introModVAR, iconModVAR];

        if (FlxG.keys.justReleased.ESCAPE)
            FlxG.switchState(new MainMenuState());

        if (controls.UP_P)
			curSelected -= 1;

		if (controls.DOWN_P)
			curSelected += 1;

		if (curSelected < 0)
			curSelected = modList.length - 1;

		if (curSelected >= modList.length)
			curSelected = 0;

		grpOptionsTexts.forEach(function(txt:FlxText)
		{
			txt.alpha = 0.5;

			if (txt.ID == curSelected)
				txt.alpha = 1;

            txt.text = modList[txt.ID] + ": " + modListVAL[txt.ID];
		});

        if (controls.ACCEPT)
            {
                switch (modList[curSelected])
                {
                    case "introMod":
                        if (introModVAR == false)
                            introModVAR = true;
                        else if (introModVAR == true)
                            introModVAR = false;
                        trace('introMod: ' + introModVAR);

                    case "iconMod":
                        if (iconModVAR == false)
                            iconModVAR = true;
                        else if (iconModVAR == true)
                            iconModVAR = false;
                        trace('iconMod: ' + iconModVAR);

                    /*
                    // was ment to be a mod that replaced the health icons with icons made by splitls 
                    case "splitlsMod":
                        if (splitlsModVAR == false)
                            splitlsModVAR = true;
                        else if (splitlsModVAR == true)
                            splitlsModVAR = false;
                    trace('splitlsMod: ' + splitlsModVAR);
                    */

                }
            }
    }
}
