extends Control


var master_bus = AudioServer.get_bus_index("Master")


func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus, value)
	if value == -30:
		AudioServer.set_bus_mute(master_bus, true)
	else:
		AudioServer.set_bus_mute(master_bus, false)


func _on_return1_pressed():
	get_tree().change_scene("res://scenes/main menu.tscn")
