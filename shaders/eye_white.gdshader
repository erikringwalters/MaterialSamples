shader_type spatial;
render_mode unshaded;


void fragment(){


    vec2 uv = UV;

	// width, height
    float a = 0.16;
    float b = 0.375;

	// positions

	// center
	float cx = uv.x - 0.5;
	float cy = uv.y - 0.5;

	float x_offset = 0.075;
	float y_offset = 0.05;

    float xl = cx + x_offset;
	float xr = cx - x_offset;

    float y = cy + y_offset;

    float angle = PI;

	float distancel = pow( xl, 2.0 ) / ( a * a ) + pow( y, 2.0 ) / ( b * b );
	float distancer = pow( xr, 2.0 ) / ( a * a ) + pow( y, 2.0 ) / ( b * b );

	vec3 color = vec3( 1.0, 1.0, 1.0 );
	ALBEDO = color;
	float alpha = 0.0;

	float dist_threshold = 0.15;

	float aa = sqrt(25.0)/VIEWPORT_SIZE.y;
	// draw left eye
	alpha = mix(alpha, 1.0, smoothstep(aa, -aa, distancel - dist_threshold));
	// draw right eye
	alpha = mix(alpha, 1.0, smoothstep(aa, -aa, distancer - dist_threshold));

	// // old process ( needed anti-aliasing )
    //if ( distancel <= dist_threshold || distancer <= dist_threshold)
    //{
		//alpha = 1.0;
    //}
    //else
    //{
		//alpha = 0.0;
    //}
	ALPHA = alpha;
}