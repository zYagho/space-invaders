extends CharacterBody2D
class_name CharacterBase

const PROJECTILE = preload("res://Projectiles/projectile_player_ship.tscn")

@warning_ignore("unused_private_class_variable")
var _can_shoot: bool = true

@export_category("Variables")
@export var _health: int = 3
@export var _speed: float = 150.0

@export_category("Objects")
@export var _timer_to_shoot: Timer
@export var _spawn_projectile: Marker2D
@export var _texture: AnimatedSprite2D

func _physics_process(_delta: float):
	pass

func _shoot() -> void:
	pass
	
func _move_horizontal(_delta) -> void:
	pass

func _on_timer_to_shoot_timeout():
	pass

func take_damage(_damage: int) -> void:
	pass
