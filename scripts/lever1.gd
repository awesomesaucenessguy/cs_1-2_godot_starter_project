extends Area2D
var active = false
@onready var _animation_player: AnimatedSprite2D = $AnimatedSprite2D


func _on_body_entered(body):
	if body.name == "player":
		active = true
		print("lever 1 active")
		update_animation()
	pass
func update_animation():
	if active == true:
		_animation_player.play("on")
	elif active == false:
		_animation_player.play("off")
	pass
