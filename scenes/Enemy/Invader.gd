extends Area2D

func _on_Enemy_body_entered(body):
    $AnimationPlayer.play('dead')
