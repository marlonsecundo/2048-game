extends Node

export(int) var width = 4;
export(int) var height = 4;
export(int) var initial_pieces = 2;
export(int) var pieces_per_turn = 1;
export(int) var margin = 4;

export(int) var piece_width = 75;
export(int) var piece_height = 75;
export(int) var four_piece_chance = 25;

export var board = [];

const Piece = preload("res://scenes/components/piece.tscn");

func _ready():
	randomize();

	pass

		
func setup_board():
	

	for x in range(0, height):
		board.append([]);
		for y in range(0, width):
			board[x].append(null);
			
	for i in range (0, initial_pieces):
		create_piece_at_random_spot();
		pass
	
	Events.emit_signal("board_changed");
		
			
func create_piece(x,y):
	if not is_free(x,y):
		return;

	var piece = Piece.instance();
	piece.rect_size = Vector2(piece_width, piece_height);
	piece.rect_position = get_pos_from_grid_pos(x, y);
	piece.set_value(get_piece_value());
	board[x][y] = piece;
	

func is_free(x, y):
	return board[x][y] == null;
	
func slide_pieces_to_left():
	for x in range(0, height):
		for y in range(0, width):
			board[x].append(null);
			

func get_pos_from_grid_pos(x,y):
	var margin_horizontal = (x + 1) * margin;
	var margin_vertical = (y + 1) * margin;
	var offset_horizontal = x * piece_width;
	var offset_vertical = y * piece_height;
	
	return Vector2(margin_horizontal + offset_horizontal, margin_vertical + offset_vertical);
	
func get_piece_value():
	var temp = rand_range(0,100);
	if temp <= (100-four_piece_chance):
		return 4;
	
	return 	2; 
	
func create_piece_at_random_spot():
	var empty_spots = get_empty_spots();
	empty_spots.shuffle();
	create_piece(empty_spots[0].x, empty_spots[0].y);
	
func get_empty_spots():
	var empty_spots = [];
	
	for x in range(0, width):
		for y in range(0, height):
			if is_free(x, y):
				empty_spots.append(Vector2(x,y));
	
	return empty_spots;

		