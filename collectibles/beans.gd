extends Node2D
@onready var audio_stream_player = $AudioStreamPlayer

@onready var label = $Label
var playerConsumed = false
# Called when the node enters the scene tree for the first time.



func _on_body_entered(body):
	if body.name == "Player":
		if not playerConsumed:
			playerConsumed = true
			var tween = get_tree().create_tween()
			tween.tween_property(self, "position", position - Vector2(0, 100), 1)
			tween.tween_callback(queue_free)
			label.text = '700'
			audio_stream_player.play()
			if (Game.GAS + 7) > Game.MAX_GAS:
				Game.GAS = Game.MAX_GAS
			else:
				Game.GAS += 7
			
