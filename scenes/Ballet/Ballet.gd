extends 'BulletMain.gd'

export (int) var speed = 400

var body_regex
var bullet_regex

# ToDo ballet -> bullet

func _ready():
    linear_velocity = Vector2(0, -speed)
    body_regex = RegEx.new()
    body_regex.compile('(@Enemy@|UFO)')
    bullet_regex = RegEx.new()
    bullet_regex.compile('EnemyBallet')

func _on_VisibilityNotifier2D_screen_exited():
    queue_free()

func _on_Ballet_body_entered(body):
    if body_regex.search(body.name) || body.name == 'Enemy':
        body.dead()
        queue_free()
    elif bullet_regex.search(body.name):
        dead()
