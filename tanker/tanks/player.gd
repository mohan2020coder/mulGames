extends "res://tanks/tank.gd"

var zoom_speed : float = 0.1

func control(delta):
	velocity = Vector2.ZERO
	$Turret.look_at(get_global_mouse_position())
	var rot_dir = 0
	if Input.is_action_pressed('turn_right'):
		rot_dir += 1
	if Input.is_action_pressed('turn_left'):
		rot_dir -= 1
	rotation += rotation_speed * rot_dir * delta
	if Input.is_action_pressed('forward'):
		velocity = Vector2(speed, 0).rotated(rotation)
	if Input.is_action_pressed('back'):
		velocity = Vector2(-speed/2, 0).rotated(rotation)
	if Input.is_action_just_pressed('shoot'):
		_shoot()

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("zoom_in"):
		$Camera2D.zoom = ($Camera2D.zoom - Vector2(zoom_speed, zoom_speed)).clamp(Vector2(0.1, 0.1), Vector2(3, 3))
	elif Input.is_action_pressed("zoom_out"):
		$Camera2D.zoom = ($Camera2D.zoom + Vector2(zoom_speed, zoom_speed)).clamp(Vector2(0.1, 0.1), Vector2(3, 3))
