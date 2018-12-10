extends KinematicBody2D

export (int) var speed = 100

var is_dead = false

func dead():
    is_dead = true
    $AnimationPlayer.play('dead')

func _physics_process(delta):
    if !is_dead:
        move_and_slide(Vector2(speed, 0))

func _on_VisibilityNotifier2D_screen_exited():
    queue_free()

func _ready():
    position = Vector2(0, 50)
