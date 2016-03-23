import luxe.collision.shapes.Polygon;

class EnemyEntity
{
	public static function create(position : luxe.Vector, ?color : luxe.Color, ?name : String = "EnemyEntity")
	{
		if (color == null) color = new luxe.Color().rgb(0xffff00);

		var enemy = new luxe.Entity({pos : position, name : name});

		enemy.add(new VisualComponent(new luxe.Vector(30,30),color));
		enemy.add(new PhysicsComponent(80));
		enemy.add(new CollisionComponent(Polygon.rectangle(position.x,position.y,30,30)));

		return enemy;
	}
}