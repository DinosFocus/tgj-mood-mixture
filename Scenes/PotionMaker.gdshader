shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	// Keep only the green channel of the texture :
	vec4 color = texture(TEXTURE, FRAGCOORD.xy / SCREEN_PIXEL_SIZE);
    color.r = 0.0;
    color.b = 0.0;
    COLOR = color;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
