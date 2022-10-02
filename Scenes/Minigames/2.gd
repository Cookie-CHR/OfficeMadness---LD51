extends Node2D


func _ready():
	get_node("Space").connect("pressed", get_node("ProgressBar"), "boost")

func _process(_delta):
	if Input.is_action_just_pressed("SPACE"):
		get_node("ProgressBar").boost()
