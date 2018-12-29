extends KinematicBody2D

export (int) var speed = 250
export (PackedScene) var Ballet

signal hit
signal wakeup

var window
var ballet
var is_dead = false
var body_regex

func hit():
    is_dead = true
    emit_signal('hit')
    $AnimationPlayer.play('dead')

func connects():
    # bind signals when player resborn
    connect('hit', get_parent(), '_on_Player_hit')
    connect('hit', get_node('/root/Main/PlayerOverlay'), '_on_Player_hit')
    connect('hit', get_node('/root/Main/Enemies'), '_on_Player_hit')
    connect('wakeup', get_node('/root/Main/Enemies'), '_on_Player_wakeup')

func _process(delta):

    if is_dead:
        return

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

    var body = get_slide_collision(get_slide_count() - 1)
    if body:
        var body_name = body.collider.name
        if body_regex.search(body_name) || body_name == 'Enemy':
            hit()

func _ready():
    connects()
    body_regex = RegEx.new()
    body_regex.compile('@Enemy@')
    window = get_viewport_rect().size
    emit_signal('wakeup')
