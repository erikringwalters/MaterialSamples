shader_type spatial;

uniform float frequency = 10.0;

void fragment()
{
	vec2 uv = FRAGCOORD.xy / 1080.0;
    
    float stripes = frequency * uv.x;
    float rounded = floor(stripes);
    
    if (mod(rounded, 2.0) == 0.0)
    {
     	ALBEDO = vec3(0.6, 0.1, 0.2);   
    }
    else
    {
     	ALBEDO = vec3(0.0, 0.5, 0.6);   
    }
    
}