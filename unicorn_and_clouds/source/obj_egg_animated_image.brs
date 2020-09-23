function obj_egg_animated_image(object)

	object.onCreate = function(args)

		' ### 
        ' ### Add animated image left
		egg_broken_left = m.game.getBitmap("egg_broken_left")
		chick_left_01 = m.game.getBitmap("chick_left_01")
		chick_left_02 = m.game.getBitmap("chick_left_02")
		chick_left_03 = m.game.getBitmap("chick_left_03")
		chick_left_04 = m.game.getBitmap("chick_left_04")

		m.game.egg_broken_region_0l = CreateObject("roRegion", egg_broken_left, 0, 0, egg_broken_left.GetWidth(), egg_broken_left.GetHeight())
		m.game.egg_broken_region_1l = CreateObject("roRegion", chick_left_01, 0, 0, chick_left_01.GetWidth(), chick_left_01.GetHeight())
		m.game.egg_broken_region_2l = CreateObject("roRegion", chick_left_02, 0, 0, chick_left_02.GetWidth(), chick_left_02.GetHeight())
		m.game.egg_broken_region_3l = CreateObject("roRegion", chick_left_03, 0, 0, chick_left_03.GetWidth(), chick_left_03.GetHeight())
		m.game.egg_broken_region_4l = CreateObject("roRegion", chick_left_04, 0, 0, chick_left_04.GetWidth(), chick_left_04.GetHeight())
	
		m.game.animatedImage_left_egg = m.addAnimatedImage("animated_left_egg_image", [
			m.game.egg_broken_region_0l,
			m.game.egg_broken_region_1l, 
			m.game.egg_broken_region_2l, 
			m.game.egg_broken_region_3l, 
			m.game.egg_broken_region_4l 
			],{
				index: 0
				offset_x: 1280/2 - 282,
				offset_y: 470, 
				animation_speed: 1500,
				animation_tween: "LinearTween",
				alpha: 255,
				enabled: true,
				loopAnimation: false,
				LoopAction: false
			})

		        
        ' ### 
        ' ### Add animated image right
		egg_broken_right = m.game.getBitmap("egg_broken_right")
		chick_right_01 = m.game.getBitmap("chick_right_01")
		chick_right_02 = m.game.getBitmap("chick_right_02")
		chick_right_03 = m.game.getBitmap("chick_right_03")
		chick_right_04 = m.game.getBitmap("chick_right_04")

		m.game.egg_broken_region_0r = CreateObject("roRegion", egg_broken_right, 0, 0, egg_broken_right.GetWidth(), egg_broken_right.GetHeight())
		m.game.egg_broken_region_1r = CreateObject("roRegion", chick_right_01, 0, 0, chick_right_01.GetWidth(), chick_right_01.GetHeight())
		m.game.egg_broken_region_2r = CreateObject("roRegion", chick_right_02, 0, 0, chick_right_02.GetWidth(), chick_right_02.GetHeight())
		m.game.egg_broken_region_3r = CreateObject("roRegion", chick_right_03, 0, 0, chick_right_03.GetWidth(), chick_right_03.GetHeight())
		m.game.egg_broken_region_4r = CreateObject("roRegion", chick_right_04, 0, 0, chick_right_04.GetWidth(), chick_right_04.GetHeight())
	
		m.game.animatedImage_right_egg = m.addAnimatedImage("animated_right_egg_image", [
			m.game.egg_broken_region_0r,
			m.game.egg_broken_region_1r, 
			m.game.egg_broken_region_2r, 
			m.game.egg_broken_region_3r,
			m.game.egg_broken_region_4r
			],{ 
				index: 0
				offset_x: 1280/2 + 135,
				offset_y: 470, 
				animation_speed: 1500,
				animation_tween: "LinearTween",
				alpha: 255,
				enabled: true,
				loopAnimation: false,
				LoopAction: false
			})
	end function
	
	object.onUpdate = function(dt)
	end function

	object.onButton = function(code as integer)

	end function
	
	object.onDrawEnd = function(canvas as object)
	end function

end function
