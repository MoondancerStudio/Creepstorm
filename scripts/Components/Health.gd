class_name Health
extends Node

@export var health: int = 1

signal health_depleted
signal health_updated(old_value, new_value)

func damage(point: int) -> void:
	print(point)
	var oldHealth: int = health
	if (point < health):
		health -= point
	else:
		health = 0
		health_depleted.emit()
	health_updated.emit(oldHealth, health)

func heal(point: int) -> void:
	var oldHealth = health
	health += point
	health_updated.emit(oldHealth, health)
