extends Node

export (PackedScene) var InvaderA

func _ready():
    for i in range(11):
        var invaderA = InvaderA.instance()
        invaderA.position = Vector2(15, 0) + Vector2(i * 25, 25)
        add_child(invaderA)
