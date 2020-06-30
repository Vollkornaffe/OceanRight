tool
extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	return
	var size = get_viewport_rect().size
	set_size(size)
	var poly = get_node("Polygon2D")
	
	self.texture = ImageTexture.new()
	var image = Image.new()
	image.create(size.x, size.y, false, Image.FORMAT_RGBA8)
	image.lock()
	for i in range(size.x):
		for j in range(size.y):
			var position = Vector2(i, j)
			var r = poly.next_point(position)
			var n = r[1].normalized()
			var c = Color(r[0], abs(n.x), abs(n.y), 1)
			image.set_pixel(i,j,c)
	
	self.texture.create_from_image(image)
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
