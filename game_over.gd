extends Node

var gasVal = 0
var bnVal = 0
var saveMade = false
@onready var gas_score = $GAS_SCORE
@onready var bn_killed_score = $BN_KILLED_SCORE
@onready var bn_timer = $BN_KILLED_SCORE/BN_TIMER
@onready var gold_earned_score = $GOLD_EARNED_SCORE
@onready var gold_timer = $GOLD_EARNED_SCORE/GOLD_TIMER

var goldVal = 0

var totalGoldVal = (Game.THIS_GAS_SCORE + (Game.THIS_BN_KILLED_SCORE * 3)) * 5


	
	


func _on_g_a_s_timer_timeout():
	if gasVal + 5 <= Game.THIS_GAS_SCORE:
		gasVal += 5
		gas_score.text = str(gasVal)
	if gasVal + 1 <= Game.THIS_GAS_SCORE:
		gasVal += 1
		gas_score.text = str(gasVal)
	else:
		gas_score.text = str(gasVal)
		gas_score.get_child(0).queue_free()
		bn_timer.start()

func _on_bn_timer_timeout():
	if Game.THIS_BN_KILLED_SCORE > 50:
		if bnVal + 5 <= Game.THIS_BN_KILLED_SCORE:
			bnVal += 5
			bn_killed_score.text = str(bnVal)
	if bnVal + 1 <= Game.THIS_BN_KILLED_SCORE:
		bnVal += 1
		bn_killed_score.text = str(bnVal)
	else:
		bn_killed_score.text = str(bnVal)
		bn_killed_score.get_child(0).queue_free()
		gold_timer.start()

func _on_gold_timer_timeout():
	if goldVal + 10 <= totalGoldVal:
		goldVal += 5
		gold_earned_score.text = str(goldVal)
	if goldVal + 1 <= totalGoldVal:
		goldVal += 1
		gold_earned_score.text = str(goldVal)
	else:
		gold_earned_score.text = str(goldVal)
		gold_earned_score.get_child(0).queue_free()

func saveChanges():
	Game.BN_KILLED_SCORE += Game.THIS_BN_KILLED_SCORE
	if Game.HIGHEST_GAS_SCORE < Game.THIS_GAS_SCORE:
		Game.HIGHEST_GAS_SCORE = Game.THIS_GAS_SCORE
	Game.GOLD += totalGoldVal
	Utils.saveGame()


func _on_start_pressed():
	if saveMade == false:
		saveChanges()
		saveMade = true
		get_tree().change_scene_to_file("res://game.tscn")

func _on_main_menu_pressed():
	if saveMade == false:
		saveChanges()
		saveMade = true
		get_tree().change_scene_to_file("res://main.tscn")
