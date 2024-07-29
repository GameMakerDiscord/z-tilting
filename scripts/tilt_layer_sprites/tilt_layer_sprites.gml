///@arg tilt
function tilt_layer_sprites(argument0) {
	var _tilt=argument0;
	_layers=["alyr_terrain_mid","alyr_terrain_high"];
	var i=0; repeat(array_length_1d(_layers)){
		var _l = layer_get_id(_layers[i]);
		var _all=layer_get_all_elements(_l);
		var j=0; repeat(array_length_1d(_all)){
			var _e = _all[j];
			if layer_get_element_type(_e) == layerelementtype_sprite {
				var _height = layer_sprite_get_xscale(_e)*sprite_get_height(layer_sprite_get_sprite(_e)); // get total height
				layer_sprite_alpha(_e,_tilt? _height/255 : 0); // convtert to alpha for shader!
				layer_sprite_x(_e,layer_sprite_get_x(_e) div 1);
				layer_sprite_y(_e,layer_sprite_get_y(_e) div 1);
			}
		++j}
		_all = 0;
	++i;}
	with(obj_player){
		image_alpha = _tilt? sprite_height/255 : 0;
	}


}
