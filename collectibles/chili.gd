extends Area2D

@onready var label = $Label
@onready var audio_stream_player = $AudioStreamPlayer
var playerConsumed = false



func _on_body_entered(body):
	if body.name == "Player":
		if not playerConsumed:
			playerConsumed = true
			var tween = get_tree().create_tween()
			tween.tween_property(self, "position", position - Vector2(0, 100), 1)
			tween.tween_callback(queue_free)
			label.text = '1000'
			audio_stream_player.play()
			if (Game.GAS + 10) > Game.MAX_GAS:
				Game.GAS = Game.MAX_GAS
			else:
				Game.GAS += 10
			
