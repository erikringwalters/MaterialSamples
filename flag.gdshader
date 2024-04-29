shader_type spatial;

const vec3 RED = vec3(0.8, 0.1, 0.2);
const vec3 WHITE = vec3(1);

void fragment(){
	vec2 uv = UV;
	uv -= 0.5;
	uv.x *= 800.0/600.0;
	
	float t = -TIME*2.0 + uv.x * 7.0 + uv.y*3.0;
	uv.y += sin(t)*0.5*0.09;
	vec3 color = vec3(0.0);
	float d = length(uv);
	float m = smoothstep(0.3, 0.3 - 0.01, d);
	color  = mix(WHITE, RED, m);
	color *= smoothstep(0.0, -0.01, abs(uv.y) - 0.5);
	color *= 0.8 + cos(t + 5.0) * 0.3;
	
	float a = smoothstep(0.2, 0.2, color.r);
	
	ALBEDO = vec3(color);
}