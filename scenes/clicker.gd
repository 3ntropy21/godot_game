extends Control

var score : int = 0

func _on_click_button_down():
	score += 1
	$score.set_text(str(score))
