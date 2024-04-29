shader_type spatial;

void vertex() {
	VERTEX.y += sin(TIME * 5.0 + VERTEX.x * 1.5) * 0.5;
}

void fragment() {
	vec3 color;
	color.r = (sin(TIME * 6.0 + VERTEX.x * 10.0) + 1.0) * 2.0;
	color.g = (sin(TIME * 5.0 + VERTEX.x * 10.0) + 1.0) * 2.0;
	color.b = (sin(TIME * 5.0 + VERTEX.x * 10.0) + 1.0) * 2.0;
	ALBEDO = color;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
