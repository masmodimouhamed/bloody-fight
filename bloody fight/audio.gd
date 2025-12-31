extends Node2D
@export var  mute :bool =false
var test2:bool=true
var test:bool =true
func _ready() -> void:
	music()
func music2() :
	$music.stop()
	$music2.play()
	test2=true
	test=true
func music() :
	$music2.stop()
	$music.play()
func loading():
	$loading.play()
func game_mood() :
	if not mute :
		$game_mood.play()
func walk() :  
	if test:
		$walk.play()
		test=false
func walkn():
	$walk.stop()
func down() :
	if test2:
		$down.play()
		test2=false
func game_over() :
	if not mute :
		$game_over.play()
func attack_defance() :
	if not mute :
		$attack_defance.play()
func attack_recharge() :
	if not mute :
		$attack_recharge.play()
func attack_attack() :
	if not mute :
		$attack_attack.play()
func recharge_recharge() :
	if not mute :
		$recharge_recharge.play()
func defance_defance() :
	if not mute :
		$defance_defance.play()
