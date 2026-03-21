shader_type canvas_item;

uniform sampler2D screen_texture: hint_screen_texture;

void vertex() {
	COLOR.rgb = vec3(0.,0.5,1.);
}

void fragment() {
	vec3 screen_color = texture(screen_texture, SCREEN_UV).rgb;
	float alpha_water = float(screen_color == vec3(1.,0.,0.)); 
	float alpha_coast = float(screen_color == vec3(0.,1.,0.));
	COLOR.a *= alpha_water * 0.5 + alpha_coast * 0.3;
}