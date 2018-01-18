with(obj_cam){
	var matr_view = matrix_build_lookat(x,y,z,
										x+dcos(dir), y-dsin(dir),z-dsin(pitch),
										0,0,1);
	camera_set_view_mat(view_camera[0],matr_view);
}

//var matr_view = matrix_build_lookat(0,0,-100,room_width,room_height,0,0,0,1);