extends Marker3D

@export var orbit_sensitivity = 0.25
var event_relative := Vector2.ZERO

func _ready() -> void:
	# Clear input capture on window focus loss
	get_window().focus_exited.connect(func() -> void:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE)
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if Input.is_action_just_pressed("left_click"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			event_relative = event.relative

func _process(delta: float) -> void:
	var _last_event_relative = event_relative
	
	# Apply and clamp orbiting
	rotation.y -= event_relative.x * delta * orbit_sensitivity
	rotation.x -= event_relative.y * delta * orbit_sensitivity
	rotation.x = clamp(
		rotation.x, -PI / 2.0 + 0.1, PI / 2.0 - 0.1)
	
	if event_relative == _last_event_relative:
		event_relative = Vector2.ZERO
