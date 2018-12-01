extends Node2D

func _ready():
    $Invaders.create_mobs(Constant.ALIEN.START_POS)
