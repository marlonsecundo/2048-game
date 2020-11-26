extends Node

export(int) var width = 4;
export(int) var height = 4;
export(int) var initial_pieces = 2;
export(int) var pieces_per_turn = 1;
export(int) var margin = 10;

export(int) var piece_width = 50;
export(int) var piece_height = 50;

export var board = [];

const Piece = preload("res://scenes/components/piece.tscn");

func _ready():
	setup_board();

	pass # Replace with function body.


func setup_board():
	for x in range(0, height):
		board.append([]);
		for y in range(0, width):
			board[x].append(null);
			
			
func create_piece(value, x,y):
	if not is_free(x,y):
		return;
		
	print("sdfsdf");
	var piece = Piece.instance();
	piece.rect_size = Vector2(piece_width, piece_height);
	piece.rect_position = get_pos_from_grid_pos(x, y);
	board[x][y] = piece;
	print("bbbbbbbbb");
	Events.emit_signal("board_changed");
	print("ccccc");
	

	
func is_free(x, y):
	return board[x][y] == null;
	
func get_pos_from_grid_pos(x,y):
	var margin_horizontal = (x + 1) * margin;
	var margin_vertical = (y + 1) * margin;
	var offset_horizontal = x * piece_width;
	var offset_vertical = y * piece_height;
	
	return Vector2(margin_horizontal + offset_horizontal, margin_vertical + offset_vertical);
	
		