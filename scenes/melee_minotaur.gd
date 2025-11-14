extends CharacterBody2D 
var speed = 250
var in_range = false
var chasing = false
var attacking = false
var health = 3
var start_time = 0.67
var timer = start_time
var x_direction = 0
var y_direction = 0
var facing = "down"
@onready var player: CharacterBody2D = %Player
@onready var _animation_player: AnimatedSprite2D = $AnimatedSprite2D
var projectile_original = preload("res://scenes/enemy_arrow.tscn")

func _process(delta: float) -> void:
	if in_range:
		timer -= delta
	if timer <0:
		shoot()
		timer = start_time
	elif chasing:
		position += position.direction_to(player.position) * speed*delta
		#big gun worky worky please 🥺
		#                            🙏
	if x_direction > 0:
		facing = "right"
	elif x_direction < 0:
		facing = "left"
	elif y_direction < 0:
		facing = "up"
	elif y_direction > 0:
		facing = "down"
		update_animation()
func update_animation():
	if attacking:
		_animation_player.play("attack_" + facing)
	if velocity.is_zero_approx():
			_animation_player.play("idle_" + facing)
	if !velocity.is_zero_approx():
		_animation_player.play("walk_" + facing)
	if in_range:
		_animation_player.play("crossbow_shoot_")
	pass

func _on_melee_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player = body
		in_range = false
		chasing = true
		attacking = true
		print("ooooooo you finna get smacked")
	pass

func _on_melee_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player = body
		attacking = false
		print("no more smack risk")
	pass

func _on_shoot_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player = body
		in_range = true
		print("pew pew time")
	pass

func _on_shoot_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player = body
		in_range = false
		print("no more pew pew :(")
	pass

func _on_chase_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player = body
		in_range = false
		chasing = true
		print("you should prolly run boi")
	pass
	
func _on_chase_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player = body
		chasing = false
		print("you dont need to run now")
	pass

func shoot():
	var projectile_clone = projectile_original.instantiate()
	projectile_clone.global_position = position
	projectile_clone.set_direction(player.position)
	get_tree().get_root().add_child(projectile_clone)
