extends Node2D

const SPEED = 60
var direction = -1
var distance_to_player : int
var detects_player : bool = false
var player : CharacterBody2D
var fall : bool = false

@onready var ray_cast_left: RayCast2D = $HitBox/RayCastLeft
@onready var ray_cast_right: RayCast2D = $HitBox/RayCastRight
@onready var ani_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if fall == true:
		position.y += delta * SPEED * 2
		if position.y > 6:
			$".".queue_free()
		return
		
	if ray_cast_left.is_colliding():
		direction = 1
		ani_sprite.flip_h = true
	if ray_cast_right.is_colliding():
		direction = -1
		ani_sprite.flip_h = false
		
	position.x += direction * SPEED * delta
	
	if detects_player == true:
		distance_to_player = player.position.x - position.x
		if distance_to_player < 0:
			if direction > 0:
				direction = -1
				ani_sprite.flip_h = false
		else:
			if direction < 0:
				direction = 1
				ani_sprite.flip_h = true

func _on_hit_box_body_entered(body: Node2D) -> void:
	if body.name == "player":
		$Killzone/CollisionShape2D.queue_free()
		timer.start()
		fall = true

func _on_detect_player_body_entered(body: Node2D) -> void:
	if body.name == "player":
		player = body
		detects_player = true


func _on_detect_player_body_exited(body: Node2D) -> void:
	if body.name == "player":
		detects_player = false
		
