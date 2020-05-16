extends Button



export (String, FILE) var next_scene_path = ""



func _on_RestartButton_button_up() -> void:
#	PlayerData.health = 100
#	PlayerData.score = 0
	get_tree().paused = false 
	#we put false because the game already paused so by puting false will unpause

	get_tree().reload_current_scene()

