function room_game(object)

	object.onCreate = function(args)
		
		'### 
		'### Get fonts 
		m.game.font_SF_Digital_Readout = m.game.getFont("font_SF_Digital_Readout") 
					
		m.game.createInstance("pause_handler")
		m.game.createInstance("clouds_position")
		m.game.createInstance("score_handler")
		m.game.createInstance("unicorn_position")

		

	end function

	object.onUpdate = function(dt)		
	end function

	object.onDrawBegin = function(canvas)
	end function

	object.onDrawEnd = function(canvas)
		
	end function
	
	'###
	'###  Click button "<-"" 
	object.onButton = function(code as integer)
		if code = 0 then
			m.game.changeRoom("room_start")
		end if
	end function
end function