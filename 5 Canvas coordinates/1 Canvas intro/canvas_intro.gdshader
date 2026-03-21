shader_type canvas_item;

uniform sampler2D screen_texture: hint_screen_texture;
uniform float radius: hint_range(.0, .5);
uniform float pixel_magnitude: hint_range(1.0, 64.0, 1.0) = 32.;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 grid = vec2(pixel_magnitude, pixel_magnitude);
	
	vec4 screen_color = texture(screen_texture, SCREEN_UV);
	float ratio = SCREEN_PIXEL_SIZE.y / SCREEN_PIXEL_SIZE.x;
	vec2 square_uv = vec2(mix(0.5, SCREEN_UV.x, ratio), SCREEN_UV.y);
	
	vec2 pixel_uv = (floor(square_uv * grid)) / (grid + vec2(-1., -1.));
	
	float dist = distance(vec2(0.5), pixel_uv);
	vec3 gray_scale = vec3(screen_color.b);
	COLOR.rgb = mix(screen_color.rgb, gray_scale, step(dist, radius)); 
}

