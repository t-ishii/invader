extends Area2D

signal change_animation(type)

func _on_Enemy_change_animation(type):
    $AnimationPlayer.play(type)

func _on_Enemy_body_entered(body):
    pass # dead animation
