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
var xvel = 0
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _reset_jump():
	JUMPFORCE = 460
	

func _physics_process(delta):
	print(xvel)
	cycle -= 1
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
		
	else:
		if xvel > 0:
			xvel -= 2
		if xvel < 0:
			xvel += 2
	
	if is_on_floor() and cycle == 0:
		motion.y = -JUMPFORCE
	
	if cycle == 0:
		xvel = -24
		cycle = 120
	motion.x += xvel
	motion = move_and_slide(motion, UP)
