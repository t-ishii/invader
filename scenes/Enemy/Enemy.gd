extends StaticBody2D

const EnemyBallet = preload('res://scenes/Ballet/EnemyBallet.tscn')

var is_dead = false

func dead():
    is_dead = true
    $AnimationPlayer.play('dead')

func attack():
    var ballet = EnemyBallet.instance()
    ballet.position = position + Vector2(0, 25)
    if has_node('/root/Main'):
        get_node('/root/Main').add_child(ballet)

func load_texture(texture):
    $Sprite.texture = load(texture)

func play_anime_by_direction(direction):
    var animation_type = 'left'
    if direction > 0:
        animation_type = 'right'

    if $AnimationPlayer.current_animation != 'dead':
        $AnimationPlayer.play(animation_type)
