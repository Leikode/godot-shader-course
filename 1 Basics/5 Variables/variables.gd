extends Sprite2D

var tween_shader: Tween


func _ready() -> void:
	tween_shader = create_tween()
	
	tween_shader.set_loops()
	
	tween_shader.tween_property(material, "shader_parameter/IconXPos", 150.0, 1.0)
	tween_shader.tween_property(material, "shader_parameter/IconXPos", 0.0, 1.0)
	
	tween_shader.tween_property(material, "shader_parameter/CircleRadius", 0.0, 1.0)
	tween_shader.tween_property(material, "shader_parameter/CircleRadius", 1.0, 1.0)
	