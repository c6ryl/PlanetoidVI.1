extends Area2D

func _on_TITLE_body_entered(KinematicBody2D):
	yield(get_tree().create_timer(2),"timeout")
	$Sprite.show()
	yield(self,"body_entered")
	queue_free()
