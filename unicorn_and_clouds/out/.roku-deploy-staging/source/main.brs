sub Main()

	' ###
	' ### Initializes the game engine
	game = new_game(1280, 720, true) ' This initializes the game engine
	m.game = game
	
	' ###
	' ### load bitmap
	
	game.loadBitmap("bg_bg", "pkg:/sprites/bg_bg.png")
	game.loadBitmap("bg_earth", "pkg:/sprites/bg_earth.png")
	game.loadBitmap("bg_rainbow", "pkg:/sprites/bg_rainbow.png")
	game.loadBitmap("shelfs_shelfs_left", "pkg:/sprites/shelfs_shelfs-left.png")
	game.loadBitmap("shelfs_shelfs_right", "pkg:/sprites/shelfs_shelfs-right.png")

	game.loadBitmap("unicorn_left", "pkg:/sprites/unicorn_left.png")
	game.loadBitmap("unicorn_right", "pkg:/sprites/unicorn_right.png")
	game.loadBitmap("basket_left_bottom", "pkg:/sprites/basket_left_bottom.png")
	game.loadBitmap("basket_left_top", "pkg:/sprites/basket_left_top.png")
	game.loadBitmap("basket_right_bottom", "pkg:/sprites/basket_right_bottom.png")
	game.loadBitmap("basket_right_top", "pkg:/sprites/basket_right_top.png")
	
	game.loadBitmap("cloud", "pkg:/sprites/clouds/clouds-little_little-cloud-03.png")
		
	game.loadBitmap("boss_1", "pkg:/sprites/boss/koshkmyak-cloud_koshkmyak-01.png")
	game.loadBitmap("boss_2", "pkg:/sprites/boss/koshkmyak-cloud_koshkmyak-02.png")
	game.loadBitmap("boss_3", "pkg:/sprites/boss/koshkmyak-cloud_koshkmyak-03.png")
	game.loadBitmap("boss_4", "pkg:/sprites/boss/koshkmyak-cloud_koshkmyak-04.png")
	game.loadBitmap("boss_5", "pkg:/sprites/boss/koshkmyak-cloud_koshkmyak-05.png")

	game.loadBitmap("lost_cloud_01", "pkg:/sprites/lost_cloud/lost-cloud-animation_01.png")
	game.loadBitmap("lost_cloud_02", "pkg:/sprites/lost_cloud/lost-cloud-animation_02.png")
	game.loadBitmap("lost_cloud_03", "pkg:/sprites/lost_cloud/lost-cloud-animation_03.png")
	game.loadBitmap("lost_cloud_04", "pkg:/sprites/lost_cloud/lost-cloud-animation_04.png")
	game.loadBitmap("lost_cloud_05", "pkg:/sprites/lost_cloud/lost-cloud-animation_05.png")

	game.loadBitmap("unicorn_burned", "pkg:/sprites/unicorn_unicorn_burned.png")
		
	game.loadBitmap("lightning_1", "pkg:/sprites/lightning/koshkmyak-cloud_lightning.png")
	game.loadBitmap("lightning_2", "pkg:/sprites/lightning/koshkmyak-cloud_lightning_copy.png")
	game.loadBitmap("lightning_3", "pkg:/sprites/lightning/koshkmyak-cloud_lightning_copy_2.png")

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
	
	' ###
	' ### load room
	game.defineRoom("room_game_start", room_game_start)
	game.defineRoom("room_game_play", room_game_play)
	game.defineRoom("room_game_over", room_game_over)
	
	' ###
	' ### load object
	game.defineObject("libTweener", tweener)
	game.defineObject("boss_animated_image", obj_boss_animated_image)
	game.defineObject("catch_game_event", obj_catch_game_event)
	game.defineObject("cloud_animated_image", obj_cloud_animated_image)
	game.defineObject("clouds_position", obj_clouds_position)
	game.defineObject("game_background", obj_game_background)
	game.defineObject("lightning", obj_lightning)
	game.defineObject("pause_handler", obj_pause_handler)
	game.defineObject("score_handler", obj_score_handler)
	game.defineObject("unicorn_position", obj_unicorn_position)
	
	' ###
	' ### initialize tools and controllers
	game.tweener = game.createInstance("libTweener",{persistent:true})

	' ###
	' ### sellect room
	game.changeRoom("room_game_start")
	' ### ------------------------------------------
	' ### For test
	' game.changeRoom("room_game_play") 
	' game.changeRoom("room_game_over") 
	' ### ------------------------------------------

	' ###
	' ### start game
	game.Play()
	
end sub