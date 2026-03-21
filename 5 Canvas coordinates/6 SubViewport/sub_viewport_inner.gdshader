shader_type canvas_item;

uniform float angle_z: hint_range(0.0, 360.0) = 180.;

void vertex() {
	mat3 rotation_matrix_z = mat3(vec3(cos(radians(angle_z)),-sin(radians(angle_z)),0),vec3(sin(radians(angle_z)),cos(radians(angle_z)),0),vec3(0,0,1));
	vec3 result = rotation_matrix_z * vec3(VERTEX, 1.);
	VERTEX = result.xy;
}
