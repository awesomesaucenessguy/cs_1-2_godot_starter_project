extends Area2D
var active = false
var in_range = false
@onready var _animation_player: AnimatedSprite2D = $AnimatedSprite2D


func _on_body_entered(body):
	if body.name == "player":
		active = true
		print("lever 4 active")
func update_animation():
	if active:
		_animation_player.play("on")
	else:
		_animation_player.play("off")
