extends Area2D

@onready var gameManager = %GameManager

func _on_body_entered(body: Node2D) -> void:
	print("Enemy went through!")
	gameManager.loose_life()
	
	body.queue_free()
