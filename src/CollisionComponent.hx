import luxe.collision.shapes.Shape;
import luxe.collision.shapes.Polygon;
import luxe.collision.data.ShapeCollision;
import luxe.collision.Collision;

class CollisionInfo
{
	public var entity : luxe.Entity;
	public var collision : ShapeCollision;
	public function new(e : luxe.Entity, s :ShapeCollision)
	{
		entity = e;
		collision = s;
	}
}

class CollisionComponent extends luxe.Component
{
	public var shape : Shape;
	public var destroyable : Bool;
	// TODO think a better name. 
	// For things like walls, but not projectiles or bonuses
	public var collidable : Bool; 


	public function new(shape : Shape, ?collidable = true, ?destroyable = false, ?name = "CollisionComponent")
	{
		super({name : name});
		this.shape = shape;
		this.destroyable = destroyable;
		this.collidable = collidable;
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

	public function collideAny(ents : Map<String, luxe.Entity>, ?componentName = "CollisionComponent") : CollisionInfo
	{
		for (ent in Luxe.scene.entities)
		{
			if (ent != this.entity && ent.get("CollisionComponent") )
			{
				var collide = collide(ent);
				if (collide != null)
				{
					return new CollisionInfo(ent, collide);
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
		// TODO quando la madonna sarà meno puttana copiare 
		// il riferimento per maggiore efficienza
		// shape.position = this.entity.pos;
		shape.position.copy_from(this.entity.pos);
	}

	override function ondestroy()
	{
		shape.destroy();
		super.ondestroy();
	}
}