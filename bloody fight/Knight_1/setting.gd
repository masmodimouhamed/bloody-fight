extends Panel
func _ready() -> void:
	AudioServer.set_bus_volume_db(0,10)
func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,value/5)
	if value==0 :
		AudioServer.set_bus_mute(0,true)
	else :
		AudioServer.set_bus_mute(0,false)


func _on_window_size_item_selected(index: int) -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	match index :
		0:
			DisplayServer.window_set_size(Vector2i(1920,1080))
		1 :
			DisplayServer.window_set_size(Vector2i(1600,900))
		2:
			DisplayServer.window_set_size(Vector2i(1280,720))
	var screen_center = DisplayServer.screen_get_position() + DisplayServer.screen_get_size() / 2
	var window_size = DisplayServer.window_get_size_with_decorations()
	DisplayServer.window_set_position(screen_center - window_size / 2)
