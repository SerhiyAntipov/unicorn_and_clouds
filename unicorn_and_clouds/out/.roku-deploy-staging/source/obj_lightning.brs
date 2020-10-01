function obj_lightning(object)

	object.onCreate = function(args)
		
		' ### 
		' ### Add animated image

		lightning_1 = m.game.getBitmap("lightning_1")
		lightning_2 = m.game.getBitmap("lightning_2")
		lightning_3 = m.game.getBitmap("lightning_3")
		
		m.game.lightning_1 = CreateObject("roRegion", lightning_1, 0, 0, lightning_1.GetWidth(), lightning_1.GetHeight())
		m.game.lightning_2 = CreateObject("roRegion", lightning_2, 0, 0, lightning_2.GetWidth(), lightning_2.GetHeight())
		m.game.lightning_3 = CreateObject("roRegion", lightning_3, 0, 0, lightning_3.GetWidth(), lightning_3.GetHeight())
		
		m.game.animatedImage_lightning = m.addAnimatedImage("animatedImage_lightning", [
			m.game.lightning_1, 
			m.game.lightning_2, 
			m.game.lightning_3
			],{
				index: 0
				offset_x: 1280/2 - lightning_1.GetWidth()/2,
				offset_y: 720/2 - lightning_1.GetHeight()/2 - 60, 
				animation_speed: 0,
				animation_tween: "LinearTween",
				alpha: 0,
				enabled: false,
				' alpha: 255,
				' enabled: true,
				' animation_speed: 1500,
			})

	end function
		
	object.onUpdate = function(deltaTime)
		if m.game.scores["lose"] <> invalid then
			if m.game.scores["lose"] = 5 then
				m["game"]["animatedimage_lightning"].alpha = 255
				m["game"]["animatedimage_lightning"].enabled = true
				m["game"]["animatedimage_lightning"].animation_speed = 1500
			end if
		end if
	end function

end function
