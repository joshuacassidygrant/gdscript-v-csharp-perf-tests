extends Node

func test_1_render_n_tiles(tile_count: int) -> void:
	var tile_scene = ResourceLoader.load("res://scenes/block_renderer.tscn")
	
	for i in range(tile_count):
		var tile = tile_scene.instantiate()
		add_child(tile)
		tile.position = Vector2(i / 20, i % 20);
	
	return
	
func test_2_rotate_shape_with_n_tiles(tile_count: int) -> void:
	var tiles: Array[Vector2i] = []
	for i in range(tile_count):
		tiles.append(Vector2i(0, i))

	var out = Array(tiles.map(func(t): return rotate_tile(t)), TYPE_VECTOR2I, "", null)
	
func test_3_sort_n_scores(scores_count: int) -> void:
	var rng = RandomNumberGenerator.new()
	var scores = []
	for i in range(scores_count):
		scores.append(rng.randi_range(i, 2 * i))
		
	scores.sort()
	
func test_4_check_0s(n: int) -> bool:
	var row = []
	row.resize(n)
	row.fill(1)
	return row.all(func(i): i > 0)

func rotate_tile(tile: Vector2i):
	var rads = PI
	return Vector2i(
		roundi(tile.x * cos(rads) - tile.y * sin(rads)),
		roundi(tile.x * sin(rads) + tile.y * cos(rads))
	)
	

func clean_up():
	for child in get_children():
		child.queue_free()
