extends Resource
class_name DateTime

signal day_changed

@export_range(0,59) var seconds: int
@export_range(0,59) var minutes: int 
@export_range(0,23) var hours: int
@export var days: int

var delta_time: float

func increase_seconds(delta_seconds: float) -> void:
	delta_time += delta_seconds
	if delta_time < 1:
		return
	
	var delta_int_seconds: int = delta_time
	delta_time -= delta_int_seconds
	
	seconds += delta_int_seconds
	minutes += seconds/60
	hours += minutes/60
	days += hours/24
	
	seconds = seconds % 60
	minutes = minutes % 60
	hours = hours % 24
	
	if hours >= 24:
		day_changed.emit()
