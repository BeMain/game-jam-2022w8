extends StaticBody



func _on_Surface_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		var new_pos = position.rotated(Vector3(1, 0, 0), rotation.x)  # Apply rotations to get position relative to wall
		new_pos = -position.rotated(Vector3(0, 1, 0), -rotation.y)
		new_pos += Vector3.ONE / 2  # Map from [-0.5, 0.5] to [0.0, 1.0]
		new_pos *= Constants.wallsize.y  # Map from [0.0, 1.0] to [0.0, Constants.wallsize]
		
		event.position = Vector2(new_pos.x, new_pos.y)  # Set new position
		$Viewport.unhandled_input(event)  # Forward event to Viewport
