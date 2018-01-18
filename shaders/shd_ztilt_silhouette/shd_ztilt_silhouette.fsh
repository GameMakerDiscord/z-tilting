varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 sprite_col = texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor = sprite_col * v_vColour *0.75; // muted colors + alpha for silhouette
}