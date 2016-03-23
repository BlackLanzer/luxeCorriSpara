class ShootingComponent extends luxe.Component
{
	public var deltaShot : Float;
	var lastShot : Float = 0;

	var projectiles : List<luxe.Entity>;

	public function new(?deltaShot = 500, ?name = "ShootingComponent")
	{
		super({name : name});

		this.deltaShot = deltaShot;

	}

	override function init()
	{
		super.init();

		projectiles = new List<luxe.Entity>();
	}

	public override function update(dt:Float)
	{
		super.update(dt);

		for(proj in projectiles)
		{
			if (proj.get("ProjectileComponent").toDestroy)
			{
				proj.destroy();
				projectiles.remove(proj);
			}
		}
	}
	public function shoot(direction : luxe.Vector)
	{
		if (Date.now().getTime() > lastShot + deltaShot)
		{
			projectiles.add(ShotEntity.create(this.entity.pos, direction));

			lastShot = Date.now().getTime();
		}
	}
}