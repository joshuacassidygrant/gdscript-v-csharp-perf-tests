using Godot;
using System;
using System.Collections.Generic;
using System.Linq;

public partial class PerfTestsCs : Node
{
	
	public void Test1RenderNTiles(int tileCount) {
		PackedScene tileScene = ResourceLoader.Load<PackedScene>("res://scenes/block_renderer.tscn");
		
		for (int i = 0; i < tileCount; i++) {
			
			Node2D n = tileScene.Instantiate<Node2D>();
			AddChild(n);
			n.Position = new Vector2(i / 20, i % 20);
		}
	}
	
	public void Test2RotateNTileShape(int tileCount) {
		List<Vector2I> tiles = Enumerable.Range(0, tileCount).Select(x => new Vector2I(x, 0)).ToList();
		
		tiles = tiles.Select(v => RotateTile(v)).ToList();
	}
	
	public void Test3SortNScores(int count) {
		RandomNumberGenerator rng = new RandomNumberGenerator();
		List<int> scores = [];
		for (int i = 0; i < count; i++) {
			scores.Add(rng.RandiRange(i, 2 * i));
		}

		scores.OrderBy(x => x);
	}
	
	public bool Test4Check0s(int n) {
		int[] row = new int[n];
		Array.Fill(row, 1);
		return row.All(x => x > 0);
	}
	
	public void CleanUp() {
		foreach (Node child in GetChildren()) {
			child.QueueFree();
		}
	}
	
	private Vector2I RotateTile(Vector2I tile) {
		float rads = Mathf.Pi;
		return new Vector2I(
			Mathf.RoundToInt(tile.X * Mathf.Cos(rads) - tile.Y * Mathf.Sin(rads)),
			Mathf.RoundToInt(tile.X * Mathf.Sin(rads) + tile.Y * Mathf.Cos(rads))
		);
	}
}
