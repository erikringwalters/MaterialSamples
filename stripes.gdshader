shader_type spatial;

void fragment() {
	ALBEDO=vec2(float(int(UV.y*8.)&1),1).xyx;
}