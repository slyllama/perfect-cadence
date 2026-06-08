extends Node

var _delta := 0.0
var _pdelta := 0.0

func crit_lerp(speed: float) -> float:
	return(clamp(1.0 - exp(-speed * _delta), 0.0, 1.0))

func crit_plerp(speed: float) -> float:
	return(clamp(1.0 - exp(-speed * _pdelta), 0.0, 1.0))

# Get all children recursively
func get_all_children(node: Node, arr := []) -> Array:
	arr.push_back(node)
	for _child in node.get_children():
		arr = get_all_children(_child, arr)
	return(arr)

func get_window_center() -> Vector2:
	return(get_window().size / 2.0 / get_window().content_scale_factor)

# Convert a vector in string format "X, Y, Z" to a typed Vector3
func str_to_vec3(string: String) -> Vector3:
	var _a: PackedStringArray = string.split(", ")
	if _a.size() != 3: return(Vector3.ZERO) # return 0 if the input size isn't right
	return(Vector3(_a[0].to_float(), _a[1].to_float(), _a[2].to_float()))

func vec3_to_str(vec: Vector3) -> String:
	return(str(snapped(vec.x, 0.01)) + ", "
		+ str(snapped(vec.y, 0.01)) + ", "
		+ str(snapped(vec.z, 0.01)))

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(delta: float) -> void: _delta = delta
func _physics_process(delta: float) -> void: _pdelta = delta
