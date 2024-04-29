shader_type spatial;

uniform float stripe_width : hint_range(0.0, 1.0) = 0.1; // Width of each stripe
uniform vec3 stripe_colors1 = vec3(0.0, 0.0, 0.0);
uniform vec3 stripe_colors2 = vec3(1.0, 0.3, 0.0); // Black and yellow colors

void fragment() {
    // Calculate the horizontal UV position
    float uv_y = fract(UV.y / stripe_width);

    // Determine which stripe color to use based on the UV position
    vec3 color;
    if (uv_y < 0.5) {
        color = stripe_colors1;
    } else {
        color = stripe_colors2;
    }

    // Output the final pixel color
    ALBEDO = color;
}