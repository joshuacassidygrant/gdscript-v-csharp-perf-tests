# gdscript-v-csharp-perf-tests
Just some tests to compare relative processing speeds between GDScript and C# in Godot

## Typical results

### test1: instantiate, addChild and position n nodes
| n | gd | c# |
|---|:---:|---:|
|100   |1 |	5|
|1000	 |6 |  7|
|5000	|31 |	43|
|10000|68	|103|
		
		
### test2: rotate n vector2is
| n | gd | c# |
|---|:---:|---:|
|1000	|1|	2|
|10000|	8	|1|
|100000	|75|	4|
|500000	|376	|19|
		
		
### test3: sorting numbers
| n | gd | c# |
|---|:---:|---:|
|10000	 |2	 |2|
|100000	 |28 |1|
|1000000 |315|	17|
		
		
### test4: checking n numbers for a 0		
| n | gd | c# |
|---|:---:|---:|
|10000	  |0	|3|
|100000	  |1	|1|
|1000000	|5	|3|
|2000000	|12	|7|
