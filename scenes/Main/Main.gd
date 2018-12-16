extends Node

var clone_player

func _ready():
    $Player.position = $Position2D.position
    clone_player = $Player.duplicate()

func _on_ResbornTimer_timeout():
    $ResbornTimer.stop()
    add_child(clone_player.duplicate())

func _on_Player_hit():
    $ResbornTimer.start()
    print('hit!')
