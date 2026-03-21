shader_type canvas_item;

uniform sampler2D screen_texture: hint_screen_texture;
uniform float pixel_size = 95;

void fragment() {
	vec4 screen_color = texture(screen_texture, SCREEN_UV);
	float ratio = SCREEN_PIXEL_SIZE.y / SCREEN_PIXEL_SIZE.x;
	vec2 square_uv = vec2(mix(0.5, SCREEN_UV.x, ratio), SCREEN_UV.y); 
	vec2 pixel_uv = floor(square_uv * pixel_size) / pixel_size;
	float dist = distance(vec2(0.5), pixel_uv);
	vec3 gray_scale = vec3(screen_color.b);
	COLOR.rgb = mix(screen_color.rgb, gray_scale, step(dist, 0.25));
}
