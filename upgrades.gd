extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")


func _on_upgrade_health_pressed():
	if (Game.GOLD - (Game.MAX_HEALTH * 40)) >= 0:
		Game.GOLD -= (Game.MAX_HEALTH * 40)
		Game.MAX_HEALTH += 10
		Utils.saveGame()


func _on_upgrade_gas_pressed():
	if (Game.GOLD - (Game.MAX_GAS * 40)) >= 0:
		Game.GOLD -= (Game.MAX_GAS * 40)
		Game.MAX_GAS += 10
		Utils.saveGame()
