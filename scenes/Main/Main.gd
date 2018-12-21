extends Node

var clone_player
var player_dead_count = 0

func _ready():
    $Player.position = $Position2D.position
    clone_player = $Player.duplicate()

func _on_ResbornTimer_timeout():
    $ResbornTimer.stop()
    add_child(clone_player.duplicate())

func _on_Player_hit():
    player_dead_count += 1
    if player_dead_count < Constant.PLAYER.LIFE:
        $ResbornTimer.start()
