package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.addons.ui.FlxInputText;


class _KeybindsSubState extends MusicBeatSubstate
{
	var textMenuItems:Array<String> = ['LEFT', 'DOWN', 'UP', 'RIGHT'];

    var textMenuItemsINPUT:Array<FlxInputText> = [];

	var selector:FlxSprite;
	var curSelected:Int = 0;

    var inputTextTest:FlxInputText;
    
	var grpOptionsTexts:FlxTypedGroup<FlxText>;

    public function new()
    {
        super();

        inputTextTest = new FlxInputText(0, 0, 150, 'test', 16, FlxColor.BLACK, FlxColor.WHITE, true);

		grpOptionsTexts = new FlxTypedGroup<FlxText>();
		add(grpOptionsTexts);

        FlxG.watch.addQuick("Selected", curSelected);

		selector = new FlxSprite().makeGraphic(5, 5, FlxColor.RED);

		for (i in 0...textMenuItems.length)
		{
			var optionText:FlxText = new FlxText(20, 20 + (i * 50), 0, textMenuItems[i], 32);
			optionText.ID = i;
			optionText.setFormat(Paths.font("vcr.ttf"), 64, FlxColor.WHITE);
			grpOptionsTexts.add(optionText);
		}

    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        if (controls.UP_P)
			curSelected -= 1;

		if (controls.DOWN_P)
			curSelected += 1;

		if (curSelected < 0)
			curSelected = textMenuItems.length - 1;

		if (curSelected >= textMenuItems.length)
			curSelected = 0;

		grpOptionsTexts.forEach(function(txt:FlxText)
		{
			txt.color = FlxColor.WHITE;

			if (txt.ID == curSelected)
				txt.color = FlxColor.YELLOW;
		});

		if (controls.ACCEPT)
		{
			switch (textMenuItems[curSelected])
            {
                // code
            }
		}
	}
}