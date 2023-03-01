extends KinematicBody2D

export(PackedScene) var FRY: PackedScene = preload('res://scenes/Fry.tscn')

signal hit(id)

const UP= Vector2(0, -1) 
var GRAVITY= 20
var MAXFALLSPEED= 1000
var MAXSPEED= 200
var JUMPFORCE = 460
var motion = Vector2()
var jumps = 0
var direct = 1
var cycle = 180
var rng = RandomNumberGenerator.new()

export(PackedScene) var WEIGHT: PackedScene = preload('res://scenes/Weight.tscn')

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _reset_jump():
	JUMPFORCE = 460
	

func _physics_process(delta):
	cycle -= 1
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED

	if is_on_floor() and cycle == 0:
		motion.y = -JUMPFORCE
		cycle = rng.randi_range(1,1)
		if cycle == 1:
			var weight_direction = self.global_position.direction_to(get_parent().get_node('Player').position)
			weight(weight_direction)
		
	
	if cycle == 0:
		cycle = 120
	motion = move_and_slide(motion, UP)
	
func weight(weight_direction:Vector2):
	if WEIGHT:
		var weight = WEIGHT.instance()
		get_tree().current_scene.add_child(weight)
		weight.global_position = self.global_position
		
		var weight_rotation = weight_direction.angle()
		weight.rotation = weight_rotation
