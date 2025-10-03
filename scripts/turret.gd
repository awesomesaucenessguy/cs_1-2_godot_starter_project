extends Node2D
var start_time = 2
var timer = start_time
var in_range = false
var player
var projectile_scene = preload("res://scenes/enemy_projectile.tscn")
# TODO: Add variables for turret state
# Track if player is in range, projectile scene, etc.
# Look at "Boolean Variables and State Tracking" documentation
func _process(delta):
	if in_range:
		timer -= delta
		if timer <0:
			shoot(player)
			timer=start_time
	pass
	
func _on_area_2D_body_entered(body: Node2D) -> void:
	player = body
	if body.name=="player":
		in_range=true
	pass
func _on_area_2D_body_exited(body: Node2D) -> void:
	if body.name=="player":
		in_range=false
	pass
# TODO: Add projectile scene variable
# Look at "Reusing Projectile Systems" documentation
func _ready():
	# TODO: Set up shooting timer
	# Look at "Working with Timers" documentation
	pass

func _on_detection_area_body_entered(body):
	# TODO: Check if the body is the player
	# Update player detection state
	# Look at "Boolean Variables and State Tracking" documentation
	
	pass

func _on_detection_area_body_exited(body):
	# TODO: Check if the body is the player  
	# Update player detection state
	# Look at "Boolean Variables and State Tracking" documentation
	pass

func _on_shooting_timer_timeout():
	# TODO: Check if player is in range
	# If yes, shoot at player
	# Look at documentation for shooting logic
	pass

func shoot(target):
	var new_instance = projectile_scene.instantiate()
	new_instance.set_direction(facing)
	get_parent().add_child(new_instance)
	new_instance.global_position = position - Vector2(0,25)
	pass
