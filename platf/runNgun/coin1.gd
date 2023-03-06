extends Area2D

signal Attack()


func _ready():
	$AnimatedSprite.play("default")

func _on_coin1_body_entered(body):
	if body.name == "Player":
		queue_free() 


func _on_Area2D_area_entered(area):
	emit_signal("Attack")
