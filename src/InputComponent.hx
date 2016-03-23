import luxe.Vector;
import luxe.Input;

class InputComponent extends luxe.Component
{
	public var playerDirection = new Vector(0,0);
	public var shooting = false;

	public function new(?name = "InputComponent")
	{
		super({name : name});

	}

	override function init()
	{
		super.init();
	}
	public override function update(dt : Float)
	{
		super.update(dt);

		// MOVE PLAYER
		playerDirection = new Vector(0,0);
		if (Luxe.input.keydown(Key.key_a)) playerDirection.x -= 1;
		if (Luxe.input.keydown(Key.key_d)) playerDirection.x += 1;
		if (Luxe.input.keydown(Key.key_w)) playerDirection.y -= 1;
		if (Luxe.input.keydown(Key.key_s)) playerDirection.y += 1;
		playerDirection.normalize();

		// SHOOT
		shooting = false;
		if (Luxe.input.mousedown(luxe.MouseButton.left)) shooting = true;
	}
}