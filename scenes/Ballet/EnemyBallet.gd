extends Area2D

export (int) var speed = 150

func _process(delta):
    position.y += delta * speed

func _ready():
    pass

func _on_VisibilityNotifier2D_screen_exited():
    queue_free()

func _on_EnemyBallet_body_entered(body):
    if body.name == 'Player':
        print('Player dead.')
        queue_free()
#        body.dead()
