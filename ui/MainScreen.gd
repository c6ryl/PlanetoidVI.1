extends Button



export (String, FILE) var next_scene_path = ""





func _on_PlayButton_button_up() -> void:
		get_tree().change_scene("res://Screens/MainScreen.tscn")
