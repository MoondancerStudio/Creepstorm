class_name Hurtbox
extends CollisionObject2D

signal died

@export var healthComponent: Health

func _ready() -> void:
	healthComponent.health_depleted.connect(die)

func takeDamage(damage: int) -> void:
	healthComponent.damage(damage)
	
func die() -> void:
	print("Dieing...")
	died.emit()
	$"..".queue_free()
