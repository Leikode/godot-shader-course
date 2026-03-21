shader_type canvas_item;

varying vec2 world_pos;
const vec2 CIRCLE_CENTER = vec2(100., 150.);
const float CIRCLE_RADIUS = 200.;

void vertex() {
	world_pos = (MODEL_MATRIX * vec4(VERTEX, 0., 1.)).xy;
}

void fragment() {
	float circle = step(distance(CIRCLE_CENTER, world_pos), CIRCLE_RADIUS);
	COLOR.a -= circle;
}
