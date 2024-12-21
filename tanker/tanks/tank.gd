extends CharacterBody2D

signal health_changed
signal dead
signal shoot

@export var Bullet: PackedScene
@export var speed: int
@export var rotation_speed: float
@export var gun_cooldown: float
@export  var health: int

#var velocity = Vector2()
var can_shoot = true
var alive = true

func _ready():
		$GunTimer.wait_time = gun_cooldown

func control(delta):
		pass

func _physics_process(delta):
		if not alive:
				return
		control(delta)
		#if velocity.length() > 0:
		move_and_slide()

func _shoot():
	if can_shoot:
		#print('hit')
		#can_shoot = false
		$GunTimer.start()
		var dir = Vector2(1,0).rotated($Turret.global_rotation)
		emit_signal("shoot",Bullet,$Turret/Muzzle.global_position,dir)


func _on_gun_timer_timeout() -> void:
	can_shoot=true
