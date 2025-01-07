extends Node2D

@export_category("Objects")
@export var _spawn_limit_down: Marker2D
@export var _spawn_limit_up: Marker2D
@export var _timer_spawn: Timer

var _enemies: Dictionary = {
	1:"res://Enemies/alan.tscn",
	2:"res://Enemies/bon_bon.tscn",
	3:"res://Enemies/lips.tscn"
}

var _enemies_alive: Array = []

func _spawn_enemy() -> void:
	var _spawn_position: Vector2 = Vector2(
		randf_range(_spawn_limit_down.position.x, _spawn_limit_up.position.x),
		randf_range(_spawn_limit_down.position.y, _spawn_limit_up.position.y),
	)
	var _load: String = _enemies[randi_range(1,3)]
	var _enemy = load(_load)
	var _e = _enemy.instantiate()
	_e.position = _spawn_position
	add_sibling(_e)

func _on_timer_spawn_timeout():
	_spawn_enemy()
