extends CharacterBase
class_name PlayerShip

func _physics_process(_delta: float):
	_move_horizontal(_delta)
	
	if Input.is_action_pressed("SHOOT"):
		_shoot()

func _shoot() -> void:
	
	if _can_shoot:
		var _projectile = PROJECTILE.instantiate()

		_projectile.set_direction(Vector2(0,-1))
		
		add_sibling(_projectile)
		_projectile.global_position = _spawn_projectile.global_position
		
		_can_shoot = false
		_timer_to_shoot.start()

func _move_horizontal(_delta: float) -> void:
	var direction = Input.get_axis("LEFT", "RIGHT")
	
	if direction > 0:
		velocity.x = direction * _speed
		_texture.play("rigth")
	if direction < 0:
		velocity.x = direction * _speed
		_texture.play("left")
	if direction == 0:
		_texture.play("idle")
		velocity.x = 0
	
	print(velocity.x)
	move_and_slide()

func _on_timer_to_shoot_timeout():
	_can_shoot = true

func take_damage(_damage: int) -> void:
	_health -= _damage
