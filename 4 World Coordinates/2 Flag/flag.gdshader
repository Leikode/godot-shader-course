shader_type canvas_item;

uniform float speed = 2.;
uniform float frequency_x = 2.;
uniform float amplitude_x = 10.;
uniform float frequency_y = 2.;
uniform float amplitude_y = 10.;
uniform float incline_angle: hint_range(0.0, 360.0) = 45;
uniform float circle_radius: hint_range(0.0, 1.0) = .25;

void vertex() {
	VERTEX.y += sin((UV.x - (TIME * speed)) * frequency_y) * amplitude_y * UV.x;
	VERTEX.x += cos((UV.y - (TIME * speed)) * frequency_x) * amplitude_x * UV.x;
	VERTEX.x += VERTEX.y * -cos(radians(incline_angle));
} 
 
void fragment() {
	float circle = step(distance(UV, vec2(0.5)), circle_radius);
	
	COLOR.a = 1.;
	COLOR.a *= step(UV.x, 1.) * step(0., UV.x) * step(UV.y, 1.) * step(0., UV.y);
	COLOR.rgb = vec3(1.);
	COLOR.rgb = mix(COLOR.rgb, vec3(1., 0., 0.), circle);
}

