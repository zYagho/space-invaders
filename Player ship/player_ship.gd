extends CharacterBase
class_name PlayerShip

const PROJECTILE = preload("res://Projectiles/projectile.tscn")

func  _ready() -> void:
	_shoot_animation = "double_shot"

func _physics_process(_delta: float):
	_move_horizontal()
	
	if Input.is_action_pressed("SHOOT"):
		_shoot()

func _shoot() -> void:
	
	if _can_shoot:
		var _projectile = PROJECTILE.instantiate()

		_projectile.set_direction(Vector2(0,-1))
		_projectile.set_shoot_animation(_shoot_animation)
		_projectile.set_damage(_damage)
		_projectile.set_emissor("PlayerShip")
		add_sibling(_projectile)
		_projectile.global_position = _spawn_projectile.global_position
		_can_shoot = false
		_timer_to_shoot.start()

func _move_horizontal() -> void:
	
	_direction = (int)(Input.get_axis("LEFT", "RIGHT"))
	
	if _direction > 0:
		velocity.x = _direction * _speed
		_texture.play("rigth")
	if _direction < 0:
		velocity.x = _direction * _speed
		_texture.play("left")
	if _direction == 0:
		_texture.play("idle")
		velocity.x = 0
	
	move_and_slide()

func _on_timer_to_shoot_timeout():
	_can_shoot = true

func take_damage(_dam: int) -> void:
	_health -= _damage
