extends AudioStreamPlayer

var choice = {  "Title":  "res://Music/Crinoline Dreams.mp3",\
				"Main":   "res://Music/Deuces.mp3",\
			  }

func _ready():
	# I usually change music at the pressing of a button, but sometimes it is not possible
	if self.name in choice.keys():
		MusicPlayer.change_music(choice[self.name])
