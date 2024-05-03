shader_type spatial;
render_mode unshaded;

void fragment(){   
	// width, height
    float a = 0.1;
    float b = 0.25;
    
	// positions
	
	// center
	float cx = UV.x - 0.5;
	float cy = UV.y - 0.5;
	
	float x_offset = 0.065;
	float y_offset = 0.03;
	
    float xl = cx + x_offset;
	float xr = cx - x_offset;
	
    float y = cy + y_offset;
    
    float angle = PI;

	float distancel = pow( xl, 2.0 ) / ( a * a ) + pow( y, 2.0 ) / ( b * b );
	float distancer = pow( xr, 2.0 ) / ( a * a ) + pow( y, 2.0 ) / ( b * b );
	
	vec3 color = vec3( 0.0, 0.0, 0.0 );   
	ALBEDO = color;
	float alpha = 1.0;
	
	float dist_threshold = 0.15;

    if ( distancel <= dist_threshold || distancer <= dist_threshold )
    {
		alpha = 1.0;
    }
    else
    { 
		alpha = 0.0;
    }
	ALPHA = alpha;
}