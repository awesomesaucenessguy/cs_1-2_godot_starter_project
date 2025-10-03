extends CharacterBody2D
@onready var _animation_player: AnimatedSprite2D = $AnimatedSprite2D

var xSpeed = 300.0
var xDirection = 0
var facing = "down"
var ySpeed = 300.0
var yDirection = 0
var coins = 0
var health = 10
var maxhealth = 10
var projectile_scene = preload("res://scenes/projectile.tscn")
# TODO: Add health system variables
# var health = ?
# var maxHealth = ?
# TODO: Add projectile scene for shooting
# var projectile_scene = preload("res://scenes/projectile.tscn")

func _physics_process(_delta):
	# TODO: Get horizontal input (left/right keys)
	# Input.get_axis checks two keys and gives us a number:
	# - When LEFT is pressed: returns -1.0
	# - When RIGHT is pressed: returns 1.0  
	# - When NOTHING is pressed: returns 0.0
	xDirection = Input.get_axis("ui_left", "ui_right")
	
	# TODO: Get vertical input (up/down keys)  
	# Same idea, but for up and down movement
	yDirection = Input.get_axis("ui_up", "ui_down")
	
	# ts pmo 🥀💔
	# TODO: Calculate X movement by multiplying direction × speed
	# This gives us the actual pixels to move this frame
	# If direction is 1 and speed is 300, we get 300 pixels right
	# If direction is -1 and speed is 300, we get -300 pixels (left)
	velocity.x = xDirection * xSpeed
	
	# TODO: Calculate Y movement the same way
	velocity.y = yDirection * ySpeed
	
	# TODO: Set the player's velocity (how fast they're moving)
	# Godot's CharacterBody2D uses a velocity system
	
	
	pass
	# TODO: Update facing direction based on movement
	# Use if statements to check xDirection and yDirection
	# Set facing to "right", "left", "down", or "up"
	# Only update facing when actually moving (direction != 0)
	
	move_and_slide()
	
	if xDirection >0:
		facing="right"
	elif xDirection <0:
		facing="left"
	elif yDirection >0:
		facing="down"
	elif yDirection <0:
		facing="up"
	if Input.is_action_just_pressed("ui_select"):
		shoot()
	update_animation()
	
	# TODO: Actually apply the movement
	# This is a special Godot function that makes the movement happen

# TODO: Create animation function (add this outside of _physics_process)
func update_animation():
	# TODO: Set the animation based on the facing direction
	# Use: _animation_player.play("idle_" + facing)
	# This combines "idle_" with whatever direction we're facing
	if xDirection ==0 && yDirection ==0: _animation_player.play("idle_" + facing)
	elif xDirection !=0 || yDirection !=0: _animation_player.play("walk_" + facing)	


# TODO: Create health change function for interactions
func changehealth(amount:int):
	health = 10
	prints("you have"+str(health)+"health")
	if health>maxhealth:
		health=maxhealth
	if health<1:
		die()
func die():
	print ("Game Over")
	queue_free()
pass

# TODO: Create shooting function
func shoot():
	
	var new_instance = projectile_scene.instantiate()
	new_instance.set_direction(facing)
	get_parent().add_child(new_instance)
	new_instance.global_position = position - Vector2(0,25)
	pass
	# TODO: Create a new projectile instance
	# Look at the documentation examples in the lesson
	
	
	# TODO: Set projectile position to player position
	# Look at the "Setting Object Position" example
	
	
	# TODO: Set projectile direction using facing variable
	# Look at the "Calling Functions on Other Objects" example
	
	
	# TODO: Add projectile to the game world
	# Look at the "Adding Objects to the Game World" example
	
	
	# TODO: Print shooting confirmation
	# print("Shot projectile facing: ", facing)
func change_coins(amount:int):
	coins+=amount
	prints("you have"+str(coins)+"coins")
	coins=coins+1
	coins+=1
	pass
