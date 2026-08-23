shader_type spatial;
render_mode unshaded;

//uniform vec4 color : source_color = vec4(1.0);
uniform sampler2D tex : source_color, hint_default_white;
uniform vec3 directional_light = vec3(-0.5);
varying vec3 some_color;

void vertex() {
	some_color = NORMAL;
}

void fragment() {
	ALBEDO = some_color;
	//ALBEDO = texture(tex, UV).rgb * color.rgb;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
