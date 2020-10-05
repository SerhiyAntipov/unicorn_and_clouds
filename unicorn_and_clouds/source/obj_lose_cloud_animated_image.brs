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
		
		m.game.animatedimage_lose_cloud = m.addAnimatedImage("animatedimage_lose_cloud", frames,{
				index: 0
				offset_x: 50,
				offset_y: 240, 
				animation_speed: 1500,	
				animation_tween: "LinearTween",
				alpha: 255,
				enabled: true,
				loopAnimation:false
			})

		m.lastAnimationSpeed = 1480
		m.animatedTimer=createobject("roTimeSpan")
		m.animatedTimer.mark()
	end function

	object.onUpdate = function(dt)
		if m.animatedTimer <> invalid and m.animatedTimer.TotalMilliseconds() >= m.lastAnimationSpeed then   
			m.game.destroyInstance(m)
		end if
		' if m.game.animatedimage_lose_cloud.index = m.game.animatedimage_lose_cloud.regions.Count() - 1 then
		' end if
	end function

	object.onDestroy = function()
		' print "animatedimage_lose_cloud destroyed..."
	end function
	
end function
