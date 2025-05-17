extends Node

func _ready() -> void:
	run_tests()
	
func t() -> int:
	return Time.get_ticks_msec()	

func run_tests() -> void:
	print("Starting tests at " + str(t()))

	print("======================")
	print("Test 1: Render n tiles")
	
	var ns = [100, 1000, 5000, 10000]
	
	for n in ns:
		print("n = %d" % n)
		run_test("gd render %d tiles" % n, PerfTestsGd.test_1_render_n_tiles.bind(n))
		run_test("c# render %d tiles" % n, PerfTestsCs.Test1RenderNTiles.bind(n))

	print("======================")
	print("Test 2: Rotate n tiles")
	ns = [1000, 10000, 100000, 500000]
	for n in ns:
		print("n = %d" % n)
		run_test("gd rotate %d tiles" % n, PerfTestsGd.test_2_rotate_shape_with_n_tiles.bind(n))
		run_test("c# rotate %d tiles" % n, PerfTestsCs.Test2RotateNTileShape.bind(n))

	print("======================")
	print("Test 3: Sorting n scores")
	ns = [10000, 100000, 1000000]
	for n in ns:
		print("n = %d" % n)
		run_test("gd sort %d scores" % n, PerfTestsGd.test_3_sort_n_scores.bind(n))
		run_test("c# sort %d scores" % n, PerfTestsCs.Test3SortNScores.bind(n))
	
	print("======================")
	print("Test 4: Checking n tiles for a 0")
	ns = [10000, 100000, 1000000, 2000000]
	for n in ns:
		print("n = %d" % n)
		run_test("gd check %d tiles" % n, PerfTestsGd.test_4_check_0s.bind(n))
		run_test("c# check %d tiles" % n, PerfTestsCs.Test4Check0s.bind(n))

	var end_time = t()
	print("Ending tests at " + str(end_time))

	

func run_test(name: String, fn: Callable) -> void:
	var time = t()
	fn.call()
	var diff = t() - time
	print("Test %s took %d msec" % [name, diff])
	clean_up()
	
func clean_up():
	PerfTestsCs.CleanUp()
	PerfTestsGd.clean_up()
