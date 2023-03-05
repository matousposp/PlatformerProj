extends Area2D

var score = 0 
var score_label = Label.new()


func _ready():
	$AnimatedSprite.play("default")


	score_label.text = "Score: 0"

	add_child(score_label)
	score_label.rect_position = Vector2(10, 10)


func _on_coin1_body_entered(body):
	if body.name == "Player":
		score += 1
		score_label.text = "Score: " + str(score)
		queue_free() 
