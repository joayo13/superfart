extends Node
var beans = preload("res://collectibles/beans.tscn")
var chili = preload("res://collectibles/chili.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var parentPosition = get_parent().global_position.y
	for n in 10:
		var xOrigin = randi_range(50, 675)
		var beansTemp = beans.instantiate()
		beansTemp.global_position = Vector2(xOrigin, parentPosition + ((-18000 / 10) * n))
		call_deferred("add_child", beansTemp)
	for n in 4:
		var xOrigin = randi_range(50, 675)
		var chiliTemp = chili.instantiate()
		chiliTemp.global_position = Vector2(xOrigin, parentPosition + ((-18000 / 4) * n))
		call_deferred("add_child", chiliTemp)
