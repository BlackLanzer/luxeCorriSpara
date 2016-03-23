class ShootingComponent extends luxe.Component
{
	public var deltaShot : Float;
	var lastShot : Float = 0;

	var projectiles : List<luxe.Entity>;
	// needed because creating too many projectiles with the same name
	// overwrite the existing ones
	var projectileId : Int; 

	public function new(?deltaShot = 500, ?name = "ShootingComponent")
	{
		super({name : name});

		this.deltaShot = deltaShot;

	}

	override function init()
	{
		super.init();

		projectiles = new List<luxe.Entity>();
		projectileId = 0;
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
			projectiles.add(ShotEntity.create(this.entity.pos, direction, this.entity, "ShotEntity"+projectileId++));
			lastShot = Date.now().getTime();
		}
	}
}