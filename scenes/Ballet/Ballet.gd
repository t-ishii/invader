extends Area2D

var owner_name
var regex

func _process(delta):
    position.y -= delta * 100

func _ready():
    regex = RegEx.new()
    regex.compile('Enemy')
    
func _on_VisibilityNotifier2D_screen_exited():
    queue_free()

func set_owner_name(name):
    owner_name = name

func get_owner_name():
    return owner_name

func _on_Ballet_body_entered(body):
    var result = regex.search(body.name)
    if result:
        body.get_node('AnimationPlayer').play('dead')
        queue_free()
