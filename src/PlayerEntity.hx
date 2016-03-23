import luxe.collision.shapes.Polygon;

class PlayerEntity 
{
	public static function create(position : luxe.Vector, ?name : String = "PlayerEntity") : luxe.Entity
	{
		var player = new luxe.Entity({pos : position, name : name});

		player.add(new VisualComponent(new luxe.Vector(50,50)));
		player.add(new PhysicsComponent(100));
		player.add(new InputComponent());
		player.add(new ShootingComponent());
		// player.add(new CollisionComponent(Polygon.rectangle(position.x,position.y,50,50)));

		return player;
	}
}