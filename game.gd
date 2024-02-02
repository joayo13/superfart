extends Node
@onready var highest_gas_altitude_score = $Stats/HighestGasAltitudeScore
@onready var brownosers_killed = $Stats/BrownosersKilled
@onready var total_gold = $Stats/TotalGold


# Called when the node enters the scene tree for the first time.
func _ready():
	Game.HEALTH = Game.MAX_HEALTH
	Game.GAS = Game.MAX_GAS
	Game.THIS_BN_KILLED_SCORE = 0
	Game.THIS_GAS_SCORE = 0
	Game.DEATH_MESSAGE = ''
	highest_gas_altitude_score.text += "\n" + str(Game.HIGHEST_GAS_SCORE)
	brownosers_killed.text += "\n" + str(Game.BN_KILLED_SCORE)
	total_gold.text += "\n" + str(Game.GOLD)

