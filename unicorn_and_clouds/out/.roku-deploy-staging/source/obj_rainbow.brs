function obj_rainbow(object)

	object.onCreate = function(args)
		m.game.rainbow_alpha = 75
		' ### 
		' ### Create rainbow
		bg_rainbow = m.game.getBitmap("bg_rainbow")
		region = CreateObject("roRegion", bg_rainbow, 0, 0, bg_rainbow.GetWidth(), bg_rainbow.GetHeight())
		m.addImage("bg_rainbow", region,{ offset_x:(1280-bg_rainbow.GetWidth())/2, offset_y:(720-bg_rainbow.GetHeight())/2, alpha: m.game.rainbow_alpha})
		
		' m.game.rainbow_alpha = m.images[0]["alpha"]
		' m.game.rainbow_alpha = 255
	end function
	
end function
