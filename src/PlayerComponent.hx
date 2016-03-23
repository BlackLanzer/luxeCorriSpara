class PlayerComponent extends luxe.Component
{
	var inputComp : InputComponent;
	var physicsComp : PhysicsComponent;
	var collisionComp : CollisionComponent;

	public function new(?name="PlayerComponent")
	{
		super();
	}

	override function init()
	{
		inputComp = entity.get("InputComponent");
        physicsComp = entity.get("PhysicsComponent");
        collisionComp = entity.get("CollisionComponent");
        
	}

	override function update(dt:Float)
	{
		super.update(dt);

		var moveDirection : luxe.Vector = inputComp.playerDirection;

        // SHOOTING
        if (inputComp.shooting)
        {
            var projDirection = new luxe.Vector(Luxe.screen.cursor.pos.x - entity.pos.x, Luxe.screen.cursor.pos.y - entity.pos.y);
            projDirection.normalize();

            entity.get("ShootingComponent").shoot(projDirection);

        }

        // COLLISIONS
        var collision = collisionComp.collideAny(Luxe.scene.entities);
        if (collision != null)
        {
            trace("move " + moveDirection);
            moveDirection.add(collision.unitVector);
            trace(collision.unitVector);
            trace("move dopo " + moveDirection);
        }

        // MOVEMENTS
        physicsComp.move(moveDirection,dt);
	}
}