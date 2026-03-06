shader_type canvas_item;

uniform float center_size: hint_range(0.0, 1.0) = 0.5;
uniform float crosshair_thickness: hint_range(0.0, 0.2) = 0.05;
uniform float circle_distance: hint_range(0.0, 1.0) = 0.5;
uniform float cross_width: hint_range(0.0, 1.0) = 0.5;


float create_circles(vec2 uv) {
	const vec2 center = vec2(0.5);
	float circle_center = step(distance(uv, center), center_size * 0.1);
	float outer = step(distance(uv, center), circle_distance);
	float inner = step(distance(uv, center), circle_distance - crosshair_thickness);
	
	float cross_horizontal_upper = center.y - (cross_width * 0.2);
	float cross_horizontal_bottom = center.y + (cross_width * 0.2);
	bool horizontal = uv.y >= cross_horizontal_upper && uv.y <= cross_horizontal_bottom;
	
	float cross_vertical_upper = center.x - (cross_width * 0.2);
	float cross_vertical_bottom = center.x + (cross_width * 0.2);
	bool vertical = uv.x >= cross_vertical_upper && uv.x <= cross_vertical_bottom;
	
	if (horizontal || vertical) {
		return circle_center;
	}
	
	return outer - inner + circle_center;
}

void fragment() {
	COLOR.rgb = vec3(1);
	COLOR.a = create_circles(UV);
}

