function onCreate()
  --makes the sprite and configures it
	makeLuaSprite('streetsWhole', 'phillyStreets/streetsWhole', -500, 0);
	setLuaSpriteScrollFactor('streetsWhole', 0.9, 0.9);
	scaleObject('streetsWhole', 0.5, 0.5);
	setPropertyLuaSprite('streetsWhole', 'flipX', false);
	setPropertyLuaSprite('streetsWhole', 'flipY', false);

  -- if it does not load in high quality them im a dumbass
	if not lowQuality then

		makeLuaSprite('streetWhole', 'phillyStreets/streetsWhole', -500 -300);
		setLuaSpriteScrollFactor('streetsWhole', 0.9, 0.9);
		scaleObject('streetsWhole', 0.5, 0.5);
		setPropertyLuaSprite('streetsWhole', 'flipX', false);
		setPropertyLuaSprite('streetsWhole', 'flipY', false);
	
		setProperty('streetsWhole.antialiasing', true)
		addLuaSprite('streetsWhole', false);




	end

  -- ADDS the sprites (i guess)
	setProperty('streetsWhole.antialiasing', true)
	addLuaSprite('streetsWhole', false);
	close(true);

end
