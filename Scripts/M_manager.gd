extends Node


var m_counter = 4

var mini = {
	0: preload("res://Scenes/Minigames/1.tscn"),
	1: preload("res://Scenes/Minigames/2.tscn"),
	2: preload("res://Scenes/Minigames/3.tscn"),
	3: preload("res://Scenes/Minigames/4.tscn"),
}

var completed = preload("res://Sprites/completed.png")
var audiostream = preload("res://Music/AudioPlayer.tscn")

var spawnpoint
var last_caller

func _ready():
	randomize()
	last_caller = null

func reset_spawnpoint(node):
	spawnpoint = node
	
func m_choose():
	return randi()%m_counter

func m_open(caller):
	if caller.minigame != null:
		if last_caller != null:
			m_close()
		var m_inst
		
		m_inst = mini[caller.minigame].instance()
		
		last_caller = caller
		spawnpoint.add_child(m_inst)

func on_finished():
	last_caller.on_finished()
	var sprite = Sprite.new()
	sprite.texture = completed
	spawnpoint.add_child(sprite)
	sprite.position = Vector2(348, 320)
	var sound = audiostream.instance()
	spawnpoint.add_child(sound)
	sound._play("victory")

func m_close():
	for child in spawnpoint.get_children():
		child.queue_free()
