shader_type spatial;
render_mode unshaded;

void fragment(){   
	// width, height
    float a = 0.1;
    float b = 0.25;
    
	// positions
	
	// center
	vec2 c = UV - 0.5;
	float cx = UV.x - 0.5;
	float cy = UV.y - 0.5;
	
	float x_offset = 0.065;
	float y_offset = 0.03;
	
    float xl = c.x + x_offset;
	float xr = c.x - x_offset;
	
    float y = c.y + y_offset;
    
    float angle = PI;

	float distancel = pow( xl, 2.0 ) / ( a * a ) + pow( y, 2.0 ) / ( b * b );
	float distancer = pow( xr, 2.0 ) / ( a * a ) + pow( y, 2.0 ) / ( b * b );
	
	vec3 color = vec3( 0.0, 0.0, 0.0 );   
	ALBEDO = color;
	float alpha = 0.0;
	
	float dist_threshold = 0.15;
	
	float aa = sqrt(2.0)/VIEWPORT_SIZE.y;
	// draw left eye
	alpha = mix(alpha, 1.0, smoothstep(aa, -aa, distancel - dist_threshold));
	// draw right eye
	alpha = mix(alpha, 1.0, smoothstep(aa, -aa, distancer - dist_threshold));

	// // old process ( needed anti-aliasing )
    //if ( distancel <= dist_threshold || distancer <= dist_threshold )
    //{
		//alpha = 1.0;
    //}
    //else
    //{ 
		//alpha = 0.0;
    //}
	ALPHA = alpha;
}