extends Node2D

const Invaders = preload('res://scenes/Enemy/Invaders.tscn')

var mob_lines = []

func _ready():
    var span = Vector2(0, 35)
    var pos = Constant.ALIEN.START_POS
    
    var alien_resources = [
        Constant.ALIEN_FACE,
        Constant.ALIEN_FACE,
        Constant.INVADER,
        Constant.INVADER,
        Constant.HUMAN
    ]
    
    for res in alien_resources:
        var mob_line = Invaders.instance()
        mob_line.create_mobs(res, pos)
        mob_lines.append(mob_line)

        add_child(mob_line)
        yield(get_tree().create_timer(Constant.ALIEN.DURATION), 'timeout')

        mob_line.get_node('Timer').start()
        pos -= span
