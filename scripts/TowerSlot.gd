extends Sprite2D

var hasTower: bool       = false
var towerTexture: String = "res://assets/Tower.png"
@onready var gameManager: GameManager = %GameManager
var towerCost: int = 2

func _input(event: InputEvent) -> void:
	if isClicked(event) and (gameManager.coins >= towerCost):
		buildTower()

func isClicked(event: InputEvent) -> bool:
	return event.is_action_pressed("click") and is_pixel_opaque(get_local_mouse_position())

func buildTower() -> void:
	var newTexture = load(towerTexture)
	texture = newTexture
	hasTower = true
	print("Tower has been built")
	gameManager.spendCoin(towerCost)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Character and hasTower:
		var character := body as Character
		character.damage(1)
	
