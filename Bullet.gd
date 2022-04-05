extends RigidBody2D


func _on_Bullet_body_entered(body):
	if body.is_in_group("Player"):
		if body.score > NewScript.hscore:
			NewScript.hscore = body.score
		get_tree().change_scene("res://Die.tscn")

