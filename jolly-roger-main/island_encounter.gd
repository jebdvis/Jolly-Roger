extends Area3D

#island encounter detection
func _on_body_entered(body):
	if body.is_in_group("player"):
		print("encounter!")
