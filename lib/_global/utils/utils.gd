extends Node

var _delta := 0.0
var _pdelta := 0.0

func crit_lerp(speed: float) -> float:
	return(clamp(1.0 - exp(-speed * _delta), 0.0, 1.0))

func crit_plerp(speed: float) -> float:
	return(clamp(1.0 - exp(-speed * _pdelta), 0.0, 1.0))

func get_all_children(node: Node, arr := []) -> Array:
	arr.push_back(node)
	for _child in node.get_children():
		arr = get_all_children(_child, arr)
	return(arr)

func get_window_center() -> Vector2:
	var _scale := get_window().content_scale_factor
	return(get_window().size / 2.0 / _scale)

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(delta: float) -> void: _delta = delta
func _physics_process(delta: float) -> void: _pdelta = delta
