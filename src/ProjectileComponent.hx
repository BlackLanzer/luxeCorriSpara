class ProjectileComponent extends luxe.Component
{
	public var timeToLive : Float;
	var speed : Float;
	var direction : luxe.Vector;

	public var toDestroy = false;

	public function new(time : Float, direction : luxe.Vector, ?speed : Float = 500, ?name = "ProjectileComponent")
	{
		super({name : name});

		this.timeToLive = time;
		this.speed = speed;
		this.direction = direction;
	}


	public override function update(dt:Float)
	{

		super.update(dt);

		this.entity.pos.x += speed * direction.x * dt;
		this.entity.pos.y += speed * direction.y * dt;

		this.timeToLive -= dt;
		if(entity.pos.x > Luxe.screen.width || entity.pos.x < 0 || entity.pos.y > Luxe.screen.height || entity.pos.y < 0 || this.timeToLive < 0)
		{
			this.toDestroy = true;			
		}
	}
}