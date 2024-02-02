extends Label




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "GAS: " + str(Game.MAX_GAS)
