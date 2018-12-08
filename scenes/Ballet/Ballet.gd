extends Area2D

export (int) var speed = 300

var owner_name
var regex

func _process(delta):
    position.y -= delta * speed

func _ready():
    regex = RegEx.new()
    regex.compile('Enemy')

func _on_VisibilityNotifier2D_screen_exited():
    queue_free()

func _on_Ballet_body_entered(body):
    var result = regex.search(body.name)
    if result:
        body.get_node('AnimationPlayer').play('dead')
        queue_free()
