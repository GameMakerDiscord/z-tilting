///@arg 3D
var _d3d = argument0;
if _d3d{
	camera_destroy(view_camera[0]);
	var cam = camera_create(),
		mat_proj = matrix_build_projection_perspective_fov(45,view_wport[0]/view_hport[0],1,32000);
	camera_set_proj_mat(cam,mat_proj);
	view_set_camera(0,cam);
	camera_set_update_script(cam,cam_update);
}
else{
	camera_destroy(view_camera[0]);
	var cam = camera_create();
	camera_set_view_size(cam,room_width,room_height);
	view_set_camera(0,cam);
	//window_set_size(480,270);
}