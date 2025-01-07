extends Node2D

@export_category("Objects")
@export var _spawn_limit_down: Marker2D
@export var _spawn_limit_up: Marker2D
@export var _timer_spawn: Timer

func _spawn_enemy() -> void:
	var _spawn_position: Vector2 = Vector2(
		randf_range(_spawn_limit_down.position.x, _spawn_limit_up.position.x),
		randf_range(_spawn_limit_down.position.y, _spawn_limit_up.position.y),
	)
	
	var enemy = preload("res://Enemies/alan.tscn")
	
	var e = enemy.instantiate()
	e.position = _spawn_position
	add_sibling(e)

func _on_timer_spawn_timeout():
	_spawn_enemy()
