function obj_game_background(object)

	object.onCreate = function(args)
		
		' '###
        ' '### Create game bg 
        bg_bg = m.game.getBitmap("bg_bg")
		width = bg_bg.GetWidth()
		height = bg_bg.GetHeight()
		region = CreateObject("roRegion", bg_bg, 0, 0, width, height)
		clouds_bg = m.addImage("clouds_bg", region,{ offset_x:(1280-width)/2, offset_y:(720-height)/2})
			
		' ### 
		' ### Create rainbow
		bg_rainbow = m.game.getBitmap("bg_rainbow")
		region = CreateObject("roRegion", bg_rainbow, 0, 0, bg_rainbow.GetWidth(), bg_rainbow.GetHeight())
		m.game.rainbow = m.addImage("bg_rainbow", region,{ offset_x:(1280-bg_rainbow.GetWidth())/2, offset_y:(720-bg_rainbow.GetHeight())/2, alpha: 75})

        ' ### 
        ' ### Create earth bg
        bg_earth = m.game.getBitmap("bg_earth")
        width = bg_earth.GetWidth()
        height = bg_earth.GetHeight()
        region = CreateObject("roRegion", bg_earth, 0, 0, width, height)
        m.addImage("bg_earth", region,{ offset_x:(1280-width)/2+11, offset_y:(720-height)+20, alpha: 255})

        shelfs_shelfs_left = m.game.getBitmap("shelfs_shelfs_left")
        width = shelfs_shelfs_left.GetWidth()
        height = shelfs_shelfs_left.GetHeight()
        region = CreateObject("roRegion", shelfs_shelfs_left, 0, 0, width, height)
        m.addImage("shelfs_shelfs_left", region,{ offset_x:(1280-width)/2 - 344, offset_y:(720-height)/2 + 15, alpha: 255})
    

        shelfs_shelfs_right = m.game.getBitmap("shelfs_shelfs_right")
        width = shelfs_shelfs_right.GetWidth()
        height = shelfs_shelfs_right.GetHeight()
        region = CreateObject("roRegion", shelfs_shelfs_right, 0, 0, width, height)
        m.addImage("shelfs_shelfs_right", region,{ offset_x:(1280-width)/2 + 344, offset_y:(720-height)/2 + 15, alpha: 255})

	end function
	
end function
