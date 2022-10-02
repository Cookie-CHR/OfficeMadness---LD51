extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var text = preload("res://Sprites/Text_file.png")
var image = preload("res://Sprites/Img_file.png")
var music = preload("res://Sprites/Music_file.png")
var virus = preload("res://Sprites/Virus.png")
var count_viruses = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var count_files = 40
	for i in range(count_files):
		var button = TextureButton.new()
		
		add_child(button)
		button.set_position(Vector2((i%8)*80+35, (i/8)*75+140))
		var r = randi()%5
		if r<=1:
			button.texture_normal = virus
			count_viruses+=1
			button.connect("pressed", self, "on_virus_found", [button])
		elif r==2:
			button.texture_normal = text
		elif r==3:
			button.texture_normal = image
		elif r==4:
			button.texture_normal = music
		button.name = str(i)
		

func on_virus_found(v):
	v.hide()
	count_viruses -=1
	if count_viruses <= 0:
		MManager.on_finished()

