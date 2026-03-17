shader_type canvas_item;

uniform sampler2D scale_curve;
uniform float speed: hint_range(0.0, 5.0) = 1.;

void vertex() {
	//VERTEX.x += sin(TIME) * 30.;
	float curve_forward = fract(TIME * speed);
	//VERTEX *= normalized_curve * 2.;
	float curve_output = texture(scale_curve, vec2(curve_forward, 0.)).r;
	VERTEX *= (1. + curve_output);
}

void fragment() {
	COLOR.rgb = vec3(1.);
}

