function room_start(object)

	object.onCreate = function(args)
	
		'### 
		'### get fonts 
		m.game.font_happy_sans = m.game.getFont("font_happy_sans")
		'####
		'#### create static backgroung and UI in room
		room_start_bg = m.game.getBitmap("room_start_bg")
		from_x = 0
		from_y = 0
		width = room_start_bg.GetWidth()
		height = room_start_bg.GetHeight()
		region = CreateObject("roRegion", room_start_bg, from_x, from_y, width, height)
		m.addImage("bg", region,{ offset_x:(1280-width)/2, offset_y:(720-height)/2})
	end function

	object.onUpdate = function(dt)
	end function

	' draw lowest layer in game  (below any static sprites)
	object.onDrawBegin = function(canvas)
	end function

	' draw top layer in game  (above any static sprites)
	object.onDrawEnd = function(canvas)
		DrawText(canvas, "Press OK to Play", canvas.GetWidth() / 2, canvas.GetHeight()/2 - 250, m.game.font_happy_sans, "center", &h0053c5FF)	
	end function

	' ####
	' ####  button click "OK"
	object.onButton = function(code as integer)
		if code = 6 then
			m.game.changeRoom("room_game")
		end if
	end function

end function