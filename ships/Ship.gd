extends KinematicBody2D



const ACCELERATION = 3
const FRICTION = 5
const MAX_TURN_SPEED =5
var turn_speed=0
var ship_vector = Vector2()
var launch_ready = false

const MAX_HEALTH = 100
var health = 100

onready var world=get_parent()
onready var planet1 = get_parent().get_node("Planet1")
onready var planet2 = get_parent().get_node("Planet2")
onready var Projectile = preload("res://ships/Projectile.tscn")

signal my_life
signal hurt_signal
signal death_signal

func _ready():
	set_rotation_degrees(0)	
	emit_signal("my_life", health, MAX_HEALTH)
	
var velocity = Vector2.ZERO

func _physics_process(delta): 
		
	var input_vector = Vector2(0,0)
	
	input_vector.x+=Input.get_action_strength("right")- Input.get_action_strength("left")
	input_vector.y+=Input.get_action_strength("down")-Input.get_action_strength("up")
	input_vector=input_vector.normalized() # scales: il faut normaliser afin que la norme des déplacements diagonales ne soit pas le résultat de l'ajout des vecteurs hor et vert.
	
	if input_vector.x > 0:
		turn_speed=MAX_TURN_SPEED
	elif input_vector.x <0 :
		turn_speed=-MAX_TURN_SPEED	
	else :
		turn_speed=0
	
	var rotation_angle= get_rotation_degrees()+ turn_speed
	set_rotation_degrees(rotation_angle)
	
	if input_vector.y < 0:
		
		velocity += Vector2(0, -1).rotated(rotation) * ACCELERATION
		
	elif input_vector.y > 0:
			
		velocity += Vector2(0, 1).rotated(rotation) * ACCELERATION/10

	velocity= velocity - world.gravity_well_vectors(self)
	
	velocity = move_and_slide(velocity)
	
	if Input.is_action_pressed("player1_shoot"):
		spawn_projectile(15*velocity.normalized().rotated(rotation), rotation_angle)



func spawn_projectile(normalized_direction, angle, launch=true):
		
	if launch_ready==false:
		launch_ready=true
		
		var New_Projectile = Projectile.instance()
		New_Projectile.position= self.position + normalized_direction
		New_Projectile.set_rotation_degrees(angle)
		get_parent().add_child(New_Projectile)
#		yield(get_tree().create_timer(.2),"timeout")
		if launch:
			launch_projectile(New_Projectile)
		yield(get_tree().create_timer(.5),"timeout")
		launch_ready=false
	
func launch_projectile(projectile):

	projectile.launch()
#	yield(get_tree().create_timer(1),"timeout")


func _on_Hitbox_body_entered(KinematicBody2D):
	health -= MAX_HEALTH*.34
	emit_signal("hurt_signal",health)
	if health <=0 :
		emit_signal("death_signal")
		queue_free()
