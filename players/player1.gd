extends CharacterBody2D

var speed : int

var acceleration : float = 1.5

func _ready():
	Global.player1 = $Area2D

func _physics_process(delta: float):
	move_and_slide()
	animation()
	
	if Input.is_action_just_pressed("w") and !is_on_ceiling():
		create_tween().tween_property(self,"speed",175,acceleration).from(100)
	elif Input.is_action_just_pressed("a") and !is_on_wall():
		create_tween().tween_property(self,"speed",175,acceleration).from(100)
	elif Input.is_action_just_pressed("s") and !is_on_floor():
		create_tween().tween_property(self,"speed",175,acceleration).from(100)
	elif Input.is_action_just_pressed("d") and !is_on_wall():
		create_tween().tween_property(self,"speed",175,acceleration).from(100)
	
	velocity = Input.get_vector("a","d","w","s")
	position += velocity * speed * delta
	
	if Input.is_action_just_pressed("a") and Input.is_action_pressed("d"):
		velocity.x = 0
	if Input.is_action_just_pressed("w") and Input.is_action_pressed("s"):
		velocity.y = 0
	

func animation():
	if velocity.x != 0 and acceleration == 1.5:
		$AnimationPlayer.play("run")
	elif velocity.y != 0 and acceleration == 1.5:
		$AnimationPlayer.play("run")
	elif velocity.x != 0 and acceleration != 1.5:
		$AnimationPlayer.play("run_dash")
	elif  velocity.y != 0 and acceleration != 1.5:
		$AnimationPlayer.play("run_dash")
	elif velocity.y == 0 and velocity.x == 0 and acceleration == 1.5:
		$AnimationPlayer.play("idle")
	else:
		$AnimationPlayer.play("idle_dash")
	
	
