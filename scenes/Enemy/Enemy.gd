extends StaticBody2D

func load_texture(texture):
    $Sprite.texture = load(texture)

func play_anime_by_direction(direction):
    var animation_type = 'left'
    if direction > 0:
        animation_type = 'right'

    if $AnimationPlayer.current_animation != 'dead':
        $AnimationPlayer.play(animation_type)
