extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var password
var ascii_letters_and_digits = "abcdefghijkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789"

# Called when the node enters the scene tree for the first time.
func _ready():
	password = gen_unique_str(10)
	get_node("Label").text = password
	pass # Replace with function body.


func gen_unique_str(length):
	var result = ""
	for _i in range(length):
		result += ascii_letters_and_digits[randi() % ascii_letters_and_digits.length()]
	return result

func confront():
	if get_node("TextEdit").text == password:
		MManager.on_finished()
