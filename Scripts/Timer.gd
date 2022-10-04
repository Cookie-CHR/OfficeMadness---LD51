extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var muted = preload("res://Sprites/Music_Off.png")
var unmuted = preload("res://Sprites/Music_On.png")

var audiostream = preload("res://Music/AudioPlayer.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child.name =="Mute":
				child.icon = muted if Muter.mute else unmuted
				child.connect("pressed", self, "mute_unmute", [child])
		elif child.name=="SpawnPoint":
			MManager.reset_spawnpoint(child)
	randomize()
	GlobalTimer._play()
	_on_Timer_timeout()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	if all_occupied():
		if get_tree().change_scene("res://Scenes/Ending.tscn"):
			print("Error!")
	else:
		var chosen_caller
		while chosen_caller == null or chosen_caller.minigame != null:
			chosen_caller = get_node("Button_"+str(randi()%3))
		chosen_caller.m_choose()
		chosen_caller.change_to_active()
		var sound = audiostream.instance()
		self.add_child(sound)
		sound._play("hey")

func all_occupied():
	var flag = true
	for child in get_children():
		if child is Button:
			if child.name != "Mute" and child.minigame == null:
				flag = false
	return flag

func mute_unmute(child):
	Muter.mute_unmute()
	child.icon = muted if Muter.mute else unmuted
