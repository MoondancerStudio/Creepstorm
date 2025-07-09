class_name GameManager
extends Node

var lives = 5
var coins = 2

@onready var lifeLabel = $LifeLabel
@onready var coinLabel = $CoinLabel
@onready var messageLabel = $MessageLabel
@onready var timer = $Timer


func _ready() -> void:
	lifeLabel.text = "Lives: %d" % lives
	coinLabel.text = "Coins: %d" % coins
	messageLabel.visible = false


func loose_life() -> void:
	lives -= 1
	lifeLabel.text = "Lives: %d" % lives
	if lives < 1:
		game_over()


func get_coin() -> void:
	coins += 1
	renderCoins()


func spendCoin(value: int) -> void:
	coins -= value
	renderCoins()


func reward(coin: int) -> void:
	coins += coin
	renderCoins()


func renderCoins() -> void:
	coinLabel.text = "Coins: %d" % coins


func game_over() -> void:
	timer.start()
	messageLabel.text = "Defeted"
	messageLabel.visible = true


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
