shader_type spatial;

uniform vec3 color_gap: source_color = vec3(1.0, 0.5, 0.0);
uniform vec3 color_stripe: source_color = vec3(0.05, 0.01, 0.0);
uniform float divisions = 8.0; // increase for more stripe density
uniform float stripe_bias = 2.5; // 1.0 means no stripes; 2.0 means stripes and gaps are equal size
uniform float speed = 0.1;
uniform float angle = 0.7854; // in radians

void fragment() {
	float w = cos(angle) * UV.x + sin(angle) * UV.y - speed * TIME;
	if (floor(mod(w * divisions, stripe_bias)) < 0.0001) {
		ALBEDO = color_gap;
	} else {
		ALBEDO = color_stripe;
	}
}
