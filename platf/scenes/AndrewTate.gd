extends KinematicBody2D

export(PackedScene) var BEAM: PackedScene = preload('res://scenes/Beam.tscn')

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
var x = 0
var y = 0
var rng = RandomNumberGenerator.new()
var direction
var health = 100
var xvel = 0

export(int) var SPEED: int = 800

export(PackedScene) var WEIGHT: PackedScene = preload('res://scenes/Weight.tscn')

func _ready():
	pass

func _reset_jump():
	JUMPFORCE = 460
	

func _physics_process(delta):
	cycle -= 1
	if get_parent().get_node('Player').position.x < position.x:
		direct = 1
	else:
		direct = -1
	if cycle > 0:
		if abs(abs(get_parent().get_node('Player').position.x) - abs(position.x)) < 400:
			xvel += 1*direct
			motion.x += xvel
	if is_on_floor() and cycle == 0:
		motion.y = -JUMPFORCE
		cycle = rng.randi_range(1,3)
		if cycle == 1:
			JUMPFORCE = 460
			var weight_direction = self.global_position.direction_to(get_parent().get_node('Player').position)
			weight(weight_direction)
			y = 1
		elif cycle == 2:
			if x == 0:
				x = 240
			else:
				pass
		else:
			var beam_direction = self.global_position.direction_to(get_parent().get_node('Player').position)
			beam(beam_direction)
	move_and_slide(motion, UP)
	
func weight(weight_direction:Vector2):
	if WEIGHT:
		var weight = WEIGHT.instance()
		get_tree().current_scene.add_child(weight)
		weight.global_position = self.global_position
		
		var weight_rotation = weight_direction.angle()
		weight.rotation = weight_rotation

func beam(beam_direction:Vector2):
	if BEAM:
		var beam = BEAM.instance()
		get_tree().current_scene.add_child(beam)
		beam.global_position = self.global_position
		
		var beam_rotation = beam_direction.angle()
		beam.rotation = beam_rotation
