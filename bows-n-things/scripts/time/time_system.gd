extends PanelContainer
class_name TimeSystem

@export var date_time: DateTime
@export var ticks_per_second: int = 10

@onready var day_label: Label = $HBoxContainer/DayLabel
@onready var hour_label: Label = $HBoxContainer/HBoxContainer/HourLabel
@onready var minute_label: Label = $HBoxContainer/HBoxContainer/MinuteLabel

func _ready() -> void:
	date_time.day_changed.connect(day_start)
	day_label.text = "Day: " + str(date_time.days)

func _process(delta: float) -> void:
	date_time.increase_seconds(delta * ticks_per_second)
	
	day_label.text = "Day: " + str(date_time.days)
	
	if date_time.hours < 10:
		hour_label.text = "0" + str(date_time.hours)
	else:
		hour_label.text = str(date_time.hours)
	
	if date_time.minutes < 10:
		minute_label.text = "0" + str(date_time.minutes)
	else:
		minute_label.text = str(date_time.minutes)

func day_start() -> void:
	pass
