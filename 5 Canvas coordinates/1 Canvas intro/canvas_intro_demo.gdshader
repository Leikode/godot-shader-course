shader_type canvas_item;

varying vec2 screen_pos;

uniform sampler2D screen_texture: hint_screen_texture;

void vertex() {
	screen_pos = (CANVAS_MATRIX * MODEL_MATRIX * vec4(VERTEX, 0., 1.)).xy;
}

void fragment() {
	// CANVAS SPACE POS
	//COLOR.rgb = vec3(screen_pos * SCREEN_PIXEL_SIZE, 0.);
	//COLOR.rgb = vec3(VERTEX * SCREEN_PIXEL_SIZE, 0.);
	//COLOR.rgb = vec3(SCREEN_UV, 0.);
	//COLOR.rgb = vec3(FRAGCOORD.xy * SCREEN_PIXEL_SIZE, 0.);
	
	COLOR.rgb = 1. -  texture(screen_texture, SCREEN_UV).rgb;
} 
