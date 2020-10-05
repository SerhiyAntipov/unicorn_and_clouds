function room_game_play(object)
		
	object.onCreate = function(args)

		'### 
		'### Get fonts 
		m.game.font_SF_Digital_Readout = m.game.getFont("font_SF_Digital_Readout") 

		' ###
		' ### Load sprites
		' loading_unicorn_sprite = TexturePacker_GetRegions(ParseJson(ReadAsciiFile("pkg:/sprites/unicorn-clouds-sprite.json")),m.game.getBitmap("unicorn-clouds-sprite"))
		
		m.game.createInstance("pause_handler")
		m.game.createInstance("score_handler")
		m.game.createInstance("clouds_position")
		m.game.createInstance("unicorn_position")
						
	end function
	
	'###
	'###  Click button "<-"" 
	object.onButton = function(code as integer)
		if code = 0 then
			m.game.changeRoom("room_game_start")
		end if
	end function
end function