if !G.d3d_mode exit;

// === Basic Cam Movement === //
dir-=(display_mouse_get_x()-display_get_width()/2)/10;
pitch=clamp(pitch-(display_mouse_get_y()-display_get_height()/2)/10, -120, 120);
display_mouse_set(display_get_width()/2, display_get_height()/2);

var _s = spd,
	_xi = keyboard_check(ord("D"))-keyboard_check(ord("A")),
	_yi = keyboard_check(ord("S"))-keyboard_check(ord("W")),
	_zi = keyboard_check(ord("C"))-keyboard_check(vk_space);
x+=_xi*dsin(dir)*_s-_yi*dcos(dir)*_s;
y+=_xi*dcos(dir)*_s+_yi*dsin(dir)*_s;
z+=_zi*_s;
