import luxe.collision.data.ShapeCollision;

// For moving things.
class PhysicsComponent extends luxe.Component
{
	// TODO acceleration?
	public var speed : Float;
	// public var entities; //NOTE check only the collidable entities instead of all?

	public function new(speed : Float, ?collidable = false, ?destroyable = false, ?name = "PhysicsComponent")
	{
		super({name : name});

		this.speed = speed;
	}

	override function init()
	{
		super.init();
	}

	public function move(direction : luxe.Vector, dt : Float, ?speed : Float)
	{
		if (speed == null) speed = this.speed;

		this.entity.pos.x += speed * direction.x * dt;
		this.entity.pos.y += speed * direction.y * dt;
	}

	public override function update(dt : Float)
	{
		super.update(dt);

	}
}