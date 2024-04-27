extends Area2D


func _on_body_entered(body):
	GameManager.score = GameManager.score + 1
	self.queue_free()
