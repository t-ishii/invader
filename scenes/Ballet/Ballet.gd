extends StaticBody2D

var owner_name

func _process(delta):
    position.y -= delta * 100

func _ready():
    pass

func _on_VisibilityNotifier2D_screen_exited():
    queue_free()

func set_owner_name(name):
    owner_name = name

func get_owner_name():
    return owner_name