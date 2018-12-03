extends Node2D

var mobs = []
var move_count = 2
var direction = 1
var move_y = 0

const Mob = preload('res://scenes/Enemy/units/Invader.tscn')

func create_mobs(texture, start_pos):
    for i in range(Constant.ALIEN.W):
        var mob = Mob.instance()
        mob.position = start_pos + Vector2(i * 25, 0)
        mob.load_texture(texture)
        mobs.append(mob)
        add_child(mob)

func set_animation(type):
    for mob in mobs:
        mob.get_node('AnimationPlayer').play(type)

func move():
    if move_count >= Constant.ALIEN.MOVE.LIMIT:
        direction *= -1
        move_y += Constant.ALIEN.MOVE.SPEED.Y
        move_count = 0

    if direction > 0:
        set_animation('right')
    else:
        set_animation('left')

    move_count += 1
    position.x += Constant.ALIEN.MOVE.SPEED.X * direction
    position.y = move_y

func _ready():
    move_y = position.y
