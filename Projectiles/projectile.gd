extends Area2D
class_name Projectile

@export_category("Variables")
@export var _direction: Vector2
@export var _speed: float
@export var _damage: int
@export var _animation_shot: String
   
@export_category("Objects")
@export var _texture: AnimatedSprite2D

var _emissor: String

func _physics_process(_delta: float) -> void:
	position += _direction * _speed * _delta

func _on_timer_timeout() -> void:
	queue_free()

func set_direction(_direc: Vector2) -> void:
	_direction = _direc

func get_damage() -> int:
	return _damage
func set_damage(_dam: int) -> void:
	_damage = _dam
	
func _on_body_entered(_body):
	
	if _body == null:
		return
	
	if _body is PlayerShip and _emissor == "EnemyBase":
		_body.take_damage(_damage)
		queue_free()
	
func set_emissor(_emi) -> void:
	_emissor = _emi
func get_emissor() -> String:
	return _emissor

func set_shoot_animation(_animation_name: String) -> void:
	_texture.play(_animation_name)
