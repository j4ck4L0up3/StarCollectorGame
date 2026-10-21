extends Area2D

# reference for sprite node
@onready var sprite: Sprite2D = $Sprite2D

# rocket position
var screen_size: Vector2
var center_x: float

var rocket_size: Vector2
var rocket_y: float
var rocket_x: float

var direction: float # represents the rocket's movement direction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  screen_size = get_viewport_rect().size
  center_x = screen_size.x / 2
  rocket_size = sprite.texture.get_size() * sprite.scale
  rocket_y = screen_size.y - rocket_size.y / 2
  rocket_x = center_x - rocket_size.x / 2

  # set the rocket position
  position = Vector2(rocket_x, rocket_y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  # get movement inputs
  # move_left is a negative action ex. -1
  # move_right is a positive action ex. 1
  # when not moving the direction is 0
  direction = Input.get_axis("move_left", "move_right")
  
  # update the x axis position
  position.x += direction * Config.PLAYER_SPEED * delta

  # keep the rocket on screen
  # accounts for half the width of rocket b/c half of the rocket goes off screen otherwise
  position.x = clamp(position.x, rocket_size.x / 2.0, screen_size.x - rocket_size.x / 2.0)
