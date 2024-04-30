shader_type spatial;

uniform float stripe_frequency : hint_range(1, 100) = 10.0;
uniform float stripe_thickness : hint_range(0.01, 1.0) = 0.05;
uniform vec3 stripe_color = vec3(1.0, 1.0, 1.0);

void fragment() {
    vec3 object_pos = (VIEW_MATRIX * vec4(NORMAL, 1.0)).xyz;
    
    float stripe = mod(object_pos.y * stripe_frequency, 1.0);
    
    if (stripe < stripe_thickness || stripe > 1.0 - stripe_thickness) {
        ALBEDO = stripe_color;
    } else {
        ALBEDO = vec3(0.0, 0.0, 0.0);
    }
}