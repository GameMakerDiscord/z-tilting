if event_number!=0 exit; // runs only in GM native draw event: where tiles, backgrounds etc render - or custom code in objects!
with(obj_render){
	switch(renderstate){
		case RenderState.set:
			gpu_set_ztestenable(true);			// ztest what we draw from here on out
			gpu_set_zwriteenable(true);			// fill in the zbuffer with the info of the things being drawn - not just testing
			//gpu_set_alphatestenable(true);	// Alpha testing - handled in the shader, required if we dont use a custom shader!
			//gpu_set_alphatestref(1);
			shader_set(shd_ztilt);
			shader_enable_corner_id(true);		// this is the magic ingredient! it allows us to distinguish which vertex is which in a shader!
			shader_set_uniform_f(shader_get_uniform(shd_ztilt,"atest"),alpha_testing); // uniform is not required for shader to function! merely for illustration purposes!
			renderstate=RenderState.reset;
			break;
		
		case RenderState.reset:
			shader_reset();
			shader_enable_corner_id(false);
			gpu_set_ztestenable(false);
			gpu_set_zwriteenable(false);
			//gpu_set_alphatestenable(false); 
			renderstate=RenderState.set;
			
			// ==== BONUS: Add Character Silhouette === //
			if silhouette{
			/*
				The following code adds a silhouette effect to the player. It does so by drawing the character again, at the same depth value as the player!
				This depth correction is achieved by setting a shader uniform with the desired depth value, and overriding the positiion in the vertexshader.
				The setting of the uniform will incur one batch break per object which is far from optimal. There are much better solutions than doing this 
				once per object, however I feel it is sufficient for this neat bonus addition.
				
				If you wanted the characters silhouette to not be affected by, say the grass bushes, then you would need to draw the bushes AFTER the silhouette
				and the character, so that these positions on the z-buffer are not yet flagged as occluded! Hence we dont want them to hang in the air this 
				would require further z-trickery, such as eg. matrix transforms to get the grass back down to be infront of the characters feet, and not in the sky
				where it draws over the characters head...!
				
			*/
			// set properties
					gpu_set_zfunc(cmpfunc_greater);		// check for occluded pixel instead of non-occluded (cmpfunc_lessequal);
					gpu_set_ztestenable(true);			// a silhouette needs to depth test
					gpu_set_zwriteenable(false);		// but it does NOT need to write onto the z-buffer, this also means we need no alpha testing in the fragment!
					shader_set(shd_ztilt_silhouette);
					shader_enable_corner_id(true);
			
					// draw player
					with(obj_player){
						shader_set_uniform_f(shader_get_uniform(shd_ztilt_silhouette,"in_Zcorrection"),depth); // tiny depth offset so the silhouette of the player does not apply to itself!
						event_perform(ev_draw,0);
					}
			
					// restore defaults!
					shader_reset();
					shader_enable_corner_id(false);
					gpu_set_ztestenable(false);
					gpu_set_zfunc(cmpfunc_lessequal); // default!
			}
			// ================================================= //
			break;
	}
}