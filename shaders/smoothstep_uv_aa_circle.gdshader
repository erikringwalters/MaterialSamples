shader_type spatial;
render_mode unshaded;

void fragment() {
    // q is normalize to range [0,1]
    vec2 q = UV.xy/VIEWPORT_SIZE.xy;

    // p is in range [-1,1]
    //vec2 p = vec2(1.0, 1.0);
    // Adjust for screen ratio, so that the circle actually looks like circle.
    vec2 p = 0.5 - UV;

    // From FabriceNeyrat2 in the comments
    //  A shorter way to compute p adjusted for screen resolution and ratio
     //vec2 p = ( 2.*FRAGCOORD.xy - UV.xy - vec2(0.5, 0.5) ) / UV.y;

    // Uses the size of the pixel to determine an aa factor
    float aa = sqrt(2.0)/VIEWPORT_SIZE.y;

    vec3 col = vec3(1.0);
	float a = 0.0;
    
    // Circle distance field
    float d = length(p) - 0.1;
    // Create a thin outline
    float od = abs(d-0.05)-aa;

    // Smoothstep the distance field combined with the aa factor to create
    //  a smooth border with little aliasing.
    a = mix(a, 1.0, smoothstep(aa, -aa, d));
    // And the outline
    a = mix(a, 1.0, smoothstep(aa, -aa, od));

    // Approximative linear RGB to sRGB conversion.
    col = sqrt(col);

    ALBEDO = vec3(col);
	ALPHA = a;
}
