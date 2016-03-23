import luxe.Vector;

class VisualComponent extends luxe.Component
{
	var sprite : luxe.Sprite;

	public function new(size : Vector, ?color, ?name : String = "VisualComponent")
	{
		super({name : name});

		if (color == null) color = new luxe.Color().rgb(0xf00000);

		sprite = new luxe.Sprite({size : size, color : color});

	}

	public override function init()
	{
		super.init();

		sprite.pos = this.entity.pos;
	}

	public override function update(dt:Float)
	{
		super.update(dt);
		// sprite.pos = this.entity.pos;
		trace(entity.name + ": " + sprite.pos);
	}

	public override function ondestroy()
	{
		super.ondestroy();
		sprite.destroy();
	}


}