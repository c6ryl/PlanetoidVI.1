extends Control

signal damage_taken
signal health_changed
signal gaz_spent

func _on_Ship_hurt_signal(health):
	emit_signal("health_changed",health)

