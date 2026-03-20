shader_type canvas_item;

uniform float x_offset = 50.;
uniform float y_offset = 25.;
uniform float scale_ratio = 2.5;
uniform float angle_z: hint_range(0.0, 360.) = 45.;
uniform float angle_y: hint_range(0.0, 360.) = 75.;
uniform float angle_x: hint_range(0.0, 360.) = 15.;

void vertex() {
	//mat3 translation_matrix = mat3(vec3(1,0,0),vec3(0,1,0),vec3(x_offset,y_offset,1));
	//mat3 scale_matrix = mat3(vec3(scale_ratio,0,0),vec3(0,scale_ratio,0),vec3(0,0,scale_ratio));
	//mat3 rotation_matrix = mat3(vec3(cos(radians(angle)),-sin(radians(angle)),0),vec3(sin(radians(angle)),cos(radians(angle)),0),vec3(0,0,1));
	//vec3 result = rotation_matrix * scale_matrix * translation_matrix * vec3(VERTEX, 1.);
	//VERTEX = result.xy;
	
	mat3 rotation_matrix_z = mat3(vec3(cos(radians(angle_z)),-sin(radians(angle_z)),0),vec3(sin(radians(angle_z)),cos(radians(angle_z)),0),vec3(0,0,1));
	mat3 rotation_matrix_y = mat3(vec3(cos(radians(angle_y)),-sin(radians(angle_y)),0),vec3(0,1,0),vec3(sin(radians(angle_y)),0,cos(radians(angle_y))));
	mat3 rotation_matrix_x = mat3(vec3(1,0,0),vec3(0,cos(radians(angle_x)),sin(radians(angle_x))),vec3(0,-sin(radians(angle_x)),cos(radians(angle_x))));

	vec3 result = rotation_matrix_z * rotation_matrix_y * rotation_matrix_x * vec3(VERTEX, 1.);
	VERTEX = result.xy;
}
 

