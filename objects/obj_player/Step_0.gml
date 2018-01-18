if G.d3d_mode exit;
var _s = spd,
	_xi = keyboard_check(ord("D"))-keyboard_check(ord("A")),
	_yi = keyboard_check(ord("S"))-keyboard_check(ord("W")),
	_zi = keyboard_check(ord("C"))-keyboard_check(vk_space);
x+=_xi*_s;
y+=_yi*_s;
z+=_zi;	// move only one pixel!
depth=clamp(z,-100,99); // clamp to [99 to -100] range to stay within depth region z-tilting shader is applied to!
