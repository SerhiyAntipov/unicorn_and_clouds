function obj_pause_handler(object)

	object.onCreate = function(args)
		' m.persistent = true
		m.pauseable = false
	end function

	object.onButton = function(code as integer)
		
		if code = 13 then
				if not m.game.isPaused() then
					m.game.Pause()
					m.game.timer.mark()
					m.game.playSound("pause_on_wav", 100)
				elseif m.game.isPaused() then 
					m.game.Resume()
					m.game.timer.mark()
					m.game.playSound("pause_off_wav", 100)
				end if
		end if

	end function
	
	object.onDrawBegin = function(canvas as object)
		if m.game.isPaused() then
			DrawText(canvas, "Paused", canvas.GetWidth() / 2, 100, m.game.font_SF_Digital_Readout, "center", &hef91acFF)
		else if not m.game.isPaused() then
			DrawText(canvas, "Play", canvas.GetWidth() / 2, 100, m.game.font_SF_Digital_Readout, "center", &hef91acFF)
		end if
	end function

end function
