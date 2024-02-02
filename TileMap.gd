extends TileMap
@onready var tile_map = $"."
var chunkY = 0
var chunk = preload("res://chunk.tscn").instantiate()
# 0 layer, atlas coords (0, 17), alt tile 0
# Called when the node enters the scene tree for the first time.
@onready var area_2d = $Area2D

func _ready():
	add_child(chunk) 
	area_2d.position.y = -4300	

# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		area_2d.position.y += -4300
		chunkY += -4300
		var lastChunk = get_child(1)
		var newChunk = load("res://chunk.tscn").instantiate()
		newChunk.position.y = chunkY - 200
		add_child(newChunk)
		lastChunk.queue_free()
		
		
		
