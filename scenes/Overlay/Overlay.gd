extends CanvasLayer

func _process(delta):
    $ScoreValueL.text = '%04d' % Status.score
