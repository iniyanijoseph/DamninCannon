extends StaticBody2D

var bullet = preload("res://Bullet.tscn")

func create_bullet():
	$AudioStreamPlayer2D.play()
	var instance = bullet.instance()
	instance.position = position + Vector2(20, -20)
	instance.apply_central_impulse(Vector2((get_global_transform().get_origin().x - get_parent().get_node("Player").position.x)*-0.3, -370))
	get_parent().add_child(instance)

func _on_Timer_timeout():
	create_bullet()
