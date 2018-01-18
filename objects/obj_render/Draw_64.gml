
var _x = room_width-50;
var _y = room_height-50;
draw_sprite(spr_logo_ariak,0,_x,_y);

var _s="";
_s+="\n[ESC] - exit\n[ENTER] - restart";
_s+="\n[L] - toggle 3d mode: "+string(G.d3d_mode);
_s+="\n[T] - tilt sprites: "+string(tilt);
_s+="\n[M] - toggle alpha testing: "+string(alpha_testing);
_s+="\n[X] - toggle silhouette: "+string(silhouette);
_s+="\n[WASD] - x,y movement\n[C/SPACE] - z movement"
if G.d3d_mode{
	with(obj_cam){ _s+="\nx "+string(x)+"\ny "+string(y)+"\nz "+string(z)}
} else {
	with(obj_player){ _s+="\nx "+string(x)+"\ny "+string(y)+"\nz "+string(z)}
}

draw_text(5,285,_s);