extends Control
onready var health_bar= $Ship1_Health
onready var update_tween=$Update_Tween

func _ready():
	_on_max_health_updated(100)
	_on_health_updated(100)
	
#----------------------------------------------------------------------
#----------------------------------------------------------------------
#----------------------------------------------------------------------
func _on_health_updated(health):
	health_bar.value = health
#	update_tween.interpolate_property(health_bar,"value", health_bar.value, health, 0.4, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
#	update_tween.start()
func _on_max_health_updated(max_health):
	health_bar.max_value = max_health

func _on_dammage_taken(damage_percent):
	health_bar.value -=health_bar.max_value*(damage_percent)
#	update_tween.interpolate_property(health_bar,"value", health_bar.value, health, 0.4, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
#	update_tween.start()

#----------------------------------------------------------------------
#----------------------------------------------------------------------
#----------------------------------------------------------------------



func _on_player1_interface_health_changed(health):
	_on_health_updated(health)
