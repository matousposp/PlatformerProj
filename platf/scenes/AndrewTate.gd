extends KinematicBody2D

export(PackedScene) var BEAM: PackedScene = preload('res://scenes/Beam.tscn')

signal knockback()

const UP= Vector2(0, -1) 
var GRAVITY= 20
var MAXFALLSPEED= 1000
var MAXSPEED= 200
var JUMPFORCE = 460
var motion = Vector2()
var jumps = 0
var direct = 1
var cycle = 90
var x = 0
var y = 0
var rng = RandomNumberGenerator.new()
var direction
var health = 100
var xvel = 0


export(int) var SPEED: int = 800

export(PackedScene) var WEIGHT: PackedScene = preload('res://scenes/Weight2.tscn')
#var sound_effect = preload("res://andrew.mp3")
var audio_player = AudioStreamPlayer.new()

var timer = Timer.new()
func _ready():
	add_child(audio_player)
	add_child(timer)
	timer.set_wait_time(10.0)
	timer.set_one_shot(false)
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.start()
func _on_Timer_timeout():
	#audio_player.stream = sound_effect
	#audio_player.play()
	pass

func _reset_jump():
	JUMPFORCE = 460
	
func _physics_process(delta):
	$AnimatedSprite.flip_h = (direct > 1)
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	if cycle > 0:
		cycle -= 1
	if get_parent().get_node('Player').position.x < position.x:
		direct = 1
	else:
		direct = -1
	if cycle > 0:
		$AnimatedSprite.play('idle')
		if abs(abs(get_parent().get_node('Player').position.x) - abs(position.x)) < 300:
			if is_on_wall():
				xvel *= -1
			else:
				if abs(abs(get_parent().get_node('Player').position.x) - abs(position.x)) < 150:
					xvel += 1*-direct
				else:
					xvel += 1*direct
			motion.x += xvel
		if abs(abs(get_parent().get_node('Player').position.x) - abs(position.x)) < 200 and is_on_floor() and cycle > 0:
			motion.y -= JUMPFORCE
	if cycle == 0:
		#motion.y = -JUMPFORCE
		if x == 0:
			y = rng.randi_range(1,3)
		if y == 1:
			$AnimatedSprite.play('attack')
			JUMPFORCE = 460
			var weight_direction = self.global_position.direction_to(get_parent().get_node('Player').position)
			weight(weight_direction)
			y = 0
		elif y == 2:
			if x == 0:
				x = 360
			else:
				$AnimatedSprite.play('attack')
				x -= 1
				if get_parent().get_node('Player').position.x < position.x:
					xvel -= 2
				if get_parent().get_node('Player').position.x > position.x:
					xvel += 2
				if abs(abs(get_parent().get_node('Player').position.y) - abs(position.y)) < 100:
					motion.y -= 100
				if get_parent().get_node('Player').position.y >= position.y:
					motion.y += 50
				motion.x += xvel
		else:
			if xvel > 0:
				xvel -= 1
			else:
				xvel += 1
			$AnimatedSprite.play('attack')
			var beam_direction = self.global_position.direction_to(get_parent().get_node('Player').position)
			beam(beam_direction)
		if x == 0:
			cycle = 90
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

func _on_Area2D_area_entered(area):
	emit_signal('knockback')

func _on_Player_hit(id):
	health -= 1.5
