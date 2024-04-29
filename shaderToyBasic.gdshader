shader_type spatial;
void fragment()
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = FRAGCOORD.xy / 1080.0;

    // Time varying pixel color
    vec3 col = 0.5 + 0.5*cos(TIME+uv.xyx+vec3(0,2,4));

    // Output to screen
    ALBEDO = col;
}