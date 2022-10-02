extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var w_file = preload("res://Sprites/Wrong_file.png")
var r_file = preload("res://Sprites/Chosen_file.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	var rows = min(3+int(0.02*GlobalTimer.seconds_passed), 4)
	var columns = min(6+int(0.15*GlobalTimer.seconds_passed), 7)
	var count_files = rows*columns
	for i in range(count_files):
		var button = TextureButton.new()
		
		add_child(button)
		button.set_position(Vector2((i%columns)*90+35*(8-columns), (i/columns)*82+160))
		button.texture_normal = w_file
		button.name = str(i)
		

	
	var chosen_n = randi()%count_files
	var chosen_button = get_node(str(chosen_n))
	chosen_button.texture_normal = r_file

	chosen_button.connect("pressed", self, "on_chosen_found")

func on_chosen_found():
	MManager.on_finished()
