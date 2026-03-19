shader_type canvas_item;

varying vec2 vertex_varying;

void vertex() {
	VERTEX.x += sin(VERTEX.y * 10.) * 40.;
	vertex_varying = VERTEX;
}


void fragment() {
	COLOR.rgb = vec3(vertex_varying, 0.);
}