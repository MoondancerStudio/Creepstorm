class_name PathedObject
extends Node

@export var speed: int = 100

func _physics_process(delta: float) -> void:
	if $".." is PathFollow2D:
		$"..".progress += speed * delta
