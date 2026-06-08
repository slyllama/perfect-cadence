extends Marker3D

var event_relative := Vector2.ZERO

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if event is InputEventMouseMotion:
		event_relative = event.relative

func _process(_delta: float) -> void:
	var _last_event_relative = event_relative
	# Panning logic goes in here
	if event_relative == _last_event_relative:
		event_relative = Vector2.ZERO
