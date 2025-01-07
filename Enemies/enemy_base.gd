extends CharacterBase
class_name EnemyBase

const PROJECTILE = preload("res://Projectiles/projectile.tscn")

var _can_swap_direction: bool = true

func _ready() -> void:
	_direction = [-1, 1][randi() % 2]
	_can_shoot = false
	_shoot_animation = "enemy_shot"
	
func _physics_process(_delta: float):
	_move_horizontal()
	
func _shoot() -> void:
	
	var _projectile = PROJECTILE.instantiate()

	_projectile.set_direction(Vector2(0,1))
	_projectile.set_shoot_animation(_shoot_animation)
	_projectile.set_damage(3)
	_projectile.set_emissor("EnemyBase")
	add_sibling(_projectile)
	_projectile.global_position = _spawn_projectile.global_position
	
	_timer_to_shoot.start()
	
func _move_horizontal() -> void:

	update_direction()
	velocity.x = _speed * _direction
	move_and_slide()

func _on_timer_to_shoot_timeout():
	_shoot()

func take_damage(_dam: int) -> void:
	_health -= _dam
	
	if _health <= 0:
		_texture.play("dead")	
		
func update_direction() -> void:
	if _rigth_collider.is_colliding() or _left_collider.is_colliding():
		if (_rigth_collider.get_collider() is StaticBody2D or 
			_left_collider.get_collider() is StaticBody2D):
			if _can_swap_direction:
				_direction *= -1
				_can_swap_direction = false


func _on_timer_swap_direction_timeout():
	_can_swap_direction = true
	
func _on_hit_box_area_entered(_area):
	if _area is Projectile:
		if _area.get_emissor() == "PlayerShip":
			take_damage(_area.get_damage())
			_area.queue_free()
