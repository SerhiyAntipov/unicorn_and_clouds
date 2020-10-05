function obj_score_handler(object)
   
    object.createInstanceLoseCloud = function()
        m.game.createInstance("lose_cloud_animatedimage", {depth : 10}) 
    end function

    object.onCreate = function(args)
        m.game.createInstance("lightning")
        m.game.createInstance("boss_animated_image")
        ' m.game.createInstance("lose_cloud_animatedimage", {depth : 10}) 'Creating Instance
        ' m.createInstanceLoseCloud() 'NOT Creating Instance  'Creating Instance
       
        ' ### 
        ' ### Add animated image ' remake , move to obj_cloud_animated_image       
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
                 
        ' ### 
        ' ### Add score
        m.game.scores = {
            eggs: 0
            lose: 0
        }
        
    end function

    object.onGameEvent = function(event as string, data as object)    

        if event = "score"
            m.game.scores.eggs =  m.game.scores.eggs + 1
            m.game.playSound("cloud_basket_wav", 100)
        elseif event = "lose" 

            ' m.game.createInstance("lose_cloud_animated_image", {depth : 10}) 'NOT CREATED Instance
            m.createInstanceLoseCloud() 'CREATED, NOT visible Instance
        
            ' ###
            ' ### Check CREATION  Instance lose_cloud_animated_image
            if m.game.animatedimage_lose_cloud = invalid then
                print "instansce animatedimage_lose_cloud NOT CREATED"
            else
                print "animatedimage_lose_cloud CREATED"
            end if



            if data.side = "left" then
                m.game.scores.lose = m.game.scores.lose + 1
                m.game.playSound("cloud_lose_wav", 100)
               
                ' ###
                ' ### Add animated image left 
                ' m["game"]["animatedimage_lose_cloud"].animation_speed = 1500
                ' m["game"]["animatedimage_lose_cloud"].index = 0
                ' m["game"]["animatedimage_lose_cloud"].enabled = true
                ' m["game"]["animatedimage_lose_cloud"].offset_x = 1280/2 - 275


                ' ###
                ' ### Add animated image left ' remake , move to obj_cloud_animated_image
                m.game.animated_left_cloud = m.addAnimatedImage("animated_left_cloud", [
                    m.game.cloud_broken_region_1, 
                    m.game.cloud_broken_region_2, 
                    m.game.cloud_broken_region_3, 
                    m.game.cloud_broken_region_4, 
                    m.game.cloud_broken_region_5 
                    ],{
                        index: 0
                        offset_x: 1280/2 - 275,
                        offset_y: 240, 
                        animation_speed: 1500,
                        animation_tween: "LinearTween",
                        alpha: 255,
                        enabled: true,
                    })
               
            elseif data.side = "right" then
                m.game.scores.lose = m.game.scores.lose + 1
                m.game.playSound("cloud_lose_wav", 100)
                
                ' ###
                ' ### Add animated image right ' remake
                ' m["game"]["animatedimage_lose_cloud"].animation_speed = 1500
                ' m["game"]["animatedimage_lose_cloud"].index = 0
                ' m["game"]["animatedimage_lose_cloud"].enabled = true
                ' m["game"]["animatedimage_lose_cloud"].offset_x = 1280/2 + 275 - 145

                ' ###
                ' ### Add animated image right ' remake , move to obj_cloud_animated_image
                m.game.animated_right_cloud = m.addAnimatedImage("animated_right_cloud", [
                    m.game.cloud_broken_region_1, 
                    m.game.cloud_broken_region_2, 
                    m.game.cloud_broken_region_3, 
                    m.game.cloud_broken_region_4, 
                    m.game.cloud_broken_region_5 
                    ],{
                        index: 0
                        offset_x: 1280/2 + 275 - 145,
                        offset_y: 240, 
                        animation_speed: 1500,
                        animation_tween: "LinearTween",
                        alpha: 255,
                        enabled: true
                    })
            end if  

            ' ###
            ' ### Timer for delete animated image 
            m.game.animatedImageTimer=createobject("roTimeSpan")
            m.game.animatedImageTimer.mark()
        end if
 
        ' ### 
        ' ### If event "lose" global variable entry "m.game.data_side"
        if event = "lose"
            m.game.data_side = data.side
        end if   

        ' ### 
        ' ### Rewriting game speed
        if m.game.scores.eggs >= 225 then
            m.game.speed = 500
        elseif m.game.scores.eggs >= 200 then
            m.game.speed = 600
        elseif m.game.scores.eggs >= 175 then
            m.game.speed = 700
        elseif m.game.scores.eggs >= 150 then
            m.game.speed = 800
        elseif m.game.scores.eggs >= 60 then
            m.game.speed = 900
        elseif m.game.scores.eggs >= 50 then
            m.game.speed = 1000
            m.game.rainbow.alpha = 255
        elseif m.game.scores.eggs >= 40 then
            m.game.speed = 1100
            m.game.rainbow.alpha = 225
        elseif m.game.scores.eggs >= 30 then
            m.game.speed = 1200
            m.game.rainbow.alpha = 195
        elseif m.game.scores.eggs >= 20 then
            m.game.speed = 1300
            m.game.rainbow.alpha = 165
        elseif m.game.scores.eggs >= 10 then
            m.game.speed = 1400
            m.game.rainbow.alpha = 135
        elseif m.game.scores.eggs < 10 then
            m.game.speed = 1500
            m.game.rainbow.alpha = 75
        end if 

        ' ### 
        ' ### Mini pause after egg lose
        if event = "lose" then
            m.game.speed += 1000
        end if 

        ' ### 
        ' ### Drawing egg lose image
        if m.game.scores["lose"] = 1 then
            m.game.animatedimage_boss.index = 1
        else if m.game.scores["lose"] = 2 then
            m.game.animatedimage_boss.index = 2
        else if m.game.scores["lose"] = 3 then 
            m.game.animatedimage_boss.index = 3
        else if m.game.scores["lose"] = 4 then 
            m.game.animatedimage_boss.index = 4
        else if m.game.scores["lose"] = 5 then 
            m.game.speed = 1500
            m.game.random_number = 0
            m.game.musicPause()   
            m.game.playSound("game_over_01_wav", 100)
        end if

    end function

    object.onUpdate = function(dt)
        m.game.loseCloudAnimatedImageSpeed = 1450 ' remake , move to obj_cloud_animated_image
        if m.game.animatedImageTimer <> invalid and m.game.animatedImageTimer.TotalMilliseconds() >= m.game.loseCloudAnimatedImageSpeed then          
            m.deleteAnimatedImage(m.game.data_side)
            
            ' ### 
            ' ### Delete timer 
            m.game.delete("animatedImageTimer")     
        end if
	end function

    ' ### 
    ' ### Delete Animated Image ' remake , move to obj_cloud_animated_image
    object.deleteAnimatedImage = function(side)   
               
        ' ###
        ' ### delete lose_cloud_animated_image
        m.game.delete("animatedimage_lose_cloud")  
                       
        if side = "left" then
            m.removeImage("animated_left_cloud")
        elseif side = "right"  then
            m.removeImage("animated_right_cloud")
        end if

    end function

    object.onDrawEnd = function(canvas as object)

        font = m.game.font_SF_Digital_Readout
    
        DrawText(canvas, "Score" + "  " + m.game.scores.eggs.ToStr(), 1280 - 400, 30, font, "right", &hae7987FF)
        DrawText(canvas, "Lose " + "  " + m.game.scores.lose.ToStr(), 1280 - 750, 30, font, "right", &hae7987FF)   
    end function

end function