extends CharacterBody2D

signal health_over

var health = 100.0

func _physics_process(delta):
	var direction  = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * 600
	move_and_slide()
	if velocity.length() > 0.0:
		$HappyBoo.play_walk_animation()
	else:
		$HappyBoo.play_idle_animation()
	const DAMAGE_RATE = 5.0
	var overlapping_enemy  = %hurtbox.get_overlapping_bodies()
	if overlapping_enemy.size() > 0:
		health -= DAMAGE_RATE*overlapping_enemy.size() * delta
		%ProgressBar.value = health
		if health <= 0:
			health_over.emit()

