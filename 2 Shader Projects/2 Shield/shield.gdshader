shader_type canvas_item;

const vec2 CENTER = vec2(0.5);
uniform float radius: hint_range(0.0, 1.0) = 0.5;
uniform float width: hint_range(0.0, 1.0);
uniform float highlight_weight: hint_range(0.0, 1.0) = 1.0;

uniform vec3 main_color: source_color;
uniform vec3 highlight_color: source_color;
uniform float glow: hint_range(0.0, 1.0) = 0.5;
uniform sampler2D noise: repeat_enable;

void vertex() {
	VERTEX += normalize(VERTEX) * sin(TIME) * 5.;
}

void fragment() {
		float texture_alpha = texture(noise, UV - vec2(TIME / 2., 0.)).r; 
		vec2 highlight_center = vec2(CENTER.x + (radius*cos(radians(TIME * 90.))), CENTER.y + (radius*sin(radians(TIME * 90.))));
		
		float circle_main = step(distance(UV, CENTER), radius);
		float circle_inner = smoothstep(width / 2., 1, distance(UV, CENTER));
		
		float highlight_shape = min(step(
			distance(UV, highlight_center) * circle_main, highlight_weight * 0.5
		) + circle_inner - 2. * step(
			1., distance(1., circle_main)
		) - circle_inner, 1.) * circle_main * circle_inner;
		
		highlight_shape = highlight_shape;
		
		float main_shape = (circle_main * circle_inner - highlight_shape) * 1.25 * texture_alpha;
		
		float alpha = main_shape + (highlight_shape * 2.);
		vec3 color = main_shape * main_color + highlight_shape * highlight_color;
		
		COLOR.rgb = color * glow * 5.;
		COLOR.a = alpha;
}
