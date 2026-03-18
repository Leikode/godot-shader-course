shader_type canvas_item;

uniform float x: hint_range(0.0, 1.0) = 0.5;
uniform float y: hint_range(0.0, 1.0) = 0.5;

uniform float pixel_magnitude: hint_range(1.0, 64.0, 1.0) = 16.;

void fragment() {
	//vec2 scaled_uv = UV * 2. - vec2(x, y);
	//vec4 scaled_texture = texture(TEXTURE, scaled_uv);
	//vec2 mask = step(vec2(0.), scaled_uv) * step(scaled_uv, vec2(1.));
	//scaled_texture.a = scaled_texture.a * mask.x * mask.y;
	//COLOR = scaled_texture;
	
	//vec2 center_uv = 2. * UV - 1.;
	//COLOR.a = step(distance(abs(center_uv.x), 0.5), 0.1);
	//COLOR.rgb = vec3(0., center_uv);
	
	//vec2 grid = floor(UV * 4.);
	//float checker = mix(mod(grid.x + grid.y, 2.), 1., 0.);
	//COLOR.rbg = (1. - checker) * vec3(1.);
	
	vec2 grid = vec2(pixel_magnitude, pixel_magnitude);
	vec2 pixel_uv = (floor(UV * grid)) / (grid + vec2(-1., -1.));
	COLOR.rgb = texture(TEXTURE, pixel_uv).rgb; 
	//COLOR.rgb = vec3(pixel_uv, 0.);
}

