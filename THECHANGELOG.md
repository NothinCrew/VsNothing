1.32.1;

The Startup screen is now toggleable
Added Classic Notesplashes (to match with the Classic Noteskin)
Added legacy Hurt Notes as a fallback to fix a crash that would occur if you turned off "Enable Color Shader" and added a Hurt Note
Reverted the Playable Character system as it made it harder to make playable characters
Fixed a bug where if you took a screenshot right as you transitioned through a menu/song it would break
Fixed an issue where certain 0.7 noteskins would make the notes smaller than the strums (only applies to PlayState because i couldn't fix it in the editor)
Fixed Hurt Notes keeping their texture way beyond being created OR its texture being reverted to default when it shouldn't.
Fixed Pixel Sustain Notes being too large
Fixed Hurt Notes/Character specific Noteskins being offcenter (Turning off Enable Color shader will uncenter 0.7 noteskins.. but it works so)
Fixed some notes being affected by 0.7 colors if the note is a character-specific texture
Fixed noteSplashes crash if a song has its splash skin set to 'noteSplashes' and the images folder doesn't contain "noteSplashes.png"

Note Color menu-specific:
The engine will now actively refuse to load Pixel Note sprites if the engine can't find any for your specific noteskin.
The RGB shaders now actually update according to whether or not you're in Pixel Mode

1.32.0;

Removed the Results Screen (Unused and broken in the latest versions.)

(!) The Note Color System has been upgraded to the 0.7.X system!! (YOU WILL NEED TO ENTER THE VISUALS & UI MENU TO RESET YOUR NOTESKIN AND SPLASH SKINS TO DEFAULT AS MOST OF THE OPTIONS YOU ALREADY USE HAVE BEEN REMOVED!) If you don't want to use the RGB Shaders the Classic noteskin is also available!

Fixed a possible issue where if you went into another state or paused the game immediately after a big lag spike, a resync would trigger forcing the song to keep playing anyway
Fixed Blammed Erect having the incorrect events
Fixed bf-christmas having funky offsets for the Left & Down animations
Fixed texts made using LUA going to camGame
Fixed vocal resync not working in EditorPlayState