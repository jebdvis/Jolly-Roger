extends Control

var playerNode:CharacterBody3D

func _ready() -> void:
	playerNode = get_tree().get_root().get_node("Main-test").get_node("PlayerTest")
	$ZeroSpeed.position.y  = 360 * (playerNode.max_targ_speed / (playerNode.max_targ_speed - playerNode.min_targ_speed))

func _physics_process(delta: float) -> void:
	pass
