extends Area2D

signal Attack()


func _ready():
	$AnimatedSprite.play("default")

func _on_coin1_body_entered(body):
	if body.name == "Player":
		queue_free() 


func _on_Area2D_area_entered(area):
	if area.is_in_group('coin11'):
		emit_signal("Attack")
