extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var speed: int = 60
var direction: int = -1

func _process(delta: float) -> void:
	flip()
	position.x += speed * direction * delta


func flip() -> void:
	if direction >= 0:
		sprite.flip_h = false
	
	if direction < 0:
		sprite.flip_h = true
