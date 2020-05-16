extends Button



export (String, FILE) var next_scene_path = ""




func _on_PlayButton_button_up() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Main.tscn")
	get_tree().paused = false
