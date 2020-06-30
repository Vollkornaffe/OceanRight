tool
extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var sdf = SDF.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	sdf.calc_from_poly2d(1280, 720, get_node("Polygon2D"))
	boid.init_particles(get_node("PassiveParticles"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta):
	boid.step(get_node("PassiveParticles"), sdf, 2*delta)
	pass
