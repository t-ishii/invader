extends 'BulletMain.gd'

export (int) var speed = 150

# ToDo ballet -> bullet

func _ready():
    linear_velocity = Vector2(0, speed)

func _on_VisibilityNotifier2D_screen_exited():
    queue_free()

func _on_EnemyBallet_body_entered(body):
    if body.name == 'Player':
        body.hit()
        queue_free()
    elif body.name == 'Ballet':
        dead()
