shader_type spatial;

void fragment(){   
 // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = UV;

	
    float a = 0.15;
    float b = 0.4;
    
    float x = uv.x - 0.45;
    float y = uv.y - 0.5;
    
    float angle = 3.141592654;
    float x2 = x * cos( angle ) + y * sin( angle );
    float y2 = y * cos( angle ) - x * sin( angle );

	
	float distance = pow( x, 2.0 ) / ( a * a ) + pow( y, 2.0 ) / ( b * b );
	vec3 color;    
	float alpha;
    if ( distance <= 0.1 )
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