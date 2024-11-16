extends Node
enum Size {
	SMALL,
	MEDIUM,
	LARGE
}
enum GameplayType {
	HEAL,
	UPGRADE,
	LOOT
}

@export var radiusFromPlayer = 1
@export var spawnBaseTime := 60.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start(spawnBaseTime)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_timer_timeout() -> void:

	$Timer.start(randi_range(0, 30) + spawnBaseTime)
	var IslandScene = preload("res://scenes/Island/island.tscn")
	var island := IslandScene.instantiate()
	var randint1 := (randi() % 3)
	var randint2 := (randi() % 3)

	match randint1:
		0:
			island.gameplayType = GameplayType.HEAL
		1:
			island.GameplayType = GameplayType.UPGRADE
		2:
			island.GameplayType = GameplayType.LOOT
	match randint2:
		0:
			island.size = Size.SMALL
		1:
			island.size = Size.MEDIUM
		2:
			island.size = Size.LARGE
	# set up player position once a finalized player node is created
	# var player = preload("res://locomotion-test/player-test.tscn")
	island.global_position = $Player.heading * radiusFromPlayer + $Player.position
	add_child(island)