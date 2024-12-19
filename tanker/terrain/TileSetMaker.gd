extends Node

var tile_size = Vector2(128, 128)
@onready var texture = $Sprite2D.texture

func _ready():
	#var resource  = Resource.new()
	#resource.set_path("res://terrain/terrain_tiles.tres")
	var tex_width = texture.get_width() / tile_size.x
	var tex_height = texture.get_height() / tile_size.y
	var ts = TileSetAtlasSource.new()
	for x in range(tex_width):
		for y in range(tex_height):
			var region = Rect2(x * tile_size.x,y * tile_size.y, tile_size.x, tile_size.y)
			var id = x + y * 10
			var atlas_coords = Vector2i(x, y) 
			ts.create_tile(atlas_coords,tile_size)
			#ts.tile_set_texture(id, texture)
			#ts.tile_set_region(id, region)
	#var error := ResourceSaver.save(resource, ts)

	#if error == OK:
		#print("Resource saved successfully!")
	#else:
		#print("Failed to save resource: ", error)
