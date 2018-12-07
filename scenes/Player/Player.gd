extends Area2D

export (int) var speed = 3
export (PackedScene) var Ballet

var window
var ballet

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
        position.x += direction * speed
    
    if ballet != null and !weakref(ballet).get_ref():
        ballet = null

    if ballet == null and Input.is_action_pressed('space'):
        ballet = Ballet.instance()
        ballet.set_owner_name('Player')
        ballet.position = position + Vector2(0, -25)
        get_parent().add_child(ballet)


func _ready():
    window = get_viewport_rect().size
