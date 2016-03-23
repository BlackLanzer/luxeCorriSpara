import luxe.collision.shapes.Polygon;

class EnemyEntity
{
	public static function create(position : luxe.Vector, ?color : luxe.Color, ?name : String = "EnemyEntity") : luxe.Sprite
	{
		if (color == null) color = new luxe.Color().rgb(0xffff00);

		var size = new luxe.Vector(30,30);

		var enemy = new luxe.Sprite({pos : position, size : size, color : color, name : name});

		enemy.add(new PhysicsComponent(80));
		enemy.add(new CollisionComponent(Polygon.rectangle(position.x,position.y,30,30),true,true));

		return enemy;
	}
}