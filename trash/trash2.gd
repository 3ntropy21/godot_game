extends Node

func _ready():
	Global.tagger = $player1/Area2D

func _process(delta: float):
	$Label.set_text(str(Global.tagger))
