import luxe.collision.shapes.Polygon;

class PlayerEntity 
{
	public static function create(position : luxe.Vector, ?name : String = "PlayerEntity") : luxe.Sprite
	{
		var size = new luxe.Vector(50,50);
		var color = new luxe.Color().rgb(0xf00000);
		var player = new luxe.Sprite({pos : position, size : size, color : color, name : name});

		player.add(new PhysicsComponent(100));
		player.add(new InputComponent());
		player.add(new ShootingComponent());
		player.add(new CollisionComponent(Polygon.rectangle(position.x,position.y,50,50)));
		player.add(new PlayerComponent());

		return player;
	}
}