extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	$AudioStreamPlayer2D.stream = preload("res://sound_effects/dieThrow1.ogg")
	$AudioStreamPlayer2D.play()
	Transition.fade_to_scene("res://play_menu.tscn")
