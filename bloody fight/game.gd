extends Node
var HP1 :int = 16
var HP2 :int = 16
@onready var hp_1: ProgressBar = $HP1
@onready var hp_2: ProgressBar = $HP2
enum player1 {atk , def , rer , non1}
enum player2 {atk , def , rer , non2}
var t:={"a1":2,"a2":2,"d1":2,"d2":2}
@export var play1 : player1 
@export var play2 : player2
@onready var anim1 : AnimatedSprite2D = $player1/animation
@onready var anim2 : AnimatedSprite2D = $player2/animation
@onready var P1: CharacterBody2D = $player1
@onready var P2: CharacterBody2D = $player2
var speed : int = 200
var time1 = 0
var time2 = 0
var a1=false
var r1=false
var a2=false
var d1=false
var d2=false
var r2=false
var de1=false
var de2=false
var is_busy1=false
var is_busy2=false 
var test =false 
@onready var defence1_logo: TextureProgressBar = $defence1_logo
@onready var attack1_logo: TextureProgressBar = $attack1_logo
@onready var attack2_logo: TextureProgressBar = $attack2_logo
@onready var defence2_logo: TextureProgressBar = $defence2_logo
@onready var gameover: Panel = $gameover
@onready var die: Label = $gameover/die
@onready var waiting: Label = $waiting1
@onready var waiting_2: Label = $waiting2
var waiting1 : bool = false
var waiting2 : bool = false
var time_waite1 : int = 0
var time_waite2 : int = 0
var ok1 = true
var ok2 = true
func _ready() -> void:
	hp_1.modulate = Color.GREEN
	hp_2.modulate = Color.GREEN
	gameover.visible=false
	Audio.game_mood()
	$pause.visible=false
func _process(delta: float) -> void:
	if P1.is_on_floor() :
		if time1 < 2.3:
			anim1.play("down")
			P1.velocity.x =0
			time1 +=delta
			Audio.down()
		elif time1 < 4.8 :
			anim1.play("walk")
			P1.velocity.x = speed
			time1 += delta
			Audio.walk()
		else :
			time1+=delta
			Audio.walkn()
			test=true
			P1.velocity.x=0
			if a1==a2 and  a2==d1 and d1==d2 and d2==r1 and r1==r2 and r2==false :
				anim1.play("idle")
			if not waiting1 :
				if ok1 :
					time_waite1=time1
					ok1 = false
				if time1 > time_waite1+4 :
					$waiting1.text = "press an action to continue"
	if not P2.is_on_floor():
		anim2.flip_h =true
	if P2.is_on_floor() :
		if time2 < 2.3:
			anim2.play("down")
			P2.velocity.x =0
			time2 +=delta
		elif time2==4.8 :
			Audio.down()
		elif time2 < 4.8 :
			anim2.play("walk")
			P2.velocity.x = speed*-1
			time2 += delta
		else :
			time2+=delta
			test=true
			P2.velocity.x = 0
			if a1==false and a2==false and d1==false and d2==false and r1==false and r2==false :
				anim2.play("idle") 
			if not waiting2 :
				if ok2 :
					time_waite2=time2
					ok2 = false
				if time2 > time_waite2+4 :
					$waiting2.text = "press an action to continue"
	if Input.is_action_just_pressed("esc") :
		$pause.visible=true
		get_tree().paused=true
	if Input.is_action_just_pressed("atk1") and not is_busy1 and test:
		if t["a1"]>0 :
			play1=player1.atk
			is_busy1=true
			waiting1=true
			$waiting1.text=""
		else :
			pass 
	if Input.is_action_just_pressed("def1") and not is_busy1 and test:
		if t["d1"]>0 :
			play1=player1.def
			is_busy1=true
			waiting1=true
			$waiting1.text=""
		else :
			pass
	if Input.is_action_just_pressed("rer1") and not is_busy1 and test:
			play1=player1.rer
			is_busy1=true
			waiting1=true
			$waiting1.text=""
	if Input.is_action_just_pressed("atk2") and not  is_busy2 and test :
		if t["a2"]>0 :
			play2=player2.atk
			is_busy2=true
			waiting2=true
			$waiting2.text = ""
		else :
			pass
	if Input.is_action_just_pressed("def2") and not is_busy2  and test:
		if t["d2"]>0 :
			play2=player2.def
			is_busy2=true
			waiting2=true
			$waiting2.text = ""
		else :
			pass
	if Input.is_action_just_pressed("rer2") and not is_busy2 and test:
			play2=player2.rer
			is_busy2=true
			waiting2=true
			$waiting2.text = ""
	if 5<6 :
		match play1 :
			player1.atk :
				a1=true
				match play2 :
					player2.atk :
						a2=true
						if t["a1"]>0 and t["a2"]>0 :
							cond(2,2,1,1,0,0,"atk","atk",a1,a2)
							Audio.attack_attack()
						else :
							pass
					player2.def :
						d2=true
						if t["a1"]>0 and t["d2"]>0 :
							cond(1,0,1,0,0,1,"atk","def",a1,d2)
							Audio.attack_defance()
						else :
							pass
					player2.rer :
						r2=true
						if t["a1"]>0 :
							cond(0,4,1,-2,0,-2,"atk","rer",a1,r2)
							Audio.attack_recharge()
						else :
							pass
			player1.def :
				d1=true
				match play2 :
					player2.atk :
						a2=true
						if t["d1"]>0 and t["a2"]>0 :
							cond(0,1,0,1,1,0,"def","atk",d1,a2)
							Audio.attack_defance()
					player2.def :
						d2=true
						if t["d1"]>0 and t["d2"]>0 :
							cond(0,0,0,0,1,1,"def","def",d1,d2)
							Audio.defance_defance()
						else :
							pass
					player2.rer :
						r2=true
						if t["d1"]>0 :
							cond(0,0,0,-2,1,-2,"def","rer",d1,r2)
							Audio.recharge_recharge()
						else :
							pass
			player1.rer :
				r1=true
				match play2 :
					player2.atk :
						a2=true
						if t["a2"]>0 :
							cond(4,0,-2,1,-2,0,"rer","atk",r1,a2)
							Audio.attack_recharge()
						else :
							pass
					player2.def :
						d2=true
						if t["d2"]>0 :
							cond(0,0,-2,0,-2,1,"rer","def",r1,d2)
							Audio.recharge_recharge()
						else :
							pass
					player2.rer :
						r2=true
						cond(0,0,-2,-2,-2,-2,"rer","rer",r1,r2)
						Audio.recharge_recharge()
	if HP1<11 and HP1>4 :
		hp_1.modulate = Color.YELLOW
	elif HP1<5 and HP1>1:
		hp_1.modulate = Color.RED
	elif HP1<1 and not d1:
		a1=true
		d1=true
		set_process(false)
		anim1.stop()
		anim1.play("dead")
		Audio.game_over()
		await anim1.animation_finished
		anim1.play("fuckyou")
		HP1=0
		gameover.visible=true
		die.text="player1 DEAD"
		$waiting1.text=""
		$waiting2.text=""
	if HP2<11 and HP2>4 :
		hp_2.modulate = Color.YELLOW
	elif HP2<5 and HP2>1 :
		hp_2.modulate = Color.RED
	elif HP2<1 and not de2 :
		a2=true
		d2=true
		set_process(false)
		anim2.stop()
		anim2.play("dead")
		await anim2.animation_finished
		anim2.play("fuckyou") 
		HP2=0
		gameover.visible=true
		die.text="player2 DEAD"
		$waiting2.text=""
		$waiting1.text=""
	hp_1.value = HP1
	hp_2.value = HP2
