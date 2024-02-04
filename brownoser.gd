extends CharacterBody2D

var chase = false
var death = false
var SPEED = 450
var player
const KNOCKBACK_POWER = 2000
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var audio_stream_player = $AudioStreamPlayer
@onready var collision_shape_2d = $CollisionShape2D
@onready var death_timer = $DeathTimer

func _ready():
	player = get_node("../../../../Player")
func knockback(playerVelocity: Vector2):
	var knockbackDirection = (velocity - playerVelocity).normalized() * KNOCKBACK_POWER
	return knockbackDirection
func _physics_process(_delta):
	move_and_slide()
	
	var direction = (player.position - self.position).normalized()
	if chase:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	if self.position.x < -10:
		self.position.x = get_viewport_rect().size.x
	elif self.position.x > get_viewport_rect().size.x:
		self.position.x = -10
func _on_player_detection_body_entered(body):
	if body.name == "Player":
		animated_sprite_2d.play("default")
		chase = true
	

func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false

func _on_death_box_body_entered(body):
	if body.name == "Player":
		if death == false:	
			body.velocity = knockback(body.velocity)
			remove_child(collision_shape_2d)
			death = true
			velocity.x = 0
			velocity.y = 0
			death_timer.start()
			animated_sprite_2d.play("death")
			audio_stream_player.play()
			Game.THIS_BN_KILLED_SCORE += 1


func _on_kill_box_body_entered(body):
	if body.name == "Player":
		if death == false:	
			body.velocity = knockback(body.velocity)
			player.invincibilityFrames = true
			death = true
			velocity.x = 0
			velocity.y = 0
			death_timer.start()
			animated_sprite_2d.play("death")
			audio_stream_player.play()
			Game.THIS_BN_KILLED_SCORE += 1
			Game.HEALTH -= 10
			Game.LAST_MOB_DEATH = 'BROWNOSER'


func _on_death_timer_timeout():
	self.queue_free()





func _on_stuck_checker_body_entered(body):
	print(body.name)
	if body.name == "Chunk" or body.name.match("**TileMap****"):
		self.queue_free()
