extends CanvasLayer

var players = []

func _ready():
    players.append($PlayerSprite.name)
    for i in range(Constant.PLAYER.LIFE - 1):
        var sprite = $PlayerSprite.duplicate(DUPLICATE_GROUPS)
        sprite.position = sprite.position + Vector2(30 + 30 * i, 0)
        add_child(sprite)
        players.append(sprite.name)

func _on_Player_hit():
    var target = players.pop_back()
    for node in get_children():
        if node.name == target:
            node.queue_free()
