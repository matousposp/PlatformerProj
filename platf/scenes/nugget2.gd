extends Area2D


func _ready():
	$AnimatedSprite.play("default")


func _on_Area2D_area_entered(area):
	if area.is_in_group('portal'):
		get_tree().change_scene("res://scenes/bossbattle1.tscn")
