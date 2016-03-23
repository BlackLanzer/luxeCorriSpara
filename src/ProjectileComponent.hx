class ProjectileComponent extends luxe.Component
{
	public var timeToLive : Float;
	public var speed : Float;
	public var direction : luxe.Vector;

	public var toDestroy = false;

	var owner : luxe.Entity;
	var collisionComp : CollisionComponent;

	public function new(owner : luxe.Entity, time : Float, direction : luxe.Vector, ?speed : Float = 500, ?name = "ProjectileComponent")
	{
		super({name : name});

		this.timeToLive = time;
		this.speed = speed;
		this.direction = direction;
		this.owner = owner;
	}

	override function init()
	{
		super.init();
		this.collisionComp = this.entity.get("CollisionComponent");
	}


	public override function update(dt:Float)
	{
		super.update(dt);

		// MOVEMENT
		this.entity.pos.x += speed * direction.x * dt;
		this.entity.pos.y += speed * direction.y * dt;

		// EXISTENCE
		this.timeToLive -= dt;
		if(entity.pos.x > Luxe.screen.width || entity.pos.x < 0 || entity.pos.y > Luxe.screen.height || entity.pos.y < 0 || this.timeToLive < 0)
		{
			this.toDestroy = true;	
		}

		// COLLISION
		var collision = collisionComp.collideAny(Luxe.scene.entities);
		if (collision != null)
		{
			var collisionComp = collision.entity.get("CollisionComponent");
			// trace(collision.entity.get("CollisionComponent").name);
			if (collisionComp.destroyable)
			{
				// trace("destroying " + collisionComp.name);
				collision.entity.destroy();
			}
			if (collision.entity != owner && collisionComp.collidable)
			{
				this.toDestroy = true;
			}
		}
	}
}