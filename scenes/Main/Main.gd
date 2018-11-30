extends Node

export (PackedScene) var Invaders

func load_enemies():
    add_child(Invaders.instance())

func _ready():
    load_enemies()