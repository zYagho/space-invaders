extends CharacterBody2D
class_name CharacterBase

@warning_ignore("unused_private_class_variable")
var _can_shoot: bool = true
var _direction: int 
var _shoot_animation: String

@export_category("Variables")
@export var _health: int = 3
@export var _speed: float = 150.0
@export var _damage: int

@export_category("Objects")
@export var _rigth_collider: RayCast2D
@export var _left_collider: RayCast2D
@export var _timer_to_shoot: Timer
@export var _spawn_projectile: Marker2D
@export var _texture: AnimatedSprite2D

func _physics_process(_delta: float):
	pass

func _shoot() -> void:
	pass
	
func _move_horizontal() -> void:
	pass

func _on_timer_to_shoot_timeout():
	pass

func take_damage(_dam: int) -> void:
	pass

func update_direction() -> void:
	pass

func _on_texture_animation_finished():
	if _texture.animation == "dead":
		queue_free()
