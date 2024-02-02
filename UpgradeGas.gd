extends Button



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "COST: " + str(Game.MAX_GAS * 40) + "\n" + "\n" + "+10 GAS" + "\n" + "\n" + "PURCHASE UPGRADE"
