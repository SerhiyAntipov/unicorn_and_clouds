function obj_unicorn_position(object)

    object.onCreate = function(args)
       
        ' '###
        ' '### Create game bg 
        bg_bg = m.game.getBitmap("bg_bg")
		width = bg_bg.GetWidth()
		height = bg_bg.GetHeight()
		region = CreateObject("roRegion", bg_bg, 0, 0, width, height)
		m.addImage("clouds_bg", region,{ offset_x:(1280-width)/2, offset_y:(720-height)/2})

        ' ### 
        ' ### Create earth bg
        bg_earth = m.game.getBitmap("bg_earth")
        width = bg_earth.GetWidth()
        height = bg_earth.GetHeight()
        region = CreateObject("roRegion", bg_earth, 0, 0, width, height)
        m.addImage("bg_earth", region,{ offset_x:(1280-width)/2+11, offset_y:(720-height)+20, alpha: 255})

        shelfs_shelfs_left = m.game.getBitmap("shelfs_shelfs_left")
        width = shelfs_shelfs_left.GetWidth()
        height = shelfs_shelfs_left.GetHeight()
        region = CreateObject("roRegion", shelfs_shelfs_left, 0, 0, width, height)
        m.addImage("shelfs_shelfs_left", region,{ offset_x:(1280-width)/2 - 344, offset_y:(720-height)/2 + 15, alpha: 255})
    

        shelfs_shelfs_right = m.game.getBitmap("shelfs_shelfs_right")
        width = shelfs_shelfs_right.GetWidth()
        height = shelfs_shelfs_right.GetHeight()
        region = CreateObject("roRegion", shelfs_shelfs_right, 0, 0, width, height)
        m.addImage("shelfs_shelfs_right", region,{ offset_x:(1280-width)/2 + 344, offset_y:(720-height)/2 + 15, alpha: 255})

        '###
        '### Create array unicorn posistion
        m.game.unicorn_position = {
			position_left: true
			position_right: false
			position_top: false
			position_bottom: true
        }
        
        '###    
        '### Create img  unicorn + basket
        unicorn_left = m.game.getBitmap("unicorn_left")
        width = unicorn_left.GetWidth()
        height = unicorn_left.GetHeight()
        region = CreateObject("roRegion", unicorn_left, 0, 0, width, height)
        m.addImage("unicorn_left_image", region,{ offset_x:(1280-width)/2 + 15, offset_y:(720-height)/2 + 100, alpha: 0, class: "unicorn"})

        unicorn_right = m.game.getBitmap("unicorn_right")
        width = unicorn_right.GetWidth()
        height = unicorn_right.GetHeight()
        region = CreateObject("roRegion", unicorn_right, 0, 0, width, height)
        m.addImage("unicorn_right_image", region,{ offset_x:(1280-width)/2 - 15, offset_y:(720-height)/2 + 100, alpha: 0, class: "unicorn"})

        basket_left_top = m.game.getBitmap("basket_left_top")
        width = basket_left_top.GetWidth()
        height = basket_left_top.GetHeight()
        region = CreateObject("roRegion", basket_left_top, 0, 0, width, height)
        m.addImage("basket_left_top_image", region,{ offset_x:(1280-width)/2 - 128, offset_y:(720-height)/2 + 68, alpha: 0, class: "basket"})
        
        basket_left_bottom = m.game.getBitmap("basket_left_bottom")
        width = basket_left_bottom.GetWidth()
        height = basket_left_bottom.GetHeight()
        region = CreateObject("roRegion", basket_left_bottom, 0, 0, width, height)
        m.addImage("basket_left_bottom_image", region,{ offset_x:(1280-width)/2 - 125, offset_y:(720-height)/2 + 118, alpha: 0, class: "basket"})

        basket_right_top = m.game.getBitmap("basket_right_top")
        width = basket_right_top.GetWidth()
        height = basket_right_top.GetHeight()
        region = CreateObject("roRegion", basket_right_top, 0, 0, width, height)
        m.addImage("basket_right_top_image", region,{ offset_x:(1280-width)/2 + 128, offset_y:(720-height)/2 + 68, alpha: 0, class: "basket"})

        basket_right_bottom = m.game.getBitmap("basket_right_bottom")
        width = basket_right_bottom.GetWidth()
        height = basket_right_bottom.GetHeight()
        region = CreateObject("roRegion", basket_right_bottom, 0, 0, width, height)
        m.addImage("basket_right_bottom_image", region,{ offset_x:(1280-width)/2 + 125, offset_y:(720-height)/2 + 118, alpha: 0, class: "basket"})

        '###    
        '### Create clone img
        m.unicorn_left_image = m.getImage("unicorn_left_image")
        m.unicorn_right_image = m.getImage("unicorn_right_image")
        m.basket_left_top = m.getImage("basket_left_top_image")
        m.basket_left_bottom = m.getImage("basket_left_bottom_image")
        m.basket_right_top = m.getImage("basket_right_top_image")
        m.basket_right_bottom = m.getImage("basket_right_bottom_image")


    end function
  
    object.onButton = function(code as integer)
        if code = 2 then
            m.game.unicorn_position.position_top = true
            m.game.unicorn_position.position_bottom = false
        else if code = 3 then
            m.game.unicorn_position.position_bottom = true
            m.game.unicorn_position.position_top = false
        else if code = 4 then
            m.game.unicorn_position.position_left = true
            m.game.unicorn_position.position_right = false
        else if code = 5 then
            m.game.unicorn_position.position_right = true
            m.game.unicorn_position.position_left = false
        end if
	end function

    object.onUpdate = function(dt) 
    end function

    object.onDrawBegin = function(canvas)      
    end function  

    object.onDrawEnd = function(canvas)
       
        '###
        '### unicorn left position
        if m.game.unicorn_position.position_left = true then
            m.unicorn_left_image.alpha = 255
            m.unicorn_right_image.alpha = 0
            ' print text 
            ' DrawText(canvas, "unicorn left", canvas.GetWidth()/2, canvas.GetHeight()-70,  m.game.font_SF_Digital_Readout, "center", &h2d2d2dFF)
           
            '###
            '### unicorn left + left top basket position
            if m.game.unicorn_position.position_top = true then                 
                m.basket_left_top.alpha = 255
                m.basket_left_bottom.alpha = 0
                m.basket_right_top.alpha = 0
                m.basket_right_bottom.alpha = 0
                'print text
                ' DrawText(canvas, "basket top", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.font_SF_Digital_Readout, "center", &h2d2d2dFF)
            
            '###
            '### unicorn left + left bottom basket position 
            elseif m.game.unicorn_position.position_bottom = true then
                m.basket_left_top.alpha = 0
                m.basket_left_bottom.alpha = 255
                m.basket_right_top.alpha = 0
                m.basket_right_bottom.alpha = 0
                'print text
                ' DrawText(canvas, "basket bottom", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.font_SF_Digital_Readout, "center", &h2d2d2dFF)
            endif
        
        '###
        '### unicorn right position
        elseif m.game.unicorn_position.position_right = true then           
            m.unicorn_right_image.alpha = 255
            m.unicorn_left_image.alpha = 0
            'print text
            ' DrawText(canvas, "unicorn right", canvas.GetWidth()/2, canvas.GetHeight()-70, m.game.font_SF_Digital_Readout, "center", &h2d2d2dFF)
            
            '###
            '### unicorn right + right top basket position
            if m.game.unicorn_position.position_top = true then
                m.basket_left_top.alpha = 0
                m.basket_left_bottom.alpha = 0
                m.basket_right_top.alpha = 255
                m.basket_right_bottom.alpha = 0
                'print text
                ' DrawText(canvas, "basket top", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.font_SF_Digital_Readout, "center", &h2d2d2dFF)

            '###
            '### unicorn right + right bottom basket position 
            elseif m.game.unicorn_position.position_bottom = true then
                m.basket_left_top.alpha = 0
                m.basket_left_bottom.alpha = 0
                m.basket_right_top.alpha = 0
                m.basket_right_bottom.alpha = 255
                'print text
                ' DrawText(canvas, "basket bottom", canvas.GetWidth()/2, canvas.GetHeight()-100, m.game.font_SF_Digital_Readout, "center", &h2d2d2dFF)
            end if
        end if

    end function

end function