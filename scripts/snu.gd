class_name Snu
extends CharacterBody2D

 
@export var speed := 100
@export var jump_velocity := -250.0
@export var gravity := 1000.0

@onready var sprite : Sprite2D = $Sprite2D
@onready var animationPlayer : AnimationPlayer = $AnimationPlayer


func _ready():
	pass

func _physics_process(delta):

	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	move_and_slide()


func _process(_delta):
	var direction= Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed

	flip_direction()
	set_animation()


func flip_direction():
	if velocity.x  < 0:
		sprite.scale.x = -1
	elif velocity.x  > 0:
		sprite.scale.x = 1

func set_animation():

	if not is_on_floor():
		animationPlayer.play("jump")
	elif velocity.x == 0:
		animationPlayer.play("idle")
	else:
		animationPlayer.play("walk")
