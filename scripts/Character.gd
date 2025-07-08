class_name Character
extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var game: GameManager = %GameManager

var speed: int = 60
var direction: int = -1

var health: int = 1
var reward: int = 1

func _process(delta: float) -> void:
	flip()
	position.x += speed * direction * delta


func flip() -> void:
	if direction >= 0:
		sprite.flip_h = false
	
	if direction < 0:
		sprite.flip_h = true

func damage(dmg: int) -> void:
	if (dmg < health):
		health -= dmg
	else:
		health = 0
		game.reward(reward)
		queue_free()
