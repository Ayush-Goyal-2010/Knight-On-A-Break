extends Node2D

const SPEED = 40.0
var direction = 1

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $Killzone/CollisionShape2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	position.x += direction * SPEED * delta

func _on_diezone_body_entered(_body: Node2D) -> void:
	print("IT DAYED")
	animation_player.play("killed")

func play_death_animation():
	direction = 0
	animated_sprite_2d.play("dead")
