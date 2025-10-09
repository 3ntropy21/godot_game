extends Node

func test():
	get_tree().change_scene_to_file("res://scenes/test.tscn")

func clicker():
	get_tree().change_scene_to_file("res://scenes/clicker.tscn")

func soccer():
	get_tree().change_scene_to_file("res://scenes/soccer.tscn")

func level_up():
	var scene = get_tree().current_scene.scene_file_path
	if scene == "res://scenes/main_menu.tscn":
		get_tree().change_scene_to_file("res://scenes/levels/level1.tscn")
	elif scene == "res://scenes/levels/level1.tscn":
		get_tree().change_scene_to_file("res://scenes/levels/level2.tscn")
	elif scene == "res://scenes/levels/level2.tscn":
		get_tree().change_scene_to_file("res://scenes/levels/level3.tscn")
	elif scene == "res://scenes/levels/level3.tscn":
		get_tree().change_scene_to_file("res://scenes/levels/level4.tscn")
	elif scene == "res://scenes/levels/level4.tscn":
		get_tree().change_scene_to_file("res://scenes/levels/level5.tscn")
	elif scene == "res://scenes/levels/level5.tscn":
		get_tree().change_scene_to_file("res://scenes/levels/level6.tscn")
	elif scene == "res://scenes/levels/level6.tscn":
		get_tree().change_scene_to_file("res://scenes/levels/level7.tscn")


func reload():
	var reloading_scene = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	get_tree().change_scene_to_file(reloading_scene)
