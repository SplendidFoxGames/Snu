extends Area2D

@export_file("*.tscn") var next_level: String

var player_nearby := false




func _on_body_entered(body: Node2D):
	player_nearby = true


func _on_body_exited(body):
	player_nearby = false

func _process(_delta):
	if player_nearby and Input.is_action_just_pressed("move_up"):
		#print("snu goes through the hole!")
		get_tree().change_scene_to_file(next_level)
