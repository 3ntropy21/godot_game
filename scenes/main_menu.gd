extends Control

func _on_main_game_button_down():
	Gamestate.level_up()

func _on_tag_button_down():
	Gamestate.test()

func _on_button_button_down():
	Gamestate.clicker()


func _on_soccer_button_down() -> void:
	Gamestate.soccer()
