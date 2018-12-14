extends CanvasLayer

func _ready():
    for i in range(Constant.PLAYER.LIFE - 1):
        var sprite = $PlayerSprite.duplicate()
        sprite.position = sprite.position + Vector2(30 + 30 * i, 0)
        add_child(sprite)

func _on_Player_hit(life):
    pass