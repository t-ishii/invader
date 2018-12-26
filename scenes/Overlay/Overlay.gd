extends CanvasLayer

var players = []

func _process(delta):
    $ScoreValueL.text = '%04d' % Status.score

func _ready():
    var parent_name = get_parent().name

    if parent_name == 'Title':
        $Down.visible = false
        $PlayerSprite.visible = false
        set_process(false)
    else:
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
