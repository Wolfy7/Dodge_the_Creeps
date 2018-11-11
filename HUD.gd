extends CanvasLayer

signal start_game

func show_messge(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

func game_over():
	show_messge("Game Over")
	yield($MessageTimer, "timeout")
	$MessageLabel.text = "Dodge the\nCreeps!"
	$MessageLabel.show()
	$StartButton.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)

func _on_MessageTimer_timeout():
	$MessageLabel.hide()

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
