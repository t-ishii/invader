extends Area2D

export (int) var speed = 400

var regex

func _process(delta):
    position.y -= delta * speed

func _ready():
    regex = RegEx.new()
    regex.compile('(Enemy|UFO)')

func _on_VisibilityNotifier2D_screen_exited():
    queue_free()

func _on_Ballet_body_entered(body):
    var result = regex.search(body.name)
    if result:
        body.dead()
        queue_free()
