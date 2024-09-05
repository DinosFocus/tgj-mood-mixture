shader_type canvas_item;

uniform sampler2D diffuse; // replaces your line 1

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	// Keep only the green channel of the texture :
	vec4 tex = texture(diffuse, UV);
	COLOR = vec4(0.0, tex.g, 0.0, 1.0);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
