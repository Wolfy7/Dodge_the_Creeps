extends Node

export (PackedScene) var Mob
var score

func _ready():
	randomize()
	
func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.show_messge("Get Ready")
	$HUD.update_score(score)
	$Music.play()


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.game_over()
	$DeathSound.play()
	$Music.stop()


func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()


func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)


func _on_MobTimer_timeout():
	$MobPath/MobSpawnLocation.set_offset(randi())
	var mob = Mob.instance()
	add_child(mob)
	var direction = $MobPath/MobSpawnLocation.rotation + PI/2
	mob.position = $MobPath/MobSpawnLocation.position
	print(direction)
	direction += rand_range(-PI/4, PI/4)
	print(direction)
	mob.rotation = direction
	mob.set_linear_velocity(Vector2(rand_range(mob.MIN_SPEED, mob.MAX_SPEED),0).rotated(direction))
