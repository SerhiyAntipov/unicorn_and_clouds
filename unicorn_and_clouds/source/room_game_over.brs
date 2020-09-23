function room_game_over(object)

	object.onCreate = function(args)	

		m.game.started = false

		m.game.playSound("game_over_wav", 100)

		m.game.font_happy_sans = m.game.getFont("font_happy_sans")

		room_game_over_bg = m.game.getBitmap("room_start_bg")
		region = CreateObject("roRegion", room_game_over_bg, 0, 0, room_game_over_bg.GetWidth(), room_game_over_bg.GetHeight())
		m.addImage("bg", region,{ offset_x:(1280-room_game_over_bg.GetWidth())/2, offset_y:(720-room_game_over_bg.GetHeight())/2})
	end function

	object.onUpdate = function(dt)		
	end function

	object.onDrawBegin = function(canvas)	

	end function

	object.onDrawEnd = function(canvas)
		DrawText(canvas, "Game Over", canvas.GetWidth() / 2, canvas.GetHeight()/2 - 300, m.game.font_happy_sans, "center", &h0053c5FF)	
		DrawText(canvas, "Press OK to Play Again", canvas.GetWidth() / 2, canvas.GetHeight()/2 - 250, m.game.font_happy_sans, "center", &h0053c5FF)	
	end function
	
	'###
	'###  click button 
	object.onButton = function(code as integer)
		if code = 0 then
			m.game.End()
		end if
		if code = 6 then
			m.game.changeRoom("room_game")
		end if
	end function

end function