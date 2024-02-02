extends Node

var brownoser = preload("res://mobs/brownoser.tscn")
var numberOfNosers = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	var parentPosition = get_parent().global_position.y
	if parentPosition < -100000:
		numberOfNosers = 7
	if parentPosition < -200000:
		numberOfNosers = 10
	for n in numberOfNosers:
		var xOrigin = randi_range(50, 675)
		var bnTemp = brownoser.instantiate()
		bnTemp.position = Vector2(xOrigin, parentPosition + ((-18000 / numberOfNosers) * n))
		call_deferred("add_child", bnTemp)
