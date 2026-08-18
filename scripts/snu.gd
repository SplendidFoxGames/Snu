class_name Snu
extends CharacterBody2D

 
@export var speed := 200

@onready var sprite : Sprite2D = $Sprite2D
@onready var animationPlayer : AnimationPlayer = $AnimationPlayer


func _ready():
	pass

func _process(_delta):
	var direction= Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed

	flip_direction()
	set_animation()

	move_and_slide()


func flip_direction():
	if velocity.x  < 0:
		sprite.scale.x = -1
	elif velocity.x  > 0:
		sprite.scale.x = 1

func set_animation():
	if velocity.x == 0:
		animationPlayer.play("idle")
	else:
		animationPlayer.play("walk")
