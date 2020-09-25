function obj_cloud_animated_image(object)

	object.onCreate = function(args)

		' ### 
        ' ### Add cloud lose animated 
		
		lost_cloud_01 = m.game.getBitmap("lost_cloud_01")
		lost_cloud_02 = m.game.getBitmap("lost_cloud_02")
		lost_cloud_03 = m.game.getBitmap("lost_cloud_03")
		lost_cloud_04 = m.game.getBitmap("lost_cloud_04")
		lost_cloud_05 = m.game.getBitmap("lost_cloud_05")

		m.game.cloud_broken_region_1 = CreateObject("roRegion", lost_cloud_01, 0, 0, lost_cloud_01.GetWidth(), lost_cloud_01.GetHeight())
		m.game.cloud_broken_region_2 = CreateObject("roRegion", lost_cloud_02, 0, 0, lost_cloud_02.GetWidth(), lost_cloud_02.GetHeight())
		m.game.cloud_broken_region_3 = CreateObject("roRegion", lost_cloud_03, 0, 0, lost_cloud_03.GetWidth(), lost_cloud_03.GetHeight())
		m.game.cloud_broken_region_4 = CreateObject("roRegion", lost_cloud_04, 0, 0, lost_cloud_04.GetWidth(), lost_cloud_04.GetHeight())
		m.game.cloud_broken_region_5 = CreateObject("roRegion", lost_cloud_05, 0, 0, lost_cloud_05.GetWidth(), lost_cloud_05.GetHeight())
	
		m.game.animated_left_cloud = m.addAnimatedImage("animated_left_cloud", [
			m.game.cloud_broken_region_1, 
			m.game.cloud_broken_region_2, 
			m.game.cloud_broken_region_3, 
			m.game.cloud_broken_region_4, 
			m.game.cloud_broken_region_5 
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

	end function
	
end function
