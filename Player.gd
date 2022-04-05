extends KinematicBody2D

var velocity = Vector2.ZERO
var input = Vector2.ZERO
export(int, 0, 3000, 0) var acceleration = 1500
export(int, 0, 1000, 0) var speed = 300
var jump = true
export(int, 0, 1000, 0) var gravity = 700
export(int, 0, 1000, 0) var jumpforce = 350

var score = 0

func _physics_process(delta):
	input.x = (Input.get_action_strength("Right") - Input.get_action_strength("Left"))
	if input != Vector2.ZERO:
		velocity.x = (velocity.move_toward(input*speed, acceleration*delta)).x
	else:
		velocity.x = (velocity.move_toward(Vector2.ZERO, acceleration*delta)).x

	if Input.is_action_pressed("Jump") and jump:
		velocity.y = -jumpforce
		$AnimationPlayer.play("jump")

	velocity = move_and_slide(velocity, Vector2.UP)

	if is_on_floor():
		jump = true
		velocity.y = 0
	else:
		jump = false
		velocity.y += gravity*delta

	get_parent().get_node("RichTextLabel").text = "Score: " + str(score)


func _on_Area2D_body_entered(body):
	if body.is_in_group("Bullet"):
		score += int(rand_range(5, 10))
		body.queue_free()
