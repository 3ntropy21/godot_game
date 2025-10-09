extends Node

var dashed1 : bool = false
var dashed2 : bool = false

func _ready():
	dashed1 = false
	dashed2 = false
	$SoccerBall.position.y = randi_range(140,280)
	update_score()
	$Label3.set_text(str(Global.player2_score))


func _process(delta: float):
	Global.time_elapsed += delta
	$TimerLabel.text = str(Global.time_elapsed).pad_decimals(2)
	if Input.is_action_just_pressed("1dash") and !dashed1:
		$player1.acceleration = 0
		await get_tree().create_timer(3).timeout
		$player1.acceleration = 1.5
		dashed1 = true
	if Input.is_action_just_pressed("2dash") and !dashed2:
		$player2.acceleration = 0
		await get_tree().create_timer(3).timeout
		$player2.acceleration = 1.5
		dashed2 = true
	



func _on_goal_1_area_entered(area: Area2D):
	if area == $SoccerBall/Area2D:
		reset_soccer()
		Global.player2_score += 1
		$Label3.set_text(str(Global.player2_score))

func _on_goal_2_area_entered(area: Area2D):
	if area == $SoccerBall/Area2D:
		reset_soccer()
		Global.player1_score += 1
		$Label.set_text(str(Global.player1_score))

func reset_soccer():
	get_tree().change_scene_to_file.call_deferred("res://scenes/soccer.tscn")

func update_score():
	$Label.set_text(str(Global.player1_score))
	$Label3.set_text(str(Global.player2_score))

func _on_area_2d_area_exited(area: Area2D):
	if area == $SoccerBall/Area2D:
		reset_soccer()
	elif area == $player1/Area2D:
		reset_soccer()
	elif area == $player2/Area2D:
		reset_soccer()
