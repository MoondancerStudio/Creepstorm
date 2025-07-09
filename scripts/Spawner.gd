extends Node2D

@export var enemy_preload: Resource = preload("res://scenes/Character.tscn")
@export var spawn_min_time: float = 1
@export var spawn_max_time: float = 3
@export var spawn_y_variance: int = 50


func _on_timer_timeout() -> void:
	spawn()
	$Timer.wait_time = randf_range(spawn_min_time, spawn_max_time)


func spawn() -> void:
	var enemy = enemy_preload.instantiate()
	enemy.position = Vector2(get_parent().position.x, get_parent().position.y + randf_range(-1 * spawn_y_variance, spawn_y_variance))
	enemy.game = %GameManager
	add_child(enemy)
