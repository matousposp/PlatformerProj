extends Area2D

signal Attack()


func _ready():
	$AnimatedSprite.play("default")

func _on_coin1_body_entered(body):
	if body.name == "Player":
		queue_free() 
