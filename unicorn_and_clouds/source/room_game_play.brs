function room_game_play(object)
		
	object.onCreate = function(args)

		'### 
		'### Get fonts 
		m.game.font_SF_Digital_Readout = m.game.getFont("font_SF_Digital_Readout") 

		' ###
		' ### Load sprites
		atlas = ParseJson(ReadAsciiFile("pkg:/sprites/atlas_01.json"))
		bitmap = m.game.getBitmap("atlas_01")

		loading_frames = TexturePacker_GetRegions( atlas , bitmap )
		anim_frames = []
		
		for each item in loading_frames.Items()
			item_key = item.key
			item_value = item.value
			item_value_width = item.value.GetWidth()
			item_value_height = item.value.GetHeight()

			' region = CreateObject("roRegion", item_value, 0, 0, item_value_width, item_value_height)
			' name_image = item_key+"_img" 
			' name_image = m.addImage(name_image, region,{ offset_x:(1280-width)/2, offset_y:(720-height)/2})
			' print item_key
			' print item_value_width
			' print item_value_height
			
		end for
	
		m.game.createInstance("game_background") 
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