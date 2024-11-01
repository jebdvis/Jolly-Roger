extends Area3D
	
#island interact detection
func _on_body_entered(body):
	if body.is_in_group("player"):
		print("interact!")
