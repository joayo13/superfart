extends Node

const SAVE_PATH = "user://savegame.save"


func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"GOLD": Game.GOLD,
		"MAX_HEALTH": Game.MAX_HEALTH,
		"MAX_GAS": Game.MAX_GAS,
		"HIGHEST_GAS_SCORE": Game.HIGHEST_GAS_SCORE,
		"BN_KILLED_SCORE": Game.BN_KILLED_SCORE
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
func loadGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				Game.GOLD = current_line["GOLD"]
				Game.MAX_HEALTH = current_line["MAX_HEALTH"]
				Game.MAX_GAS = current_line["MAX_GAS"]
				Game.HIGHEST_GAS_SCORE = current_line["HIGHEST_GAS_SCORE"]
				Game.BN_KILLED_SCORE = current_line["BN_KILLED_SCORE"]
