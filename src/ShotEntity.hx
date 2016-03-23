class ShotEntity 
{
	public static function create(position : luxe.Vector, direction : luxe.Vector, ?name : String = "ShotEntity") : luxe.Sprite
	{
		var size = new luxe.Vector(5,5);
		var color = new luxe.Color().rgb(0xf00000);
		var shot = new luxe.Sprite({pos : position, size : size, color : color, name : name});


		shot.add(new ProjectileComponent(1, direction));


		return shot;
	}
}