class ShotEntity 
{
	public static function create(position : luxe.Vector, direction : luxe.Vector)
	{
		var shot = new luxe.Entity({pos : position});

		shot.add(new VisualComponent(new luxe.Vector(5,5)));
		shot.add(new ProjectileComponent(1, direction));

		return shot;
	}
}