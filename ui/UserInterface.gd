extends Control

onready var scene_tree = get_tree()
#just define the get treet in a variable for easy later reuse
onready var paused_overlay: ColorRect = get_node("PauseOverlay")
#be more precise to say that this var: is a type color rect which equal this node


#onready var score: Label = get_node("ScoreLabel")
##define score which is a Label and we get the node
#onready var healthLabel: Label = get_node("HealthLabel")
#onready var healthLabel = get_node("Scores/HealthLabel")
#onready var fuel: Label = get_node("FuelLabel")
#onready var died: Label = get_node("DieLabel")
#onready var die_title: Label = get_node("PauseOverlay/Title")

onready var score1 : Label = $ScoreLabel1 
onready var score2 : Label = $ScoreLabel2

var scorePlayer1 = 0
var scorePlayer2 = 0


var paused: = false setget set_paused

func _ready() -> void:
	score2.text = "0"
	score1.text = "0"
#	PlayerData.connect("score_updated", self, "update_interface")
#	#we connect our PlayerData informations the score updated to this node (itself the user interface
#	#car pour l instant rien les connects,  and to a new function update the interface (callback the info)
#	#every time the score is updadated we are going to update the interface, in our case the label, see function below
#	PlayerData.connect("player_died", self, "_PlayerData_player_died")
#	PlayerData.connect("health_updated", self, "_PlayerData_player_health")
#	#PlayerData.connect("fuel_updated", self, "_PlayerData_player_fuel")
#	update_interface()
#	_PlayerData_player_health()
#	_PlayerData_player_died(false)

	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		self.paused = not paused
		#self permet d aller trhough the setter funcion qu on a defnis en set_paused et pas de changer la valeur final de paused
		scene_tree.set_input_as_handled()
		#to tell the system listen only to this input and if press arrow key to move will not listen
		 
#func update_health_label():
#	health.text = "Score %s" % ship.My_life
#

#func update_interface():
#	#we need create variable with our node label to call it here, check onready var
#	score.text = "Score: %s" % PlayerData.score
#	#the score var that we defined at the begining that link to the label score, we go in his .text and we replace the % by PlayerData.score which is the info from our score PlayerData autoload
##
#func _PlayerData_player_health():
#	health.text = 'Health: %s' % PlayerData.health
#
#func _PlayerData_player_died(paused = true):
#	if paused:
#		self.paused = true
#		die_title.text = "You died"
#	died.text = "Died: %s" % PlayerData.deaths
#
##func _PlayerData_player_fuel():
##	fuel.text = "Fuel: %s" % PlayerData.fuel
##


func set_paused(value: bool) -> void:
	paused = value
	#assign the value of the variable we want to change firs thing to do for a setter
	scene_tree.paused = value
	paused_overlay.visible = value
	

#func _on_Ship_hurt_signal(health) -> void:
#	print(health)
#	var scoreValue = 0
#	if health <= 0 :
#		scoreValue += 1
#		score2.text = "%s" % scoreValue
#
#func _on_Ship2_hurt_signal(health) -> void:
#	print(health)
#	var scoreValue = 0
#	if health <= 0 :
#		scoreValue += 1
#		score1.text = "%s" % scoreValue
#


#func _on_Ship_hurt_signal(health) -> void:
#	print(health)
#	var hType = "Health: %s" % health
#	print(typeof(hType))
#	healthLabel.text = "Health: %s" % health
#
#make a die signal dans le ship et recuperer pour le score 
#make signal munition et fiul; faire signal quand puch munition et acceler et donner valeur max




	
	


func _on_Ship2_death_signal() -> void:
	scorePlayer1 += 1
	score1.text = "%s" % scorePlayer1


func _on_Ship_death_signal() -> void:
	scorePlayer2 += 1
	score2.text = "%s" % scorePlayer2
