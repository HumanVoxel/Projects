extends Area2D

# Reference to the TileMap node
@onready var tileMap = get_tree().get_first_node_in_group("environment")

func _ready():
	pass
	
	
func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body == tileMap:
		print("touchedtile")
		var current_tilemap = body
		var collided_cell_coords = current_tilemap.get_coords_for_body_rid(body_rid)
		var tile_data = current_tilemap.get_cell_tile_data(3, collided_cell_coords)
		if !tile_data is TileData:
			return
		get_parent().player_damaged(tile_data.get_custom_data_by_layer_id(0))
		set_deferred("monitoring", false)
		await get_tree().create_timer(1).timeout
		set_deferred("monitoring", true)
	pass # Replace with function body.
