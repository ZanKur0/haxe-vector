# haxe-vector
Most  Complete easy to use vector2d/3d for [Haxel](https://haxe.org/)


## Demo
```haxe
{
// Making a vector
var vec1_i = new Vector2(10, -10); 	// Int
var vec1_f = new Vector2(10.30, 10.60);	// Float
var vec2_if = new Vector2(10, 10.60);	// Int + Float
		
		
var vec3: Vector2 = [10, 10.60];	// Vector from array
var vec4: Vector2 = "10 10.60"; 	// Vector from string (A<space>B)
// This also works for Vector 3d
vec1_f.clamp();				// Default 180 - 0
vec1_f.clamp(180, -180);		// We can change it
vec1_i.abs();				// Absolute operation
vec2_if.flip();				// x is now y and y is now x
				
// Operators!
// See in the readme the list of operators
vec1_f + vec1_f;
// and more!	
}
{
// We can do the same with Vector3
var vec1 = new Vector3(10, 10, 10);
var vec2 = new Vector3(10, 10, 10);
trace(vec1 + vec2);
}
```
## List of operators
| Sign | Operator | Return |
|-|-|-|
| ++i | increment | Number |
| i++ | postincrement | Number |
| --i | decrement | Number |
| i-- | postdecrement | Number |
| -i | negate | Number |
| + | add | Number |
| - | subtract | Number |
| * | multiply | Number |
| / | divide | Number |
| % | modulo | Number |
| == | equals | Bool |
| != | not equals | Bool |
| < | less than | Bool |
| <= | less than equals | Bool |
| > | greater than | Bool |
| >= | greater than equals | Bool |
| = | assign | ------ |


## How to use it
Download the package and import to your project:
```haxel
import vector.Vector2 // Vector2d
import vector.Vector3 // Vector3d
```
