extends Area2D

export (int) var speed

var screen
var my
var direction = 1
var animation_type = 'right'

func _ready():
    my = $Sprite.region_rect.size * $Sprite.scale.x
    screen = get_viewport_rect().size

func _on_MoveTimer_timeout():
    if position.x > screen.x - my.x:
        direction *= -1
        animation_type = 'left'
    elif position.x < my.x:
        direction *= -1
        animation_type = 'right'
    
    $AnimationPlayer.play(animation_type)
    
    position.x += direction * 5
