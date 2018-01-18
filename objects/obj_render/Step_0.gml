///@desc Modifiers
if (keyboard_check(vk_escape))	game_end();
if (keyboard_check(vk_enter))	game_restart();
if keyboard_check_pressed(ord("M")) alpha_testing = !alpha_testing;
if keyboard_check_pressed(ord("X")) silhouette = !silhouette;

if keyboard_check_released(ord("L")){
	G.d3d_mode = !G.d3d_mode;
	cam_change(G.d3d_mode);
}
if keyboard_check_pressed(ord("T")){
	tilt = !tilt;
	tilt_layer_sprites(tilt);
}

/* // === Move top down cam === //
if !G.d3d_mode{
	var _cam = view_camera[0];
	var _x = camera_get_view_x(_cam),
		_y = camera_get_view_y(_cam),
		_ix = (keyboard_check(vk_right)-keyboard_check(vk_left)),
		_iy = (keyboard_check(vk_down)-keyboard_check(vk_up));
	camera_set_view_pos(_cam,_x+_ix,_y+_iy);
}
