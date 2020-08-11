package vector;

/**
 * ...
 * @author Zankuro#999 //discord (add me first)
 */

abstract Vector2(Array<Float>) to Array<Float> {
    public var x(get, set):Float;
    public var y(get, set):Float;
 
/*  Constructor
 *  =========================================================================*/
    public inline function new(x:Float, y:Float) {
        this = new Array<Float>();
        this.push(x);
        this.push(y);
    }
 
/*  Casting
 *  =========================================================================*/
    @:from
    public static inline function fromArray(a:Array<Float>):Vector2 { return new Vector2(a[0], a[1]); }
	@:from
	public static inline function fromString(a:String): Vector2 {
		var b: Array<String> = a.split(" ");
		return new Vector2(Std.parseFloat(b[0]), Std.parseFloat(b[1]));
	}
	
/*	Operators
 * 	=========================================================================*/
	@:op(A + B)
    public static function add(lhs:Vector2, rhs:Vector2):Vector2 {
        return new Vector2(lhs.x + rhs.x, lhs.y + rhs.y);
    }
	@:op(A - B)
	public static function subtract(lhs:Vector2, rhs:Vector2):Vector2 {
        return new Vector2(lhs.x - rhs.x, lhs.y - rhs.y);
    }
	@:op(A * B)
	public static function multiply(lhs:Vector2, rhs:Vector2):Vector2 {
		return new Vector2(lhs.x * rhs.x, lhs.y * rhs.y);
    }
	@:op(A / B)
	public static function divide(lhs:Vector2, rhs:Vector2):Vector2 {
        return new Vector2(lhs.x / rhs.x, lhs.y / rhs.y);
    }
	@:op(A % B)
	public static function modulo(lhs:Vector2, rhs:Vector2):Vector2 {
        return new Vector2(lhs.x + rhs.x, lhs.y + rhs.y);
    }
	@:op(A == B)
	public static function equals(lhs:Vector2, rhs:Vector2):Bool {
        return (lhs.x == rhs.x && lhs.y == rhs.y) ? true : false;
    }
	@:op(A != B)
	public static function nequals(lhs:Vector2, rhs:Vector2):Bool {
        return (lhs.x != rhs.x && lhs.y != rhs.y) ? true : false;
    }
	@:op(A < B)
	public static function lt(lhs:Vector2, rhs:Vector2):Bool {
        return (lhs.x < rhs.x && lhs.y < rhs.y) ? true : false;
    }
	@:op(A <= B)
	public static function ltequals(lhs:Vector2, rhs:Vector2):Bool {
		return (lhs.x <= rhs.x && lhs.y <= rhs.y) ? true : false;
    }
	@:op(A > B)
	public static function gt(lhs:Vector2, rhs:Vector2):Bool {
		return (lhs.x > rhs.x && lhs.y > rhs.y) ? true : false;
    }
	@:op(A >= B)
	public static function gtequals(lhs:Vector2, rhs:Vector2):Bool {
		return (lhs.x >= rhs.x && lhs.y >= rhs.y) ? true : false;
    }
	@:op(++A)
	public static function increment(lhs:Vector2):Vector2 {
		return new Vector2(++lhs.x, ++lhs.y);
    }
	@:op(--A)
	public static function decrement(lhs:Vector2):Vector2 {
		return new Vector2(--lhs.x, --lhs.y);
	}
	@:op(A++)
	public static function postincrement(lhs:Vector2):Vector2 {
		return new Vector2(lhs.x++, lhs.y++);
    }
	@:op(A--)
	public static function postdecrement(lhs:Vector2):Vector2 {
		return new Vector2(lhs.x--, lhs.y--);
    }
	
/*  Public Methods
 *  =========================================================================*/	
	public inline function toString(): String { return '$x $y'; }
	public inline function toArray(): Array<Float> { return this; }
	public inline function toInt(): Vector2 { return floatToInt_v(this); }
	
/*  Tools Methods
 *  =========================================================================*/
	public inline function flip(): Vector2 {
		var _new = [ this[1], this[0] ];
		return this = _new;
	}
	public inline function abs(): Vector2 {
		var _new = [( -this[0] >= 0 ) ? -this[0] : this[0], ( -this[1] >= 0 ) ? -this[1] : this[1]];
		return this = _new;
	}
	public inline function clamp(max: Float = 180, min: Float = 0): Vector2 {
		var _new = [(this[0] < min) ? min : (max < this[0]) ? max : this[0], (this[1] < min) ? min : (max < this[1]) ? max : this[1]];
		return this = _new;
	}
/*  Private Methods
 *  =========================================================================*/
    private inline function get_x():Float {  return this[0]; }
    private inline function get_y():Float {  return this[1]; }
    private inline function set_x(value:Float):Float {  return this[0] = value; }
    private inline function set_y(value:Float):Float {  return this[1] = value; }

/* Misc Tools
 * =========================================================================*/
	private function floatToInt_v(v: Vector2): Vector2 {
		var x_dec = v.x - Std.int(v.x);
		var y_dec = v.y - Std.int(v.y);
		return new Vector2((x_dec <= .50) ? Std.int(v.x) : Std.int(v.x) + 1, (y_dec <= .50) ? Std.int(v.y) : Std.int(v.y) + 1);
	}
}



