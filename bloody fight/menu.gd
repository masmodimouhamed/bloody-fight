extends Node
@onready var setting: Panel = $setting
@onready var main_button: VBoxContainer = $main_button
@onready var help: Panel = $help
func _ready() -> void:
	setting.visible=false
	main_button.visible=true
	help.visible =false
func _on_quit_pressed() -> void:
	$AudioStreamPlayer2D.stream = preload("res://sound_effects/dieThrow1.ogg")
	$AudioStreamPlayer2D.play()
	$Label2.text="fuck you"
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()


func _on_play_pressed() -> void:
	Transition.fade_to_scene("res://play_menu.tscn")
	$AudioStreamPlayer2D.stream = preload("res://sound_effects/dieThrow1.ogg")
	$AudioStreamPlayer2D.play()



func _on_setting_pressed() -> void:
	$AudioStreamPlayer2D.stream = preload("res://sound_effects/dieThrow1.ogg")
	$AudioStreamPlayer2D.play()
	setting.visible=true
	main_button.visible=false
	


func _on_back_pressed() -> void:
	$AudioStreamPlayer2D.stream = preload("res://sound_effects/dieThrow1.ogg")
	$AudioStreamPlayer2D.play()
	setting.visible=false
	main_button.visible=true


func _on_exit_pressed() -> void:
	$help.visible=false


func _on_help_pressed() -> void:
	$AudioStreamPlayer2D.stream = preload("res://sound_effects/dieThrow1.ogg")
	$AudioStreamPlayer2D.play()
	$help.visible=true
