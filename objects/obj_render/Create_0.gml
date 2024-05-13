//show_debug_overlay(true);
init_macros();
sprite_index=-1;
window_set_cursor(cr_none);
display_mouse_set(display_get_width()/2, display_get_height()/2);
view_enabled=true;
view_set_visible(0,true);
G.d3d_mode = false;
cam_change(G.d3d_mode);

// === Shift Layers === // - Depth Values are important!
layer_depth(layer_get_id("blyr"),100);
layer_depth(layer_get_id("tiles_low"),GCD);				// one tile width below the ground
layer_depth(layer_get_id("tiles_mid"),0);				// this is ground
layer_depth(layer_get_id("alyr_terrain_mid"),-1);		// assets such as trees / grass ontop
layer_depth(layer_get_id("tiles_high"),-GCD);
layer_depth(layer_get_id("alyr_terrain_high"),-GCD-1);
layer_depth(layer_get_id("ilyr_controllers"),-1000);

// === Layer Scripts === //
enum RenderState{
	set,
	reset,
	size
}
renderstate=RenderState.set; // default

layer_script_end(layer_get_id("blyr"),render_layer_tilemap) // start zbuffering after background has drawn and cleared the screen!
layer_script_end(layer_get_id("tiles_mid"),render_layer_objects) // enable corner IDs for tilting sprites
layer_script_end(layer_get_id("alyr_terrain_mid"),render_layer_tilemap) // disable corner IDs when drawing more tile layers
layer_script_end(layer_get_id("tiles_high"), render_layer_objects) // enable corner IDs again
layer_script_begin(layer_get_id("ilyr_controllers"),render_layer_reset) // end zbuffering before controllers run

/// === Tilt Asset Layer Sprites by modifying the alpha channel === //
tilt=true;
tilt_layer_sprites(tilt);
alpha_testing=true;
silhouette=true;