extends Panel


var muted = preload("res://Sprites/Music_Off.png")
var unmuted = preload("res://Sprites/Music_On.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalTimer._stop()
	for child in get_children():
		if child.name == "Play":
			child.connect("pressed", self, "_play")
		elif child.name == "Instructions":
			child.connect("pressed", self, "_instructions")
		elif child.name == "Menu":
			child.connect("pressed", self, "_menu")
		elif child.name == "Mute":
			child.icon = muted if Muter.mute else unmuted
			if Muter.mute:
				child.icon = muted
			else:
				child.icon = unmuted
			child.connect("pressed", self, "mute_unmute", [child])

func mute_unmute(child):
	Muter.mute_unmute()
	child.icon = muted if Muter.mute else unmuted



func _play():
	if get_tree().change_scene("res://Scenes/Main.tscn"):
		print("Error!")

func _instructions():
	if get_tree().change_scene("res://Scenes/Instructions.tscn"):
		print("Error!")

func _menu():
	if get_tree().change_scene("res://Scenes/Title.tscn"):
		print("Error!")


