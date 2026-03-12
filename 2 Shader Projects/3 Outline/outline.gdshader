shader_type canvas_item;

uniform vec3 outline_color: source_color = vec3(1.);
uniform float line_thickness: hint_range(0.0, 1.0) = .5;
const float MAX_LINE_THICKNESS = 4.;

void fragment() {	
	vec2 size = TEXTURE_PIXEL_SIZE * line_thickness * MAX_LINE_THICKNESS * sin(TIME);
	vec2 directions[8] = {
		vec2(size.x, 0.),
		vec2(-size.x, 0.),
		vec2(size.x, size.y),
		vec2(-size.x, size.y),
		vec2(size.x, -size.y),
		vec2(-size.x, -size.y),
		vec2(0., -size.y),
		vec2(0., size.y)
	};
	vec4 main_texture = texture(TEXTURE, UV);
	float outline = main_texture.a; 
	
	outline += texture(TEXTURE, UV + directions[0]).a;
	outline += texture(TEXTURE, UV + directions[1]).a;
	outline += texture(TEXTURE, UV + directions[2]).a;
	outline += texture(TEXTURE, UV + directions[3]).a;
	outline += texture(TEXTURE, UV + directions[4]).a;
	outline += texture(TEXTURE, UV + directions[5]).a;
	outline += texture(TEXTURE, UV + directions[6]).a;
	outline += texture(TEXTURE, UV + directions[7]).a;

	outline = min(outline, 1.) - main_texture.a;
	COLOR.a = outline + main_texture.a;
	COLOR.rgb = outline * vec3(1.) + main_texture.rgb;
}