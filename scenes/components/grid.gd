extends ColorRect


func _ready():
	Events.connect("board_changed", self, "mount_board");
	
	self.rect_size = Vector2(500,500);

	
	
func mount_board():
	for x in range(0, Game.height):
		for y in range(0, Game.width):
			if (Game.board[x][y] != null):
				add_child(Game.board[x][y]);
	
