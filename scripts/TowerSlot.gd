extends Sprite2D

@onready var gameManager: GameManager = %GameManager

@export var towerTexture: Resource = preload("res://assets/Tower.png")
@export var towerCost: int = 2
@export var damage: int = 1

var hasTower: bool = false


func _input(event: InputEvent) -> void:
	if isClicked(event) and (gameManager.coins >= towerCost):
		buildTower()


func isClicked(event: InputEvent) -> bool:
	return event.is_action_pressed("click") and is_pixel_opaque(get_local_mouse_position())


func buildTower() -> void:
	texture = towerTexture
	hasTower = true
	print("Tower has been built")
	gameManager.spendCoin(towerCost)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Character and hasTower:
		var character := body as Character
		animateDamage()
		character.damage(damage)
	if body is Hurtbox and hasTower:
		print("Hurtbox!")
		var hurtbox := body as Hurtbox
		animateDamage()
		hurtbox.takeDamage(damage)


func animateDamage():
	$Sprite2D.visible = true
	await get_tree().create_timer(0.2).timeout
	$Sprite2D.visible = false
