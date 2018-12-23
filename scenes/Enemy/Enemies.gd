extends Node2D

const Enemy = preload('res://scenes/Enemy/Enemy.tscn')
const UFO = preload('res://scenes/Enemy/UFO.tscn')

var alien_resources = [
    Constant.ALIEN_FACE,
    Constant.ALIEN_FACE,
    Constant.INVADER,
    Constant.INVADER,
    Constant.HUMAN
]

var mob_lines = []
var direction = 1
var is_stop = false

func create_invader_lines():
    var span = Vector2(0, 35)
    var pos = Constant.ALIEN.START_POS

    for res in alien_resources:
        var mobs = []

        for i in range(Constant.ALIEN.W):
            var mob = Enemy.instance()
            var col = mob_lines.size()

            if col < 2:
                mob.set_score(10)
            elif col < 4:
                mob.set_score(20)
            else:
                mob.set_score(30)

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

            if tmp.is_dead:
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

            if tmp.is_dead:
                continue

            if position == null or position.x < tmp.position.x:
                position = tmp.position
                mob = tmp

    return mob

func move():
    var left_mob = get_most_left_mob()
    var right_mob = get_most_right_mob()
    var move_y = 0

    if randi() % 5 == 1:
        add_child(UFO.instance())

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
            if mob != null and !mob.is_dead:
                mob.play_anime_by_direction(direction)
                mob.position.x += Constant.ALIEN.MOVE.SPEED.X * direction
                mob.position.y += move_y

func get_under_lines():
    var under_mobs = []
    var append_idxs = []

    for row_idx in range(Constant.ALIEN.H):
        for col_idx in range(Constant.ALIEN.W):
            var mob = mob_lines[row_idx][col_idx]
            if !mob.is_dead and append_idxs.find(col_idx) == -1:
                append_idxs.append(col_idx)
                under_mobs.append(mob)
            if append_idxs.size() == Constant.ALIEN.W:
                break

    return under_mobs

func stop_enemies():
    for mobs in mob_lines:
        for mob in mobs:
            if mob.is_dead:
                continue
            mob.stop_animation()

func _on_Player_hit():
    is_stop = true
    stop_enemies()
    $MoveTimer.stop()

func _on_Player_wakeup():
    is_stop = false
    $MoveTimer.start()

func _process(delta):
    if randi() % 30 == 1 and !is_stop:
        var mobs = get_under_lines()

        if mobs.size() > 0:
            var attack_mob = mobs[randi() % mobs.size()]
            attack_mob.attack()

func _ready():
    randomize()
    create_invader_lines()
    show()
    $MoveTimer.start()
