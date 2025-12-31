extends Node2D




func _on_main_menu_pressed() -> void:
	$AudioStreamPlayer2D.stream = preload("res://sound_effects/dieThrow1.ogg")
	$AudioStreamPlayer2D.play()
	Transition.fade_to_scene("res://menu.tscn")


func _on_multiplayer_pressed() -> void:
	$AudioStreamPlayer2D.stream = preload("res://sound_effects/dieThrow1.ogg")
	$AudioStreamPlayer2D.play()
	Transition.fade_to_scene("res://loading.tscn")


func _on_edit_word_pressed() -> void:
	$AudioStreamPlayer2D.stream = preload("res://sound_effects/dieThrow1.ogg")
	$AudioStreamPlayer2D.play()
	Transition.fade_to_scene("res://edit_word.tscn")
