extends KinematicBody2D

export (int) var speed = 250
export (PackedScene) var Ballet

var window
var ballet

func _process(delta):
    
    var direction = 0;
    
    if Input.is_action_pressed('left'):
        direction = -1
    elif Input.is_action_pressed('right'):
        direction = 1
    
    move_and_slide(Vector2(speed, 0) * direction)
    
    if ballet != null and !weakref(ballet).get_ref():
        ballet = null

    if ballet == null and Input.is_action_pressed('space'):
        ballet = Ballet.instance()
        ballet.position = position + Vector2(0, -25)
        get_parent().add_child(ballet)


func _ready():
    window = get_viewport_rect().size
