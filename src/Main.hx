
import luxe.Input;

class Main extends luxe.Game {

    var player : luxe.Entity;
    var enemies : List<luxe.Entity>;

    override function config(config:luxe.AppConfig) {

        return config;

    } //config
 
    override function ready() {
        enemies = new List<luxe.Entity>();


        player = PlayerEntity.create(new luxe.Vector(200,200));
        enemies.add(EnemyEntity.create(new luxe.Vector(500,500)));
    } //ready

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update(dt:Float) {
        super.update(dt);

        var playerInput : InputComponent = player.get("InputComponent");
        var playerPhysics : PhysicsComponent = player.get("PhysicsComponent");
        var playerCollision : CollisionComponent = player.get("CollisionComponent");


        // MOVEMENTS
        playerPhysics.move(playerInput.playerDirection,dt);

        // SHOOTING
        if (playerInput.shooting)
        {
            var projDirection = new luxe.Vector(Luxe.screen.cursor.pos.x - player.pos.x, Luxe.screen.cursor.pos.y - player.pos.y);
            projDirection.normalize();

            player.get("ShootingComponent").shoot(projDirection);
        }

        // COLLISIONS
        for (enemy in enemies)
        {
            if (playerCollision.collide(enemy) != null)
            {
                trace("collide");
            }
        }

        trace(player.pos);
    } //update


} //Main
