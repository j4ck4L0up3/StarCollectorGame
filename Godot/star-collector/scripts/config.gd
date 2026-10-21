class_name Config

# editable variables
const PLAYER_SPEED = 400 # speed of the rocket in pixels per second
const ITEM_SPEED = 400 # speed of asteroids and stars in pixels per second
const MAX_SPAWNED = 16
const SPAWN_TIME = 250 # how often an item is spawned in ms
const POINTS_PER_STAR = 1
const STARTING_LIVES = 3
const LIVES_LOST_PER_ASTEROID = 1

# do not change; would break game state
static var lives = STARTING_LIVES
static var started = false
static var score = 0
static var last_spawn = 0
