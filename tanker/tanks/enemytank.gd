extends "res://tanks/tank.gd"

@onready var parent = get_parent()

@export var turrent_speed: float
@export var detect_radius: int

var target = null



func _ready() -> void:
	turrent_speed = 1.0
	detect_radius = 400
	var circle = CircleShape2D.new()
	$DetectRadius/CollisionShape2D.shape = circle
	$DetectRadius/CollisionShape2D.shape.radius = detect_radius
	
func control(delta):
	if parent is PathFollow2D:
		parent.progress += speed * delta
		position = Vector2()
	else:
		pass

func _process(delta: float) -> void:
	if target:
		var target_dir = (target.global_position - global_position).normalized()
		var current_dir = Vector2(1, 0).rotated($Turret.global_rotation)
		$Turret.global_rotation = current_dir.lerp(target_dir, turrent_speed * delta).angle()
		

func _on_detect_radius_body_entered(body: Node2D) -> void:
	#if body.name == 'Player':
	target = body


func _on_detect_radius_body_exited(body: Node2D) -> void:
	if body == target:
		target = null
