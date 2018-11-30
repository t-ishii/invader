extends Node2D

export (PackedScene) var Mob

var mobs = []

func create_mobs():
    for i in range(11):
        var mob = Mob.instance()
        mob.position = Vector2(37.5, 100) + Vector2(i * 25, 0)
        add_child(mob)

func _ready():
    create_mobs()
