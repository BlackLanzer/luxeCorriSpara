class PhysicsComponent extends luxe.Component
{
	var speed : Float;

	public function new(speed : Float, ?name : String = "PhysicsComponent")
	{
		super({name : name});

		this.speed = speed;
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