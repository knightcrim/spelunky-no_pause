meta.name = "No Pause"
meta.description = "No pausing, instant level transition."
meta.author = "knightcrim"

set_vanilla_sound_callback(VANILLA_SOUND.UI_PAUSE_MENU_ON, VANILLA_SOUND_CALLBACK_TYPE.STARTED, function(pause_on)
    pause_on:stop()
end)

set_vanilla_sound_callback(VANILLA_SOUND.UI_PAUSE_MENU_OFF, VANILLA_SOUND_CALLBACK_TYPE.STARTED, function(pause_off)
    pause_off:stop()
end)

set_callback(function(ctx)
	if not game_manager.game_props.game_has_focus then
		game_manager.pause_ui.visibility = PAUSEUI_VISIBILITY.INVISIBLE
	end
	state.pause = 0
end, ON.RENDER_PRE_PAUSE_MENU)

set_callback(function()
    warp(state.world_next, state.level_next, state.theme_next)
end, ON.TRANSITION)