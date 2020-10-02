function obj_clouds_position(object)

    object.onCreate = function(args)  
        ' ### 
        ' ### Create All color clouds img object 

        ' cloud_1 = m.game.getBitmap("cloud_1")
        ' cloud_2 = m.game.getBitmap("cloud_2")
        ' cloud_3 = m.game.getBitmap("cloud_3")
        ' cloud_4 = m.game.getBitmap("cloud_4")
        ' m.region_1 = CreateObject("roRegion", cloud_1, 0, 0, cloud_1.GetWidth(), cloud_1.GetHeight())
        ' m.region_2 = CreateObject("roRegion", cloud_2, 0, 0, cloud_2.GetWidth(), cloud_2.GetHeight())
        ' m.region_3 = CreateObject("roRegion", cloud_3, 0, 0, cloud_3.GetWidth(), cloud_3.GetHeight())
        ' m.region_4 = CreateObject("roRegion", cloud_4, 0, 0, cloud_4.GetWidth(), cloud_4.GetHeight())     
        
		for i = 1 to 4
            img_name = "cloud_" + i.ToStr()
            bitmap_name = "cloud_" + i.ToStr()
            bitmap_name = m.game.getBitmap(img_name)
            region_name = "region_" + i.ToStr() 
			m[region_name] = CreateObject("roRegion", bitmap_name , 0, 0, bitmap_name.GetWidth(), bitmap_name.GetHeight())
		end for

        ' ###   
        ' ### Create array clouds position
        m.game.clouds_position_array = {
            slide_left_top: [0, 0, 0, 0]
            slide_left_bottom: [0, 0, 0, 0]
            slide_right_top: [0, 0, 0, 0]
            slide_right_bottom: [0, 0, 0, 0]
        }

        ' ###
        ' ### Function add random Cloud         
        m.game.random_number = 0
        m.game.random_number_edited = 0
        
        m.addRandomClouds = function ()
            random_number = 0
        
            if m.game.random_number = 0 then
                random_number = RND(16)
                m.game.random_number = RND(16)
            else 
                random_number = m.game.random_number
                m.game.random_number = RND(16)
            end if
       

            ' ###
            ' ### level 
            if m.game.scores.eggs <= 10 then  
                ' ###
                ' ### Light level 
                if  random_number <= 4 or random_number > 8 and random_number <= 12 then
                    random_number = random_number + 4
                end if        
            else if m.game.scores.eggs <= 20 then
                ' ###
                ' ### Medium level      
                m.game.random_number_edited = random_number
            else if m.game.scores.eggs <= 500 then
                ' ###
                ' ### Hard level 
                if random_number <> m.game.random_number_edited then 
                    m.game.random_number_edited = random_number
                else if random_number = m.game.random_number_edited then     
                    random_number = m.game.random_number
                    m.game.random_number_edited = random_number
                    m.game.random_number = RND(16)
                end if 
            end if


            ' ###
            ' ### Random number = slide position
            if random_number <= 4 then
                m.game.random_slide = "slide_left_top"
            elseif random_number <= 8 then
                m.game.random_slide = "slide_left_bottom"
            elseif random_number <= 12 then
                m.game.random_slide = "slide_right_top"
            elseif random_number <=16 then
                m.game.random_slide = "slide_right_bottom"
            end if

            for each item in m.game.clouds_position_array.Items()
                if m.game.random_slide = item.key then
                    m.game.clouds_position_array.[item.key].Unshift(random_number)
                    m.game.clouds_position_array.[item.key].Pop()
                else
                    m.game.clouds_position_array.[item.key].Unshift(0)
                    m.game.clouds_position_array.[item.key].Pop()
                end if
            end for  
           
        end function

        ' ### 
        ' ### Get clouds coordinates 
        ' ### Parse JSON and add to num array
        clouds_position_link_json = "pkg:/config/clouds_coordinates.json"
		m.game.clouds_position_img = ParseJSON(ReadAsciiFile(clouds_position_link_json))

        ' ###
        ' ### Render clouds 
        m.renderClouds = function ()
                
            ' ### 
            ' ### Default offset value 
            offset_x_value = ""
            offset_y_value = ""
            rotation_value = ""

            ' ### For each 1 layer "m.game.clouds_position_img"
            for each item in m.game.clouds_position_img.Items() 
   
                item_key = item.key
                item_value = item.value
                name_img = ""                

                ' ### For 2 layer
                for i = 0 to item_value.Count()-1 step i + 1  
                    if item_key = "slide_left_top" then
                        name_img = "slide_left_top"
                    elseif item_key = "slide_left_bottom" then
                        name_img = "slide_left_bottom"
                    elseif item_key = "slide_right_top" then
                        name_img = "slide_right_top"
                    elseif item_key = "slide_right_bottom" then
                        name_img = "slide_right_bottom"
                    end if

                    alpha_value =  0
                       
                    ' ### Last clouds unvisible - only for triggering en event 
                    if i = item_value.Count() - 1  then
                        alpha_value =  0
                    end if
                   
                    ' ### For each 3 layer
                    for each item in m.game.clouds_position_img.[item_key][i].Items()
                        if item.key = "offset_x" then
                            offset_x_value = item.value
                        elseif item.key = "offset_y" then
                            offset_y_value = item.value
                        elseif item.key = "rotation" then
                            rotation_value = item.value
                        end if
                    end for
                          
                    ' ### 
                    ' ### One selected instant color  any from m.region_1-4
                    m.addImage( name_img.ToStr() + "_" + i.ToStr() , m.region_1,{ offset_x: offset_x_value, offset_y: offset_y_value, alpha: alpha_value, rotation: rotation_value, class: name_img.ToStr(), img_id: i})
                 
                end for 
            end for
        end function
        m.renderClouds()
 
        ' ### 
        ' ### Create clon all clouds img
        m.cloneCloudsImg = function ()      
            m.allCloudsImg = {}
            m.allCloudsImg.slide_left_top = []
            m.allCloudsImg.slide_left_bottom = []
            m.allCloudsImg.slide_right_top = []
            m.allCloudsImg.slide_right_bottom = []
        
            for i = 0 to  m.images.Count()-1 step i + 1 
                if m.images[i]["class"] = "slide_left_top" then
                    m.allCloudsImg.slide_left_top.push(m.images[i])
                elseif m.images[i]["class"] = "slide_left_bottom"  then
                    m.allCloudsImg.slide_left_bottom.push(m.images[i])
                elseif m.images[i]["class"] = "slide_right_top"  then
                    m.allCloudsImg.slide_right_top.push(m.images[i])
                elseif m.images[i]["class"] = "slide_right_bottom"  then
                    m.allCloudsImg.slide_right_bottom.push(m.images[i])
                end if
            end for

        end function
        m.cloneCloudsImg()

        ' ### 
        ' ### Draw active clouds
        m.drawActiveClouds = function ()

            ' ### For each 1 leyer 
            for each item in m.game.clouds_position_array.Items() 
   
                item_key = item.key
                item_value = item.value
                
                ' ### For 2 leyer 
                for  i = 0 to m.game.clouds_position_array[item_key].Count()-1 step i + 1 
                                       
                    ' ### Visuble clouds equal "1" in array "m.game.clouds_position_array"
                    if m.game.clouds_position_array[item_key][i] > 0 then
                        m.allCloudsImg[item_key][i]["alpha"] = 255

                        ' ###
                        ' ### Moving the position of the colored cloud
                        cloudsColor = m.game.clouds_position_array[item_key][i]
                        
                        if (cloudsColor + 3) MOD 4 = 0 then
                            m.allCloudsImg[item_key][i].region = m.region_1
                        end if
                        if (cloudsColor + 2) MOD 4 = 0 then
                            m.allCloudsImg[item_key][i].region = m.region_2
                        end if
                        if (cloudsColor + 1) MOD 4 = 0 then
                            m.allCloudsImg[item_key][i].region = m.region_3
                        end if
                        if cloudsColor MOD 4 = 0 then
                        ' if cloudsColor = 4 or cloudsColor = 8 or cloudsColor = 12 or cloudsColor = 16  then
                            m.allCloudsImg[item_key][i].region = m.region_4
                        end if
                        ' ###

                    else 
                        m.allCloudsImg[item_key][i]["alpha"] = 0
                    end if

                    ' ### Last clouds unvisible - only for triggering en event 
                    if i = m.game.clouds_position_array[item_key].Count()-1  then
                        m.allCloudsImg[item_key][i]["alpha"] = 0
                    end if
                end for

            end for    

        end function

        ' ### Note --------------------------------
        ' ### SetTimeout
        ' m.game.speed = 1000  ' game speed

        ' ###
        ' ### option 1 - using custom acltions
        ' queue = Sequence(m)
		' queue.addAction(DelayTime(m, m.game.speed))
        ' queue.addAction(CallFunc(m, {param:"optional data"}, function(host,data)
        '     host.addRandomClouds()
        '     host.drawActiveClouds()
        ' end function))

        ' LoopAction(m,queue).Run()
        ' ### Note -------------------------------- 
    
        ' ###
        ' ### Using roTimeSpan
        m.game.speed = 1500
        m.game.timer=createobject("roTimeSpan")
        m.game.timer.mark()
        
    end function

    object.onUpdate = function(dt)

        ' ### 
        ' ### Function starts up to 5 lost clouds 
        ' ### If there are more than 5 lost clouds go to the "room_game_over" page
        if m.game.scores["lose"] <= 5 then  
            if m.game.timer.TotalMilliseconds() >= m.game.speed
                m.timerFunc(m.game.timer.TotalMilliseconds())
                m.game.timer.mark()
            end if
        else 
            m.game.started = false        
            m.game.changeRoom("room_game_over")    
        end if 
    end function

    object.timerFunc = function(elapsed)
        ' print "call timerFunc after: " ; elapsed
        m.addRandomClouds()
        m.drawActiveClouds()
       
        m.game.playSound("cloud_move_wav", 100)

        ' ### 
        ' ### Catch game event
        m.game.createInstance("catch_game_event")
    end function
  
end function