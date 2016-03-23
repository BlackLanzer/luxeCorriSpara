import luxe.collision.shapes.Polygon;

class ShotEntity 
{
	public static function create(position : luxe.Vector, direction : luxe.Vector, owner : luxe.Entity, ?name : String = "ShotEntity") : luxe.Sprite
	{
		var size = new luxe.Vector(5,5);
		var color = new luxe.Color().rgb(0xf00000);
		var shot = new luxe.Sprite({pos : position, size : size, color : color, name : name});

		shot.add(new ProjectileComponent(owner, 1, direction));
		shot.add(new CollisionComponent(Polygon.rectangle(position.x,position.y,5,5),false));

		return shot;
	}
}