func _on_button_pressed() -> void:
		get_tree().quit()
func _on_button_2_pressed() -> void:
	play1 = player1.non1
	play2 = player2.non2
	HP1=16
	HP2=16
	t["a1"]=2
	t["a2"]=2
	t["d1"]=2
	t["d2"]=2
func cond(a:int,b:int,c:int,d:int,e:int,f:int ,ch1,ch2,_x,_y):
	HP1-=a
	HP2-=b
	t["a1"]-=c
	attack1_logo.value =t["a1"]
	t["a2"]-=d
	attack2_logo.value =t["a2"]
	t["d1"]-=e
	defence1_logo.value =t["d1"]
	t["d2"]-=f
	defence2_logo.value =t["d2"]
	if t["a1"]>2 :
		t["a1"]=2
	if t["a2"]>2 :
		t["a2"]=2
	if t["d1"]>2 :
		t["d1"]=2
	if t["d2"]>2 :
		t["d2"]=2
	play1 = player1.non1
	play2 = player2.non2
	waiting2=false
	waiting1=false
	ok1=true
	ok2=true
	anim1.pause()
	anim2.pause()
	anim1.play(ch1)
	anim2.play(ch2)
func _on_animation1_finished():
		if anim1.animation != "idle" and anim1.animation != "walk":
			anim1.play("idle") 
			a1=false 
			d1=false
			r1=false
			is_busy1=false
func _on_animation2_finished():
		if anim2.animation != "idle" and anim2.animation != "walk":
			anim2.play("idle")
			a2=false 
			d2=false
			r2=false
			is_busy2=false


func _on_restart_game_pressed() -> void:
	get_tree().paused =false
	Transition.fade_to_scene("res://game.tscn")
	$AudioStreamPlayer2D.stream = preload("res://sound_effects/dieThrow1.ogg")
	$AudioStreamPlayer2D.play()
func _on_play_menu_pressed() -> void:
	get_tree().paused =false
	Transition.fade_to_scene("res://play_menu.tscn")
	$AudioStreamPlayer2D.stream = preload("res://sound_effects/dieThrow1.ogg")
	$AudioStreamPlayer2D.play()
	Audio.music()


func _on_resume_pressed() -> void:
	$AudioStreamPlayer2D.stream = preload("res://sound_effects/dieThrow1.ogg")
	$AudioStreamPlayer2D.play()
	get_tree().paused=false
	$pause.visible=false
