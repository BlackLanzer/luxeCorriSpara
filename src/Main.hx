
import luxe.Input;

// TODO dire a nicolò dei proiettili che non killano l'entity
class Main extends luxe.Game {

    var player : luxe.Sprite;
    var enemies : List<luxe.Sprite>;

    override function config(config:luxe.AppConfig) {

        return config;

    } //config
 
    override function ready() {
        enemies = new List<luxe.Sprite>();


        player = PlayerEntity.create(new luxe.Vector(200,200));
        enemies.add(EnemyEntity.create(new luxe.Vector(300,300)));
    } //ready

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update(dt:Float) {
        super.update(dt);

        

        // trace(player.pos);
    } //update


} //Main
