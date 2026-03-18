shader_type canvas_item;

uniform float slope_angle: hint_range(0., 360.);
uniform float thickness: hint_range(0., 1.) = 0.5;

void fragment() {
	float slope = tan(radians(slope_angle));
	
	vec2 uv = (2. * UV) - sin(TIME) - 1.;
	float line = (uv.y - (uv.x * slope));
	float distance_to_line = abs(line) / sqrt(1. + (slope * slope));
	
	float shine_mask = step(distance_to_line, thickness);
	COLOR.rgb = mix(COLOR.rgb, vec3(1.), vec3(shine_mask));
}
