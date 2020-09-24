function obj_boss_animated_image(object)

	object.onCreate = function(args)
		
		' ### 
        ' ### Add animated image
		boss_1 = m.game.getBitmap("boss_1")
		boss_2 = m.game.getBitmap("boss_2")
		boss_3 = m.game.getBitmap("boss_3")
		boss_4 = m.game.getBitmap("boss_4")
		boss_5 = m.game.getBitmap("boss_5")
		
		m.game.boss_region_1 = CreateObject("roRegion", boss_1, 0, 0, boss_1.GetWidth(), boss_1.GetHeight())
		m.game.boss_region_2 = CreateObject("roRegion", boss_2, 0, 0, boss_2.GetWidth(), boss_2.GetHeight())
		m.game.boss_region_3 = CreateObject("roRegion", boss_3, 0, 0, boss_3.GetWidth(), boss_3.GetHeight())
		m.game.boss_region_4 = CreateObject("roRegion", boss_4, 0, 0, boss_4.GetWidth(), boss_4.GetHeight())
		m.game.boss_region_5 = CreateObject("roRegion", boss_5, 0, 0, boss_5.GetWidth(), boss_5.GetHeight())
			
		m.game.animatedImage_boss = m.addAnimatedImage("animatedImage_boss", [
			m.game.boss_region_1, 
			m.game.boss_region_2, 
			m.game.boss_region_3,
			m.game.boss_region_4,
			m.game.boss_region_5
			],{
				index: 0
				offset_x: 1280/2 - boss_1.GetWidth()/2,
				offset_y: 68, 
				' animation_speed: 1500,
				animation_tween: "LinearTween",
				alpha: 255,
				enabled: true,
				loopAnimation: false,
				LoopAction: false,
				running: false
			})

	end function
	
	object.onUpdate = function(dt)
	end function

	object.onButton = function(code as integer)

	end function
	
	object.onDrawEnd = function(canvas as object)
	end function

end function
