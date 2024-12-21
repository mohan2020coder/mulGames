extends Node2D

func _ready():
	set_camera_limits()

func set_camera_limits():
	var map_limits = $Ground.get_used_rect()
	var map_cellsize = $Ground.tile_set.tile_size
	$Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y




func _on_player_shoot(bullet, _position, _direction) -> void:
	var b = bullet.instantiate()
	add_child(b)
	b.start(_position, _direction) 
