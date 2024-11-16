extends Node3D

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

@export_category("Island-Data")
@export var sizes = [10., 20., 30.]
@export var size: Size
@export var interactionRadius := 10.0
@export var gameplayType: GameplayType;


func _ready() -> void:
	var IslandSprite := $AnimatedSprite3D

	match gameplayType:
		GameplayType.HEAL:
			IslandSprite.animation = "Heal"
			print("heal")
		GameplayType.UPGRADE:
			IslandSprite.animation = "Upgrade"
			print("upgrade")
		GameplayType.LOOT:
			IslandSprite.animation = "Loot"
			print("loot")
		_:
			print_debug("invalid island state")

	match size:
		Size.SMALL:
			$IslandColider/CollisionShape3D.shape = generateCyl((sizes[0]-interactionRadius))
			$Area3D/CollisionShape3D.shape = generateCyl(sizes[0])
		Size.MEDIUM:
			$IslandColider/CollisionShape3D.shape = generateCyl((sizes[1]-interactionRadius))
			$Area3D/CollisionShape3D.shape = generateCyl(sizes[1])
		Size.LARGE:
			$IslandColider/CollisionShape3D.shape = generateCyl((sizes[2]-interactionRadius))
			$Area3D/CollisionShape3D.shape = generateCyl(sizes[2])
		_:
			print_debug("invalid Island Size state")

func generateCyl(radius: float) -> CylinderShape3D:
	var cyl = CylinderShape3D.new()
	cyl.height = 1.0
	cyl.radius = radius
	return cyl

func _process(delta: float) -> void:
	pass
func set_parameters(size, gameplayType):
	self.size = size
	self.gameplayType = gameplayType