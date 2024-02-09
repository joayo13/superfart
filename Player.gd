extends CharacterBody2D

const SPEED = 300.0
const FART_VELOCITY = -600
var invincibilityFrames = false
var dead = false
var jetfarting = false
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animated_sprite_2d_2 = $AnimatedSprite2D2
@onready var animated_sprite_2d_3 = $AnimatedSprite2D3
@onready var audio_stream_player = $AudioStreamPlayer
@onready var audio_stream_player_2 = $AudioStreamPlayer2
@onready var invincibility_timer = $InvincibilityTimer
@onready var gas_timer = $GasTimer
var idle = 'idle'
var rising = 'rising'
var falling = 'falling'
var peakRise = 'peakRise'
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	var fartso = false
	var tm = true
	if tm == true:
		idle = 'tm'
		rising = 'tm-rising'
		falling = 'tm-falling'
		peakRise = 'tm-peakRise'
	
func handle_fart():
	if Input.is_action_just_pressed("fart") and Game.GAS > 0:
		Game.GAS -= 2
		velocity.y = FART_VELOCITY
		animated_sprite_2d_2.stop()
		audio_stream_player.stop()
		audio_stream_player.play()
		animated_sprite_2d_2.play("fart")
	if not is_on_floor() and Input.is_action_pressed("fart") and Game.GAS > 0:
		gas_timer.set_paused(false)
		velocity.y -= 50
		animated_sprite_2d_3.play("jetfart")
		if not audio_stream_player_2.is_playing():
			audio_stream_player_2.play()
	else:
		gas_timer.set_paused(true)
		animated_sprite_2d_3.pause()
		audio_stream_player_2.stop()
func _physics_process(delta):
	if dead == true:
		animated_sprite_2d.play("death")
		animated_sprite_2d_3.stop()
		audio_stream_player_2.stop()
		velocity.y = 0
		velocity.x = 0
		await animated_sprite_2d.animation_finished
		self.queue_free()
		get_tree().change_scene_to_file("res://game_over.tscn")
	if invincibilityFrames and invincibility_timer.is_stopped() == true:
		handleInvincibilityFrames()
	if is_on_floor_only():
		animated_sprite_2d.play(idle)
	if not is_on_floor():
		velocity.y += gravity * delta
		if velocity.y > 33.4 and not animated_sprite_2d.animation == falling:
			animated_sprite_2d.play(falling)
		if velocity.y <= 0 and not animated_sprite_2d.animation == rising:
			animated_sprite_2d.play(rising)
	if Game.GAS <= 0:
		Game.DEATH_MESSAGE = 'RAN OUT OF GAS'
		dead = true
	if Game.HEALTH <= 0:
		Game.DEATH_MESSAGE = 'KILLED BY ' + Game.LAST_MOB_DEATH
		dead = true
	handle_fart()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction == -1:
		animated_sprite_2d.flip_h = true
		animated_sprite_2d_2.flip_h = true
	elif direction == 1: 
		animated_sprite_2d.flip_h = false
		animated_sprite_2d_2.flip_h = false
	if self.position.x <= 0:
		self.position.x = get_viewport_rect().size.x
	elif self.position.x > get_viewport_rect().size.x:
		self.position.x = 0
	move_and_slide()

func handleInvincibilityFrames():
	if Game.HEALTH <= 10:
		var tween = animated_sprite_2d.create_tween()
		tween.tween_property(self, "modulate:g", 0, 0.1)
		tween.tween_property(self, "modulate:g", 1, 0.1)
		tween.tween_property(self, "modulate:g", 0, 0.1)
		tween.tween_property(self, "modulate:g", 1, 0.1)
		tween.tween_property(self, "modulate:g", 0, 0.1)
		tween.tween_property(self, "modulate:g", 1, 0.1)
		tween.tween_property(self, "modulate:g", 0, 0.1)
		tween.tween_property(self, "modulate:g", 1, 0.1)
		tween.tween_property(self, "modulate:g", 0, 0.1)
		tween.tween_property(self, "modulate:g", 1, 0.1)
		tween.tween_property(self, "modulate:g", 0, 0.1)
		tween.tween_property(self, "modulate:g", 1, 0.1)
		invincibility_timer.start()
	else:
		var tween = animated_sprite_2d.create_tween()
		tween.tween_property(self, "modulate:a", 0, 0.2)
		tween.tween_property(self, "modulate:a", 1, 0.2)
		tween.tween_property(self, "modulate:a", 0, 0.2)
		tween.tween_property(self, "modulate:a", 1, 0.2)
		tween.tween_property(self, "modulate:a", 0, 0.2)
		tween.tween_property(self, "modulate:a", 1, 0.2)
		invincibility_timer.start()

func _on_invincibility_timer_timeout():
	invincibilityFrames = false


func _on_gas_timer_timeout():
	Game.GAS -= 1




