class ShotEntity 
{
	public static function create(position : luxe.Vector, direction : luxe.Vector, ?name : String = "ShotEntity")
	{
		var shot = new luxe.Entity({pos : position, name : name});

		shot.add(new VisualComponent(new luxe.Vector(5,5)));
		shot.add(new ProjectileComponent(1, direction));

		return shot;
	}
}