attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;
uniform float in_Zcorrection;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 col = in_Colour;
	vec4 object_space_pos = vec4( in_Position.xy, in_Zcorrection, 1.0);
	
	float top = 1.0-mod( col.b * 255.0, 2.0);
	object_space_pos.z-=255.0*col.a*top;
	object_space_pos.y+=col.a/10.0;
	
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    v_vColour = col;
    v_vTexcoord = in_TextureCoord;	
}