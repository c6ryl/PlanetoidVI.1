extends KinematicBody2D

# code built from this example: https://www.youtube.com/watch?v=p6OQ7XVsiKw
onready var world=get_parent()
const THROW_VELOCITY = 100
var velocity = Vector2.ZERO

func _ready():	
	set_collision_layer(4)
	
func _physics_process(delta):
	velocity -= world.gravity_well_vectors(self)
	move_and_collide(velocity*delta)
	 
	yield(get_tree().create_timer(.8),"timeout")
	set_collision_layer(8)
	yield(get_tree().create_timer(5),"timeout")
	queue_free()
# boucing:
#	if collision != null:
#		_on_impact(collision.normal)
func launch():
	var temp = global_transform
	var scene = get_tree().current_scene
	get_parent().remove_child(self)
	scene.add_child(self)
	global_transform=temp
	velocity = THROW_VELOCITY * Vector2(0,-1).rotated(rotation)
	
func _on_impact(normal:Vector2):
	velocity = velocity.bounce(normal)
	velocity *= 0.5 + rand_range(-0.05, 0.05)

