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
				' offset_x: 1280/2 - boss_1.GetWidth()/2,
				offset_x: 442,
				offset_y: 68, 
				' animation_speed: 1500,
				animation_tween: "LinearTween",
				alpha: 255,
				enabled: true,
				loopAnimation: false,
				LoopAction: false,
				running: false,
				Animate: invalid, ' The method that handles animation
			})

	end function
	
	' This is the structure of the methods that can be added to an object

	object.onUpdate = function(deltaTime)
		if m.game.random_number <> invalid then
			if  m.game.random_number = 0 then
				m.game.animatedimage_boss.offset_x = 442
			else if m.game.random_number >= 8 then
				m.game.animatedimage_boss.offset_x = 500
			else if m.game.random_number < 8 then
				m.game.animatedimage_boss.offset_x = 384
			end if  
		end if	
	end function

	' object.onCollision = function(collider, other_collider, other_instance)
	' end function

	' object.onDrawBegin = function(canvas)
	' end function

	' object.onDrawEnd = function(canvas)
	' end function

	' object.onButton = function(code)
	' 	' -------Button Code Reference--------
	' 	' Button  When pressed  When released When Held

	' 	' Back  0  100 1000
	' 	' Up  2  102 1002
	' 	' Down  3  103 1003
	' 	' Left  4  104 1004
	' 	' Right  5  105 1005
	' 	' Select  6  106 1006
	' 	' Instant Replay  7  107 1007
	' 	' Rewind  8  108 1008
	' 	' Fast  Forward  9  109 1009
	' 	' Info  10  110 1010
	' 	' Play  13  113 1013
	' end function

	' object.onECPKeyboard = function(char)
	' end function

	' object.onECPInput = function(data)
	' end function

	' object.onAudioEvent = function(msg)
	' end function

	' object.onPause = function()
	' end function

	' object.onResume = function(pause_time)
	' end function

	' object.onUrlEvent = function(msg)
	' end function

	' object.onGameEvent = function(event, data)
	' end function

	' object.onChangeRoom = function(new_room)
	' end function

	' object.onDestroy = function()
	' end function

end function
