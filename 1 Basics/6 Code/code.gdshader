shader_type canvas_item;

void fragment() {
	float diagonal_fade = step((UV.x + UV.y)/2.0, sin(TIME*2.0));
	COLOR.a *= diagonal_fade;
}
