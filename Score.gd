extends Label

@onready var player = $"../../../Player"
var highestScore = 0


func _on_timer_timeout():
	if player.position.y < 0:
		var currentScore = floor(player.position.y / 1000)
		if currentScore < highestScore:
			highestScore = floor(player.position.y / 1000)
		text = 'G.A.S: ' + str(highestScore * -1) + 'm'
		Game.THIS_GAS_SCORE = highestScore * -1
	
