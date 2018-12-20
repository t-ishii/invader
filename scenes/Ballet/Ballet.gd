extends RigidBody2D

export (int) var speed = 400

var regex

# ToDo ballet -> bullet

func dead():
    print('collision with enemy bullet')

func _ready():
    linear_velocity = Vector2(0, -speed)
    regex = RegEx.new()
    regex.compile('(Enemy|UFO)')

func _on_VisibilityNotifier2D_screen_exited():
    queue_free()

func _on_Ballet_body_entered(body):
    var result = regex.search(body.name)
    if result:
        body.dead()
        queue_free()
