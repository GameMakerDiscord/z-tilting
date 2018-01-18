/// FRAGMENT SHADER ///
/*
	Processes every pixel of the sprite individually (in parallel)
*/
varying vec2 v_vTexcoord;	// [0-1] - (u,v) coordinates of a single pixel on the texture page
varying vec4 v_vColour;		// [0-1] - (r,g,b,a) image_blend + image_alpha after modifications by vertex shader
uniform float atest;

void main()
{
	vec4 sprite_col = texture2D( gm_BaseTexture, v_vTexcoord ); // grab sprite color at this pixel
	if (atest==1.0 && sprite_col.a < 1.0) { discard; }
	gl_FragColor = sprite_col * v_vColour;
}