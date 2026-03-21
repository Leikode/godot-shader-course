extends Node2D
const DIRECTION_ANIMATIONS: Dictionary[Variant, Variant] = {
	Vector2i.LEFT: 'left',
	Vector2i.RIGHT: 'right',
	Vector2i.UP: 'up',
	Vector2i.DOWN: 'down',
	Vector2i(1,1): 'right',
	Vector2i(1,-1): 'right',
	Vector2i(-1,1): 'left',
	Vector2i(-1,-1): 'left'}

func _process(delta: float) -> void:
	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	position += direction * 50 * delta
	if direction:
		$AnimatedSprite2D.play(DIRECTION_ANIMATIONS[Vector2i(round(direction.x), round(direction.y))])
		$"../Reflection".play(DIRECTION_ANIMATIONS[Vector2i(round(direction.x), round(direction.y))])
	else:
		$AnimatedSprite2D.frame = 0
		$"../Reflection".frame = 0
