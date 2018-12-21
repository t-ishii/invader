extends RigidBody2D


func dead():
    $Sprite.texture = preload('res://assets/unit_explosion.png')
    $Sprite.scale = Vector2(0.3, 0.3)
    $CollisionShape2D.disabled = true
    linear_velocity = Vector2(0, 0)
    yield(get_tree().create_timer(0.1), 'timeout')
    queue_free()
