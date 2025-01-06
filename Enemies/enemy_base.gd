extends CharacterBase
class_name EnemyBase

var _direction: int = [-1, 1][randi() % 2]

func _physics_process(_delta: float):
	_move_horizontal(_delta)
	
func _shoot() -> void:
	pass
	
func _move_horizontal(_delta) -> void:

	position.x += _speed * _delta * _direction
	if(position.x >= global.max_width - 20 or position.x <= 20):
		_direction *= -1

func _on_timer_to_shoot_timeout():
	_can_shoot = true

func take_damage(_damage: int) -> void:
	_health -= _damage
