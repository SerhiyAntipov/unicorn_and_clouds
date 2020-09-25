function room_game_over(object)

	object.onCreate = function(args)	

		m.game.started = false

		m.game.playSound("game_over_wav", 100)
		
		' ### 
		' ### Background img
		room_game_over_bg = m.game.getBitmap("bg_bg")
		region = CreateObject("roRegion", room_game_over_bg, 0, 0, room_game_over_bg.GetWidth(), room_game_over_bg.GetHeight())
		m.addImage("bg", region,{ offset_x:(1280-room_game_over_bg.GetWidth())/2, offset_y:(720-room_game_over_bg.GetHeight())/2})
	
		' ### 
		' ### Boss img
		boss_5 = m.game.getBitmap("boss_5")
		width = boss_5.GetWidth()
		height = boss_5.GetHeight()
		region = CreateObject("roRegion", boss_5, 0, 0, width, height)
		m.addImage("boss_5", region,{ offset_x: 1280/2 - boss_5.GetWidth()/2, offset_y: 68})
		
		m.game.createInstance("boss_animated_image") ' NOT WORK !!!! 

		' ### 
		' ### Unicorn burned img
		unicorn_burned = m.game.getBitmap("unicorn_burned")
		width = unicorn_burned.GetWidth()
		height = unicorn_burned.GetHeight()
		region = CreateObject("roRegion", unicorn_burned, 0, 0, width, height)
		m.addImage("unicorn_burned", region,{ offset_x:(1280-width)/2, offset_y:(720-height)/2 + 100})

		' ### 
		' ### Unicorn burned img
		lightning_3 = m.game.getBitmap("lightning_3")
		width = lightning_3.GetWidth()
		height = lightning_3.GetHeight()
		region = CreateObject("roRegion", lightning_3, 0, 0, width, height)
		m.addImage("lightning_3", region,{ offset_x:(1280-width)/2, offset_y:(720-height)/2 - 60})

	end function


	object.onDrawEnd = function(canvas)
		DrawText(canvas, "Game Over Press OK to Play Again", canvas.GetWidth() / 2, canvas.GetHeight() - 80, m.game.font_SF_Digital_Readout, "center", &hae7987FF)	
	end function
	
	'###
	'###  click button 
	object.onButton = function(code as integer)
		if code = 0 then
			m.game.End()
		end if
		if code = 6 then
			m.game.changeRoom("room_game_play")
		end if
	end function

end function