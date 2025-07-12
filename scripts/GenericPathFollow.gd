extends PathFollow2D

@export var child: Node

func _ready() -> void:
	if child != null:
		add_child(child)
