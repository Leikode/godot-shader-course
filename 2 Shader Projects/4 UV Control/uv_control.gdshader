shader_type canvas_item;

uniform float x: hint_range(0.0, 1.0) = 0.5;
uniform float y: hint_range(0.0, 1.0) = 0.5;

void fragment() {
	//vec2 scaled_uv = UV * 2. - vec2(x, y);
	//vec4 scaled_texture = texture(TEXTURE, scaled_uv);
	//vec2 mask = step(vec2(0.), scaled_uv) * step(scaled_uv, vec2(1.));
	//scaled_texture.a = scaled_texture.a * mask.x * mask.y;
	//COLOR = scaled_texture;
	
	vec2 center_uv = 2. * UV - 1.;
	COLOR.a = step(length(center_uv), 0.5);
	COLOR.rgb = vec3(0., center_uv);
}

