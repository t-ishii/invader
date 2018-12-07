extends Node2D

const Enemy = preload('res://scenes/Enemy/Enemy.tscn')

var alien_resources = [
    Constant.ALIEN_FACE,
    Constant.ALIEN_FACE,
    Constant.INVADER,
    Constant.INVADER,
    Constant.HUMAN
]

var mob_lines = []
var direction = 1

func create_invader_lines():
    var span = Vector2(0, 35)
    var pos = Constant.ALIEN.START_POS

    for res in alien_resources:
        var mobs = []

        for i in range(Constant.ALIEN.W):
            var mob = Enemy.instance()

            mob.load_texture(res)
            mob.position = pos + Vector2(mobs.size() * 25, 0)
            mobs.append(mob)

        pos -= span
        mob_lines.append(mobs)

func show():
    for mobs in mob_lines:
        yield(get_tree().create_timer(Constant.ALIEN.DURATION), 'timeout')

        for mob in mobs:
            add_child(mob)

func get_most_left_mob():
    var mob = null
    var position = null
    
    for row_idx in range(Constant.ALIEN.H):
        for col_idx in range(Constant.ALIEN.W):
            var tmp = mob_lines[row_idx][col_idx]
            
            if !weakref(tmp).get_ref():
                continue

            if tmp == null:
                continue
            
            if position == null or position.x > tmp.position.x:
                position = tmp.position
                mob = tmp

    return mob

func get_most_right_mob():
    var mob = null
    var position = null
    
    for row_idx in range(Constant.ALIEN.H - 1, -1, -1):
        for col_idx in range(Constant.ALIEN.W - 1, -1, -1):
            var tmp = mob_lines[row_idx][col_idx]

            if !weakref(tmp).get_ref():
                continue
            
            if tmp == null:
                continue

            if position == null or position.x < tmp.position.x:
                position = tmp.position
                mob = tmp

    return mob

func move():
    var left_mob = get_most_left_mob()
    var right_mob = get_most_right_mob()
    var move_y = 0

    if left_mob == null or right_mob == null:
        return

    if left_mob.position.x < 25:
        direction = 1
        move_y = Constant.ALIEN.MOVE.SPEED.Y
    elif right_mob.position.x > 325:
        direction = -1
        move_y = Constant.ALIEN.MOVE.SPEED.Y

    for mobs in mob_lines:

        yield(get_tree().create_timer(Constant.ALIEN.DURATION), 'timeout')

        for mob in mobs:
            if mob != null and weakref(mob).get_ref():
                mob = weakref(mob).get_ref()
                mob.play_anime_by_direction(direction)
                mob.position.x += Constant.ALIEN.MOVE.SPEED.X * direction
                mob.position.y += move_y

func _ready():
    create_invader_lines()
    show()
    $MoveTimer.start()
