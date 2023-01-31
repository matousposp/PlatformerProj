extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var motion = Vector2()

# Called when the node enters the scene tree for the first time.
#func _init():
#func _on_alert_body_entered(body: Node) -> void:
	#pass # Replace with function body.

		
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimatedSprite_child_entered_tree(node):
	pass # Replace with function body.
	motion.x = -270
	while (true):
		$AnimatedSprite.play("default")
