extends TextureProgress


var finished = false
# Called when the node enters the scene tree for the first time.
func _ready():
	value = 0
	max_value = 200

func _process(delta):
	if not finished:
		if value >= max_value:
			finished = true
			MManager.on_finished()
		else:
			self.value -= delta*20

func boost():
	value +=10
	if value >= max_value:
		MManager.on_finished()
