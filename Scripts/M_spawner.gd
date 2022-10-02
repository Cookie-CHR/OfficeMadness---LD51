extends Button


var minigame

var idle = preload("res://Sprites/Caller_idle.png")
var active = preload("res://Sprites/Caller_active.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	minigame = null

func on_pressed():
	if not minigame == null:
		MManager.m_open(self)

func m_choose():
	minigame = MManager.m_choose()

func on_finished():
	minigame = null
	icon = idle

func change_to_active():
	icon = active

