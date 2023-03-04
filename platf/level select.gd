extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_1_pressed():
	get_tree().change_scene("res://scenes/level1.tscn")


func _on_2_pressed():
	get_tree().change_scene("res://scenes/level2.tscn")


func _on_3_pressed():
	get_tree().change_scene("res://scenes/level3.tscn")


func _on_4_pressed():
	get_tree().change_scene("res://scenes/level4.tscn")


func _on_5_pressed():
	get_tree().change_scene("res://scenes/level5.tscn")


func _on_6_pressed():
	get_tree().change_scene("res://scenes/level6.tscn")



func _on_7_pressed():
	get_tree().change_scene("res://scenes/level7mountainjew.tscn")


func _on_8_pressed():
	get_tree().change_scene("res://level8mountainjew.tscn")
