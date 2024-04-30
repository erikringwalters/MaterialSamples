shader_type spatial;
render_mode unshaded;

void fragment(){   
	
    vec2 uv = UV;

	// width, height
    float a = 0.14;
    float b = 0.35;
    
	// positions
	
	// center
	float cx = uv.x - 0.5;
	float cy = uv.y - 0.5;
	
	float x_offset = 0.07;
	float y_offset = 0.025;
	
    float xl = cx + x_offset;
	float xr = cx - x_offset;
	
    float y = cy + y_offset;
    
    float angle = 3.141592654;

	float distancel = pow( xl, 2.0 ) / ( a * a ) + pow( y, 2.0 ) / ( b * b );
	float distancer = pow( xr, 2.0 ) / ( a * a ) + pow( y, 2.0 ) / ( b * b );
	
	vec3 color;    
	float alpha;
	
	float dist_threshold = 0.15;
	
    if ( distancel <= dist_threshold || distancer <= dist_threshold)
    {
        color = vec3( 1.0, 1.0, 1.0 );
		alpha = 1.0;
    }
    else
    {
     	color = vec3( 1.0, 0.25, 0.0 );   
		alpha = 0.0;
    }
	ALBEDO = color;
	ALPHA = alpha;
}