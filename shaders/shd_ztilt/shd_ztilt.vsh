/// VERTEX SHADER ///
/*
	Processes 6 verteces per sprite!
	1-3  4-6    Full image (2 triangles)
	**	  *  =>	**
	*	 **		**

	=== z-tilting of sprites ===
	Identify upper verteces, use alpha channel (image_alpha) of object/sprite to determine by
	how many pixels to raise on Z (depth), thus tilting the sprite.

*/

// === Vertex Format === //		// this is the default vertex format that every sprite/object/background/tile in GM uses!
attribute vec3 in_Position;		// (x,y,z)		[as seen in room editor]	sprite (x,y,depth) - corners not sprite origin!
attribute vec4 in_Colour;		// (r,g,b,a)	[0-1]						image_blend(r,g,b) + image_alpha(a) converted from [0-255] to [0-1] range
attribute vec2 in_TextureCoord; // (u,v)		[0-1]						texture page coordinates of sprite

// === Define Output to Fragment === //
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    // === Init Vars === //
	vec4 col = in_Colour;
	vec4 object_space_pos = vec4( in_Position, 1.0);
	
	// === Z-tilting === //
	float top = 1.0-mod( col.b * 255.0, 2.0);		// upper verteces? [0, 1]
	object_space_pos.z-=255.0*col.a*top;			// lift Z of upper verteces towards camera if image_alpha > 0
	object_space_pos.y+=col.a/10.0;					// !OPTIONAL! helps with zfighting
	/*	if 2 sprites overlap exactly z fighting occurs (flickering), by adjusting the y position ever so slightly
		we can alleviate this issue for the most part. Since we use alpha in this case this only works for sprites of
		different sizes, which still solves most of the troubles!	*/
	
	// === UNNECCESARY === //: adds a little color shift to the top verteces. For illustration purposes only.
	//if (top==1.0) { col.rgb = vec3(1.0,0.5,0.5); }
	
	// === To Fragment === //
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    v_vColour = vec4(col.rgb, 1.0); // pass color with full alpha to fragment
    v_vTexcoord = in_TextureCoord;		
}