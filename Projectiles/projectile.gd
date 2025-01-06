extends Area2D
class_name Projectile

@export_category("Variables")
@export var _direction: Vector2
@export var _speed: float
@export var _damage: int
@export var _animation_shot: String
   
@export_category("Objects")
@export var _texture: AnimatedSprite2D

func _ready() -> void:
	_texture.play(_animation_shot)

func _physics_process(_delta: float) -> void:
	position += _direction * _speed * _delta

func _on_timer_timeout() -> void:
	queue_free()

func set_direction(_direc: Vector2) -> void:
	_direction = _direc

func _on_body_entered(_body):
	_body.take_damage(_damage)
