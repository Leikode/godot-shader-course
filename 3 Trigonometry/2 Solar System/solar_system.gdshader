shader_type canvas_item;

uniform float earth_radius: hint_range(0.005, .2) = .2;
uniform vec3 earth_color: source_color;

uniform float moon_distance_to_earth: hint_range(.3, .8) = 0.4;
uniform float moon_radius: hint_range(0.0025, .1) = .05;
uniform vec3 moon_color: source_color;


uniform float micro_moon_distance_to_moon: hint_range(.03, .16) = 0.08;
uniform float micro_moon_radius: hint_range(0.0025, .05) = .05;
uniform vec3 micro_moon_color: source_color;

void fragment() {
	vec2 uv = (2. * UV) - 1.;
	float earth_mask = step(length(uv), earth_radius);
	
	COLOR.a = earth_mask;
	COLOR.rgb = mix(COLOR.rgb, earth_color, earth_mask);
	
	float moon_x = moon_distance_to_earth * cos(radians(TIME * 90.));
	float moon_y = moon_distance_to_earth * sin(radians(TIME * 90.));
	vec2 moon_center = vec2(moon_x, moon_y);
	float moon_mask = step(distance(uv, moon_center), moon_radius);
	
	COLOR.a += moon_mask;
	COLOR.rgb = mix(COLOR.rgb, moon_color, moon_mask);
	
	float micro_moon_x = moon_x + micro_moon_distance_to_moon * cos(-radians(TIME * 90.));
	float micro_moon_y = moon_y + micro_moon_distance_to_moon * sin(-radians(TIME * 90.));
	vec2 micro_moon_center = vec2(micro_moon_x, micro_moon_y);
	float micro_moon_mask = step(distance(uv, micro_moon_center), micro_moon_radius);
	
	COLOR.a += micro_moon_mask;
	COLOR.rgb = mix(COLOR.rgb, micro_moon_color, micro_moon_mask);
}

