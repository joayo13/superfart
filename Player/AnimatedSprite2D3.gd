extends AnimatedSprite2D



	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var tween = get_tree().create_tween()
	if self.is_playing():
		tween.tween_property(self, "modulate:a", 1, 0.5)
	else:
		tween.tween_property(self, "modulate:a", 0, 0.1)
