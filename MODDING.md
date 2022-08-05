# QUICK MOD GUIDE

With the v2022-8-5 update, I added a bit of a slightly nicer mod support backend.

It's a system that requires some haxe experience.

The basis of it is that you go to ModSubState.hx and add your mod stuff.
also with this system you can have multiple mods in one so yeah your welcome
:]

it should look atleast something with these modifications

line 6 to 7 in ModSubState.hx

``` haxe
var modList:Array<String> = ['myMod'];
var modListVAL:Array<Bool> = [myModVAR];
```

now the rest is up to you, but lets go on with it

line 8 (or where ever you decide to put this var OUTSIDE THE FUNCTIONS)
``` haxe
public var myModVAR:Bool = false;
```

line 61 (or above, prob above 61 since you added new line(s))
``` haxe
case "myMod":
    if (myModVAR == false)
        myModVAR = true;
    else if (myModVAR == true)
        myModVAR = false;
modListVAL.remove(myModVAR);
modListVAL.push(myModVAR);
trace('myMod: ' + myModVAR);
```

now comes to the part of adding your mod, depending on the mod you will need to modify different files, or a file. I cannot document this process since i dont know what kind of mod you want to make, but as long as you know haxe, you can do it, I beleive in you.
