shader_type canvas_item;

uniform float line_count: hint_range(0.0, 50.) = 20.;
uniform float line_width: hint_range(0.0, 1.0) = 0.2;
uniform float speed: hint_range(0.0, 1.0, 0.1) = 0.3;
uniform float pixel_magnitude: hint_range(1.0, 64.0, 1.0) = 32.;

vec3 hsv2rgb(float hue) {
	vec3 k = vec3(1., 2./3., 1./3.);
	
	vec3 p = abs((fract(vec3(hue) + k) * 6.) - 3.);
	
	return clamp(p - vec3(1.), 0., 1.);
}
 
void fragment() {
	vec2 grid = vec2(pixel_magnitude, pixel_magnitude);
	vec2 pixel_uv = (floor(UV * grid)) / (grid + vec2(-1., -1.));
	
	float diagonal_pos = pixel_uv.x + pixel_uv.y;
	
	float moving_pos = diagonal_pos - (TIME * speed);
	
	float pattern = fract(moving_pos * line_count);
	vec3 rainbow = hsv2rgb(moving_pos);
	float is_line = float(pattern < line_width);
	COLOR.rgb = mix(COLOR.rgb, rainbow, is_line);
}

void vertex() {
	VERTEX.x += sin(VERTEX.y * 5.) * 25.;
}
