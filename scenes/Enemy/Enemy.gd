extends Area2D

func _on_Enemy_body_entered(body):
    $AnimationPlayer.play('dead')

func load_texture(texture):
    $Sprite.texture = load(texture)

func play_anime_by_direction(direction):
    var animation_type = 'left'
    if direction > 0:
        animation_type = 'right'
    $AnimationPlayer.play(animation_type)