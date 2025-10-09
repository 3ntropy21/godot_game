extends Area2D

var speed : int = 100
var up = Input.is_action_pressed("up")
var down = Input.is_action_pressed("down")
var left = Input.is_action_pressed("left")
var right = Input.is_action_pressed("right")

func movement():
	if Input.is_action_pressed("up"):

		print("up")

func _physics_process(delta: float):
	movement()
	move_and_slide()
