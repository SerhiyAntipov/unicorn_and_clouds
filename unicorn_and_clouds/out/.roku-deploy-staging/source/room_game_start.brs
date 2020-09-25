function room_game_start(object)

	object.onCreate = function(args)

		'### 
		'### get fonts 
		m.game.font_SF_Digital_Readout = m.game.getFont("font_SF_Digital_Readout") 
				
		' ### 
		' ### Background img
		room_game_over_bg = m.game.getBitmap("bg_bg")
		region = CreateObject("roRegion", room_game_over_bg, 0, 0, room_game_over_bg.GetWidth(), room_game_over_bg.GetHeight())
		m.addImage("bg", region,{ offset_x:(1280-room_game_over_bg.GetWidth())/2, offset_y:(720-room_game_over_bg.GetHeight())/2})
	
		' ### 
		' ### Boss img
		m.game.createInstance("boss_animated_image") ' NOT WORK !!!! 

		boss_1 = m.game.getBitmap("boss_1")
		width = boss_1.GetWidth()
		height = boss_1.GetHeight()
		region = CreateObject("roRegion", boss_1, 0, 0, width, height)
		m.addImage("boss_1", region,{ offset_x: 1280/2 - boss_1.GetWidth()/2, offset_y: 68})


		' ### 
		' ### Unicorn burned img
		unicorn_left = m.game.getBitmap("unicorn_left")
		width = unicorn_left.GetWidth()
		height = unicorn_left.GetHeight()
		region = CreateObject("roRegion", unicorn_left, 0, 0, width, height)
		m.addImage("unicorn_left", region,{ offset_x:(1280-width)/2 + 25, offset_y:(720-height)/2 + 100})
		
	end function




	object.onDrawEnd = function(canvas)
		DrawText(canvas, "Press OK to Play", canvas.GetWidth() / 2, canvas.GetHeight() - 80, m.game.font_SF_Digital_Readout, "center",  &hae7987FF)	
	end function

	' ####
	' ####  button click "OK"
	object.onButton = function(code as integer)
		if code = 6 then
			m.game.changeRoom("room_game_play")
		end if
	end function

end function