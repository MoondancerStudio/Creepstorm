extends Sprite2D

var hasTower: bool       = false
var towerTexture: String = "res://assets/Tower.png"

func _input(event: InputEvent) -> void:
	if isClicked(event):
		buildTower()

func isClicked(event: InputEvent) -> bool:
	return event.is_action_pressed("click") and is_pixel_opaque(get_local_mouse_position())

func buildTower() -> void:
	var newTexture = load(towerTexture)
	texture = newTexture
	hasTower = true
	print("Tower has been built")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Character:
		var character := body as Character
		character.damage(1)
	
