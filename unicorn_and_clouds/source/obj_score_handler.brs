function obj_score_handler(object)
   
    object.onCreate = function(args)
        m.game.createInstance("lightning")
        m.game.createInstance("boss_animated_image")
                 
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

            m.game.createInstance("lose_cloud_animatedimage") 
        
            if data.side = "left" then
                m.game.scores.lose = m.game.scores.lose + 1
                m.game.playSound("cloud_lose_wav", 100)
               
                ' ###
                ' ### Add animated image left 
                m.game.animatedimage_lose_cloud.offset_x = 1280/2 - 275

            elseif data.side = "right" then
                m.game.scores.lose = m.game.scores.lose + 1
                m.game.playSound("cloud_lose_wav", 100)
                
                ' ###
                ' ### Add animated image right ' remake
                m.game.animatedimage_lose_cloud.offset_x = 1280/2 + 275 - 145
            end if  

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

    object.onDrawEnd = function(canvas as object)

        font = m.game.font_SF_Digital_Readout
    
        DrawText(canvas, "Score" + "  " + m.game.scores.eggs.ToStr(), 1280 - 400, 30, font, "right", &hae7987FF)
        DrawText(canvas, "Lose " + "  " + m.game.scores.lose.ToStr(), 1280 - 750, 30, font, "right", &hae7987FF)   
    end function

end function