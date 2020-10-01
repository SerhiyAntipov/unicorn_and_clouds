function obj_cloud_animated_image(object)

	object.onCreate = function(args)

		' ### 
		' ### Add cloud lose animated 
		frames = []
		for i = 1 to 5
			tex_name = "lost_cloud_0"+i.ToStr()
			texture  = m.game.getBitmap(tex_name)
			region   = CreateObject("roRegion", texture, 0, 0, texture.GetWidth(), texture.GetHeight())
			frames.Push(region)
		end for
		
		m.game.animated_left_cloud = m.addAnimatedImage("animated_left_cloud", frames,{
				index: 0
				offset_x: 1280/2 - 282,
				offset_y: 470, 
				animation_speed: 1500,
				animation_tween: "LinearTween",
				alpha: 255,
				enabled: true,
				loopAnimation: false,
			})

	end function
	
end function
