package vector;

/**
 * ...
 * @author Zankuro#999 //discord (add me first)
 */

abstract Vector3(Array<Float>) to Array<Float> {
    public var x(get, set): Float;
    public var y(get, set): Float;
	public var z(get, set): Float;
	
/*  Constructor
 *  =========================================================================*/
    public inline function new(x: Float, y: Float, z: Float) {
        this = new Array<Float>();
        this.push(x);
        this.push(y);
		this.push(z);
    }
 
/*  Casting
 *  =========================================================================*/
    @:from
    public static inline function fromArray(a:Array<Float>):Vector3 { return new Vector3(a[0], a[1], a[2]); }
	@:from
	public static inline function fromString(a:String): Vector3 {
		var b: Array<String> = a.split(" ");
		return new Vector3(Std.parseFloat(b[0]), Std.parseFloat(b[1]), Std.parseFloat(b[2]));
	}
	@:from
	public static inline function fromMap(a: Map<String, Int>): Vector3 {
		return new Vector3(a["x"], a["y"], a["z"]);
	}
	
/*	Operators
 * 	=========================================================================*/
	@:op(A + B)
    public static function add(lhs:Vector3, rhs:Vector3):Vector3 {
        return new Vector3(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z);
    }
	@:op(A - B)
	public static function subtract(lhs:Vector3, rhs:Vector3):Vector3 {
        return new Vector3(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z);
    }
	@:op(A * B)
	public static function multiply(lhs:Vector3, rhs:Vector3):Vector3 {
		return new Vector3(lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z);
    }
	@:op(A / B)
	public static function divide(lhs:Vector3, rhs:Vector3):Vector3 {
        return new Vector3(lhs.x / rhs.x, lhs.y / rhs.y, lhs.z / rhs.z);
    }
	@:op(A % B)
	public static function modulo(lhs:Vector3, rhs:Vector3):Vector3 {
        return new Vector3(lhs.x % rhs.x, lhs.y % rhs.y, lhs.z % rhs.z);
    }
	@:op(A == B)
	public static function equals(lhs:Vector3, rhs:Vector3):Bool {
        return (lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z) ? true : false;
    }
	@:op(A != B)
	public static function nequals(lhs:Vector3, rhs:Vector3):Bool {
        return (lhs.x != rhs.x && lhs.y != rhs.y && lhs.z == rhs.z) ? true : false;
    }
	@:op(A < B)
	public static function lt(lhs:Vector3, rhs:Vector3):Bool {
        return (lhs.x < rhs.x && lhs.y < rhs.y && lhs.z < rhs.z) ? true : false;
    }
	@:op(A <= B)
	public static function ltequals(lhs:Vector3, rhs:Vector3):Bool {
		return (lhs.x <= rhs.x && lhs.y <= rhs.y && lhs.z <= rhs.z) ? true : false;
    }
	@:op(A > B)
	public static function gt(lhs:Vector3, rhs:Vector3):Bool {
		return (lhs.x > rhs.x && lhs.y > rhs.y && lhs.z > rhs.z) ? true : false;
    }
	@:op(A >= B)
	public static function gtequals(lhs:Vector3, rhs:Vector3):Bool {
		return (lhs.x >= rhs.x && lhs.y >= rhs.y && lhs.z >= rhs.z) ? true : false;
    }
	@:op(++A)
	public static function increment(lhs:Vector3):Vector3 {
		return new Vector3(++lhs.x, ++lhs.y, ++lhs.z);
    }
	@:op(--A)
	public static function decrement(lhs:Vector3):Vector3 {
		return new Vector3(--lhs.x, --lhs.y, --lhs.z);
	}
	@:op(A++)
	public static function postincrement(lhs:Vector3):Vector3 {
		return new Vector3(lhs.x++, lhs.y++, lhs.z++);
    }
	@:op(A--)
	public static function postdecrement(lhs:Vector3):Vector3 {
		return new Vector3(lhs.x--, lhs.y--, lhs.z--);
    }
	
/*  Public Methods
 *  =========================================================================*/	
	public inline function toString(): String { return '$x $y $z'; }
	public inline function toArray(): Array<Float> { return this; }
	public inline function toInt(): Vector3 { return floatToInt_v(this); }
	
/*  Tools Methods
 *  =========================================================================*/
	public inline function flip(): Vector3 {
		var _new = [ this[1], this[0], this[2] ];
		return this = _new;
	}
	public inline function abs(): Vector3 {
		var _new = [( -this[0] >= 0 ) ? -this[0] : this[0], ( -this[1] >= 0 ) ? -this[1] : this[1], ( -this[2] >= 0 ) ? -this[2] : this[2]];
		return this = _new;
	}
	public inline function clamp(max: Float = 180, min: Float = 0): Vector3 {
		var _new = [(this[0] < min) ? min : (max < this[0]) ? max : this[0], (this[1] < min) ? min : (max < this[1]) ? max : this[1], (this[2] < min) ? min : (max < this[2]) ? max : this[2]];
		return this = _new;
	}
/*  Private Methods
 *  =========================================================================*/
    private inline function get_x():Float {  return this[0]; }
    private inline function get_y():Float {  return this[1]; }
    private inline function get_z():Float {  return this[2]; }
    private inline function set_x(value:Float):Float {  return this[0] = value; }
    private inline function set_y(value:Float):Float {  return this[1] = value; }
    private inline function set_z(value:Float):Float {  return this[2] = value; }

/* Misc Tools
 * =========================================================================*/
	private function floatToInt_v(v: Vector3): Vector3 {
		var x_dec = v.x - Std.int(v.x);
		var y_dec = v.y - Std.int(v.y);
		var z_dec = v.z - Std.int(v.z);
		return new Vector3((x_dec <= .50) ? Std.int(v.x) : Std.int(v.x) + 1, (y_dec <= .50) ? Std.int(v.y) : Std.int(v.y) + 1, (z_dec <= .50) ? Std.int(v.z) : Std.int(v.z) + 1);
	}
}



