shader_type spatial;
render_mode unshaded;

void fragment() {
    // q is normalize to range [0,1]
    vec2 q = FRAGCOORD.xy/VIEWPORT_SIZE.xy;

    // p is in range [-1,1]
    vec2 p = -1.0+2.0*q;
    // Adjust for screen ratio, so that the circle actually looks like circle.
    p.x *= VIEWPORT_SIZE.x/VIEWPORT_SIZE.y;

    // From FabriceNeyrat2 in the comments
    //  A shorter way to compute p adjusted for screen resolution and ratio
    // vec2 p = ( 2.*FRAGCOORD - VIEWPORT_SIZE.xy ) / VIEWPORT_SIZE.y;

    // Uses the size of the pixel to determine an aa factor
    float aa = sqrt(2.0)/VIEWPORT_SIZE.y;

    vec3 col = vec3(0.0);
    
    // Circle distance field
    float d = length(p) - 0.5;
    // Create a thin outline
    float od = abs(d-0.05)-aa;

    // Smoothstep the distance field combined with the aa factor to create
    //  a smooth border with little aliasing.
    col = mix(col, vec3(1.0), smoothstep(aa, -aa, d));
    // And the outline
    col = mix(col, vec3(1.0), smoothstep(aa, -aa, od));

    // Approximative linear RGB to sRGB conversion.
    col = sqrt(col);

    ALBEDO = vec3(col);
	ALPHA = 1.0;
}
