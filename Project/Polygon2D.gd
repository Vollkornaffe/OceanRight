tool
extends Polygon2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func next_point(p):

	var v = get_polygon()
	var N = v.size()
	
	var r = Vector2()
	var d = (p-v[0]).length_squared()
	var s = 1.0
	var j = N-1
	for i in range(0, N):
		# distance
		var e = v[j] - v[i]
		var w = p - v[i]
		var b = w - e * clamp(w.dot(e) / e.length_squared(), 0.0, 1.0)
		
		if d > b.length_squared():
			d = b.length_squared()
			r = b
	
		var cond = [p.y>=v[i].y, p.y<v[j].y, e.x*w.y>e.y*w.x]
		if !cond.has(false) or !cond.has(true):
			s *= -1.0
		j = i
	
	return [s, p - r]
