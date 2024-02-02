extends TileMap
@onready var tile_map = $"."
# Called when the node enters the scene tree for the first time.
func _ready():
	var collectibles = preload("res://collectibles/collectibles.tscn").instantiate()
	var mobs = preload("res://mobs/mobs.tscn").instantiate()
	generateBlocks()
	add_child(collectibles)
	add_child(mobs)
	
	
func generateBlocks():
	var layer = int(0)
	var source_id = int(0)
	var atlas_coords = Vector2i(1, 4)
	var alt_tile = int(0)
	for n in 50:
		var xOrigin = randi_range(1, 10)
		var x1
		var x2
		var x3
		var type = randi_range(1, 3)
		if type == 1:
			atlas_coords = Vector2i(2, 5)
			x1 = Vector2i(xOrigin - 1, (-n * 5))
			x2 = Vector2i(xOrigin - 2, (-n * 5))
			x3 = Vector2i(xOrigin - 3, (-n * 5))
		if type == 2:
			atlas_coords = Vector2i(1, 4)
			x1 = Vector2i(xOrigin, (-n * 5) - 1)
			x2 = Vector2i(xOrigin, (-n * 5) - 2)
			x3 = Vector2i(xOrigin, (-n * 5) - 3)
		if type == 3:
			atlas_coords = Vector2i(3, 4)
			x1 = Vector2i(xOrigin - 1, (-n * 5))
			x2 = Vector2i(xOrigin, (-n * 5) - 1)
			x3 = Vector2i(xOrigin - 1, (-n * 5) - 1)
		tile_map.set_cell(layer, Vector2i(xOrigin, (-n * 5)), source_id, atlas_coords, alt_tile)
		tile_map.set_cell(layer, x1, source_id, atlas_coords, alt_tile)
		tile_map.set_cell(layer, x2, source_id, atlas_coords, alt_tile)
		tile_map.set_cell(layer, x3, source_id, atlas_coords, alt_tile)
		
