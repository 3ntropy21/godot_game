extends Node

var player1_end1 : bool = false
var player2_end1 : bool = false
var player1_end2 : bool = false
var player2_end2 : bool = false

func _on_end_1_area_entered(area: Area2D):
	if area == Global.player1:
		player1_end1 = true
	if area == Global.player2:
		player2_end1 = true


func _on_end_1_area_exited(area: Area2D):
	if area == Global.player1:
		player1_end1 = false
	if area == Global.player2:
		player2_end1 = false


func _on_end_2_area_entered(area: Area2D):
	if area == Global.player1:
		player1_end2 = true
	if area == Global.player2:
		player2_end2 = true


func _on_end_2_area_exited(area: Area2D):
	if area == Global.player1:
		player1_end2 = false
	if area == Global.player2:
		player2_end2 = false



func _process(delta: float):
	if player1_end1 == true and player2_end2 == true:
		Gamestate.level_up()
	elif player1_end2 == true and player2_end1 == true:
		Gamestate.level_up()
	if Input.is_action_just_pressed("test"):
		$player1.position = $player2.position
		$player2.position = $player1.position
	if Input.is_action_just_pressed("reload"):
		Gamestate.reload()
	


func _on_barrier_button_dark_area_entered(area: Area2D):
	$LevelComponents/DarkBarriers.queue_free()


func _on_barrier_button_light_area_entered(area: Area2D):
	$LevelComponents/LightBarriers.queue_free()


func _on_portal_area_entered(area: Area2D):
	if area == Global.player1:
		$player1.position = $player2.position
	elif area == Global.player2:
		$player2.position = $player1.position



func _on_area_2d_area_entered(area: Area2D) -> void:
	if area == $LevelComponents/Locks/RigidBody2D/Area2D:
		$LevelComponents/Locks.queue_free()
