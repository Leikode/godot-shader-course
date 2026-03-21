extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -800.0
const GRAVITY = 1500

func _physics_process(delta):

	if not is_on_floor():
		velocity.y += GRAVITY * delta
	var direction = Input.get_axis("ui_left", "ui_right")
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if direction:
		$AnimatedSprite2D.flip_h = direction < 0
		$AnimatedSprite2D.play("run")
		velocity.x = direction * SPEED
	else:
		$AnimatedSprite2D.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if not is_on_floor():
		$AnimatedSprite2D.play("jump")

	move_and_slide()
