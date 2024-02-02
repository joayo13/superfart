extends Panel
@onready var low_hp_sound = $"../lowHPSound"
@onready var health = $"../Health"



func _process(_delta):
	set_size(Vector2i((270 * (Game.HEALTH * 0.01)), 40))


func _on_timer_timeout():
	if Game.HEALTH <= 10 and not low_hp_sound.playing:
		low_hp_sound.play()
		if health.has_theme_color_override("font_color"):
			health.remove_theme_color_override("font_color")
		else: 
			health.add_theme_color_override("font_color", "red")
		
	elif Game.HEALTH >= 11: 
		low_hp_sound.stop()
		health.remove_theme_color_override("font_color")
