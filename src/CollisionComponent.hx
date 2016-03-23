import luxe.collision.shapes.Shape;
import luxe.collision.shapes.Polygon;
import luxe.collision.data.ShapeCollision;
import luxe.collision.Collision;

class CollisionComponent extends luxe.Component
{
	public var shape : Shape;
	public var destroyable : Bool;


	public function new(shape : Shape, ?name = "CollisionComponent")
	{
		super({name : name});
		this.shape = shape;
	}

	// return null if it doesn't collide or ent doesn't have a CollisionComponent
	public function collide(ent : luxe.Entity, ?componentName = "CollisionComponent") : ShapeCollision
	{
		var entShape = ent.get(componentName);
		if (entShape == null)
		{
			return null;
		}
		return Collision.shapeWithShape(this.shape, entShape.shape);
	}

	public function collideAny(ents : Map<String, luxe.Entity>, ?componentName = "CollisionComponent") : ShapeCollision
	{
		for (ent in Luxe.scene.entities)
		{
			if (ent != this.entity && ent.get("CollisionComponent") )
			{
				var collide = collide(ent);
				if (collide != null)
				{
					trace("colliding with " + ent.name);
					return collide;
				}
			}
		}
		return null;
	}

	public override function init()
	{
		super.init();
		// shape.position = this.entity.pos;

	}

	public override function update(dt:Float)
	{
		super.update(dt);
		// shape.position = this.entity.pos;
		shape.position.copy_from(this.entity.pos);
	}

	override function ondestroy()
	{
		shape.destroy();
		super.ondestroy();
	}
}