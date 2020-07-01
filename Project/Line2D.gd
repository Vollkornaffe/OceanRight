tool

extends Line2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var p = get_point_position(0)
	#print(get_parent().sdf.get_value(p))
	set_point_position(1, p + 100 * get_parent().sdf.get_gradient(p))
	pass
