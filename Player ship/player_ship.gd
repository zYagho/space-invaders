extends CharacterBody2D
class_name PlayerShip

const SPEED = 150.0

@export_category("Objects")
@export var _texture: AnimatedSprite2D

func _physics_process(_delta: float):
	_move_horizontal()
	
	if Input.is_action_pressed("SHOOT"):
		_shoot()
	
func _shoot() -> void:
	print("Atirar")
	
func _move_horizontal() -> void:
	var direction = Input.get_axis("LEFT", "RIGHT")
	
	if direction > 0:
		velocity.x = direction * SPEED
		_texture.play("rigth")
	if direction < 0:
		velocity.x = direction * SPEED
		_texture.play("left")
	if direction == 0:
		_texture.play("idle")
		velocity.x = 0
	
	move_and_slide()
