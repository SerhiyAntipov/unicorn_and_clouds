sub Main()

	' ###
	' ### Initializes the game engine
	game = new_game(1280, 720, true) ' This initializes the game engine
	m.game = game
	
	' ###
	' ### load bitmap
	game.loadBitmap("basket_left_bottom", "pkg:/sprites/basket_left_bottom.png")
	game.loadBitmap("basket_left_top", "pkg:/sprites/basket_left_top.png")
	game.loadBitmap("basket_right_bottom", "pkg:/sprites/basket_right_bottom.png")
	game.loadBitmap("basket_right_top", "pkg:/sprites/basket_right_top.png")
	game.loadBitmap("chick_right_01", "pkg:/sprites/chick_right_01.png")
	game.loadBitmap("chick_left_01", "pkg:/sprites/chick_left_01.png")
	game.loadBitmap("chick_right_02", "pkg:/sprites/chick_right_02.png")
	game.loadBitmap("chick_left_02", "pkg:/sprites/chick_left_02.png")
	game.loadBitmap("chick_right_03", "pkg:/sprites/chick_right_03.png")
	game.loadBitmap("chick_left_03", "pkg:/sprites/chick_left_03.png")
	game.loadBitmap("chick_right_04", "pkg:/sprites/chick_right_04.png")
	game.loadBitmap("chick_left_04", "pkg:/sprites/chick_left_04.png")
	game.loadBitmap("egg_broken_right", "pkg:/sprites/egg_broken_right.png")
	game.loadBitmap("egg_broken_left", "pkg:/sprites/egg_broken_left.png")
	game.loadBitmap("lose", "pkg:/sprites/lose.png")
	
	' ############################# 

	game.loadBitmap("cloud", "pkg:/sprites/cloud_01.png")
	game.loadBitmap("game_bg_01", "pkg:/sprites/game_bg_01.png")
	game.loadBitmap("game_bg_02", "pkg:/sprites/game_bg_02.png")
	game.loadBitmap("unicorn_left", "pkg:/sprites/unicorn_left.png")
	game.loadBitmap("unicorn_right", "pkg:/sprites/unicorn_right.png")
	game.loadBitmap("room_start_bg", "pkg:/sprites/room_start_bg.jpg")
	game.loadBitmap("boss_1", "pkg:/sprites/boss/boss_1.png")
	game.loadBitmap("boss_2", "pkg:/sprites/boss/boss_2.png")
	game.loadBitmap("boss_3", "pkg:/sprites/boss/boss_3.png")
	game.loadBitmap("boss_4", "pkg:/sprites/boss/boss_4.png")

	' ###
	' ### load sound
	game.loadSound("cloud_basket_wav", "pkg:/sounds/cloud_basket.wav")
	game.loadSound("egg_chip_wav", "pkg:/sounds/egg_chip.wav")
	game.loadSound("cloud_lose_wav", "pkg:/sounds/cloud_lose.wav")
	game.loadSound("cloud_move_wav", "pkg:/sounds/cloud_move.wav")
	game.loadSound("pause_off_wav", "pkg:/sounds/pause_off.wav")
	game.loadSound("pause_on_wav", "pkg:/sounds/pause_on.wav")
	game.loadSound("game_over_wav", "pkg:/sounds/game_over.wav")

	' ###
	' ### load font 
	game.loadFont("font_SF_Digital_Readout", "SF Digital Readout", 36, false, false)
	game.loadFont("font_happy_sans", "Happy Sans", 40, false, false)
	' ###
	' ### load room
	game.defineRoom("room_game", room_game)
	game.defineRoom("room_game_over", room_game_over)
	game.defineRoom("room_start", room_start)
	
	' ###
	' ### load object
	game.defineObject("pause_handler", obj_pause_handler)
	game.defineObject("score_handler", obj_score_handler)
	game.defineObject("unicorn_position", obj_unicorn_position)
	game.defineObject("clouds_position", obj_clouds_position)
	game.defineObject("libTweener", tweener)
	game.defineObject("catch_game_event", obj_catch_game_event)
	game.defineObject("egg_animated_image", obj_egg_animated_image)
	game.defineObject("boss_animated_image", obj_boss_animated_image)

	' ###
	' ### initialize tools and controllers
	game.tweener = game.createInstance("libTweener",{persistent:true})

	' ###
	' ### sellect room
	game.changeRoom("room_start")
	' ### ------------------------------------------
	' ### For test
	game.changeRoom("room_game") 
	' game.changeRoom("room_game_over") 
	' ### ------------------------------------------

	' ###
	' ### start game
	game.Play()
	
end sub