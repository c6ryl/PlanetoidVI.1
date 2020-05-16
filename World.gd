extends Node2D

onready var planet1 = get_node("Planet1")
onready var planet2 = get_node("Planet2")
var gravity

func gravity_well_vectors(ship):	
	var p1_vector = planet_vector(ship,planet1,30000)
	var p2_vector =planet_vector(ship,planet2,10000)
	var final_vector =(p2_vector + p1_vector)
	
	return final_vector
	

func planet_vector(ship, planet, mass):
	var distance_to_planet=ship.get_position().distance_to(planet.get_position())
	var direction_to_planet= (ship.get_position() - planet.get_position()).normalized()
	gravity = mass / pow(distance_to_planet,2)
	return direction_to_planet*gravity


func _ready():
	OS.window_fullscreen = true
	pass # Replace with function body.

#func _process(delta):
#	if Input.is_action_pressed("ui_cancel"):	
#		OS.window_fullscreen = !OS.window_fullscreen
#		get_tree().quit()
