shader_type canvas_item;

uniform float center_size: hint_range(0.0, 1.0) = 0.5;
uniform float crosshair_thickness: hint_range(0.0, 0.2) = 0.05;
uniform float circle_distance: hint_range(0.0, 1.0) = 0.5;
uniform float cross_width: hint_range(0.0, 1.0) = 0.5;
uniform float lines_width: hint_range(0.0, 1.0) = 0.5;
uniform float lines_length: hint_range(0.0, 1.0) = 0.5;
uniform float lines_offset: hint_range(0.0, 1.0) = 0.5;


float create_circles(vec2 uv) {
	const vec2 center = vec2(0.5);
	float circle_center = step(distance(uv, center), center_size * 0.1);
	float outer = step(distance(uv, center), circle_distance);
	float inner = step(distance(uv, center), circle_distance - crosshair_thickness);
	
	float cross_cutout = min(1., step(distance(uv.x, center.x), cross_width * 0.2) + step(distance(uv.y, center.y), cross_width * 0.2));
	
	//float cross_horizontal_upper = center.y - (cross_width * 0.2);
	//float cross_horizontal_bottom = center.y + (cross_width * 0.2);
	//bool horizontal = uv.y >= cross_horizontal_upper && uv.y <= cross_horizontal_bottom;
	//
	//float cross_vertical_upper = center.x - (cross_width * 0.2);
	//float cross_vertical_bottom = center.x + (cross_width * 0.2);
	//bool vertical = uv.x >= cross_vertical_upper && uv.x <= cross_vertical_bottom;
	//
	//if (horizontal || vertical) {
		//return circle_center;
	//}
	
	return circle_center + clamp(outer - inner - cross_cutout, 0., 1.);
}

float create_lines(vec2 uv) {
	vec2 center_distance = vec2(0.5) + lines_offset;
	
	float h_width = step(distance(uv.x, center_distance.x), lines_length * 0.5)
	 				+ step (distance(1.0 - uv.x, center_distance.x), lines_length * 0.5);
	float h_height = step(distance(uv.y, 0.5), lines_width * 0.2);
	
	float v_height = step(distance(uv.y, center_distance.y), lines_length * 0.5)
	 				+ step (distance(1.0 - uv.y, center_distance.y), lines_length * 0.5);
	float v_width = step(distance(uv.x, 0.5), lines_width * 0.2);
	
	return h_height * h_width + v_height * v_width;
	
	//float x_dist = distance(uv.x, center.x);
	//float y_dist = distance(uv.y, center.y);
	//
	//float cross_cutout = min(
		//step(x_dist, lines_width * 0.2) 
		//+ step(y_dist, lines_width * 0.2),
		//1.
	//);
	//
	//float lines_start = lines_offset;
	//float lines_end = min(lines_start + lines_length, 1.);
	//
	//float left_most = 0.5 - lines_end;
	//float right_most = left_most + lines_length;
	//
	//bool is_on_horizontal_range = (uv.x >= left_most && uv.x <= right_most) || (uv.x >= 0.5 + lines_offset && uv.x <= 0.5 + lines_offset + lines_length);
	//bool is_on_vertical_range = (uv.y >= left_most && uv.y <= 0.5 - lines_start) || (uv.y >= 0.5 + lines_offset && uv.y <= 0.5 + lines_offset + lines_length);
	//if ((cross_cutout == 1.) && (is_on_horizontal_range || is_on_vertical_range)) {
		//return 1.;
	//}
	//
	//return 0.;
}

void fragment() {
	COLOR.rgb = vec3(1);
	COLOR.a = create_circles(UV) + create_lines(UV);
}

