function obj_lose_cloud_animated_image(object)

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
		
		m.cloudAnim = m.addAnimatedImage("animatedimage_lose_cloud", frames,{
				index: 0
				offset_x: 50,
				offset_y: 240, 
				animation_speed: 1500,	
				animation_tween: "LinearTween",
				alpha: 255,
				enabled: true,
				loopAnimation:false
			})

		m.pendingRemoove = false

	end function

	object.onUpdate = function(dt)
		if m.pendingRemoove 
			m.game.destroyInstance(m)
		elseif m.cloudAnim.index = m.cloudAnim.regions.Count() - 1
			m.pendingRemoove = true
		end if
	end function

	object.onDestroy = function()
		print "animatedimage_lose_cloud destroyed..."
	end function
	
end function
