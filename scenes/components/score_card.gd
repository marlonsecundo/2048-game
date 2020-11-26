extends HBoxContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.

export var title = '';
export var score = '';
func _ready():
	$background/MarginContainer/VBoxContainer/score_label.text = score;
	$background/MarginContainer/VBoxContainer/title_label.text = title;
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
