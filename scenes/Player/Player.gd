extends Area2D

export (int) var speed = 3

var window;

func _process(delta):
    
    var direction = 0;
    
    if Input.is_action_pressed('left'):
        direction = -1
    elif Input.is_action_pressed('right'):
        direction = 1

    if position.x < 10:
        position.x = 10
    elif position.x > window.x - 10:
        position.x = window.x - 10
    else:
        position.x += direction * 3


func _ready():
    window = get_viewport_rect().size
