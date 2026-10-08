extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var fade_bg: ColorRect = $FadeBG
@onready var tablet_on: Sprite2D = $TabletTexture/TabletOn

@onready var tablet_nodes: Node2D = $TabletTexture/TabletNodes
@onready var need_to_copy: RichTextLabel = $TabletTexture/TabletNodes/NeedToCopy
@onready var copy_place: TextEdit = $TabletTexture/TabletNodes/CopyPlace

@onready var research_meter: ProgressBar = $TabletTexture/TabletNodes/ResearchMeter

var TextArray = [
  "The pressure increased steadily as the vehicle descended, but all instruments remained within their expected tolerances.",
  "The deeper sections of the trench contained fewer visible organisms, although the ones we encountered appeared unusually well adapted to their environment.",
  "We had to slow the descent when the readings began changing faster than expected.",
  "The equipment performed well during the initial descent, despite the increasing pressure surrounding the hull.",
  "Several specimens were collected at depths where previous surveys had recorded almost no biological activity.",
  "The further we traveled from the surface, the more carefully each measurement had to be checked.",
  "A minor error in the initial readings forced us to review several hours of observations.",
  "The descent took longer than anticipated, but rushing the process would have made the measurements unreliable.",
  "We found that conditions became considerably less forgiving below the first major depth boundary.",
  "The instruments showed signs of strain, so the team decided to reduce the rate of descent.",
  "The samples looked ordinary at first, but closer examination revealed several unexpected characteristics.",
  "Visibility decreased rapidly, leaving the instruments as our primary source of information.",
  "The survey continued despite several interruptions caused by unstable conditions.",
  "Some of the most useful observations came from areas that initially appeared completely empty.",
  "The research vessel remained on the surface while the submersible continued farther below.",
  "We recorded every change carefully because small differences became more significant at greater depths.",
  "The surrounding environment became increasingly difficult to observe without specialized equipment.",
  "A brief malfunction forced us to stop collecting samples until the instruments were recalibrated.",
  "The pressure outside the vehicle was considerably greater than anything experienced near the surface.",
  "The team agreed that another descent would be necessary before drawing any conclusions.",
  "Several readings contradicted our original expectations and required further investigation.",
  "The deeper we went, the more important it became to distinguish unusual results from simple measurement errors.",
  "The expedition had limited time remaining, so we prioritized the areas most likely to produce useful data.",
  "The conditions were difficult, but the equipment had been designed with these depths in mind.",
  "We recovered the samples carefully because even minor damage could compromise the results.",
  "The first survey revealed patterns that were not apparent from surface observations alone.",
  "The environment changed gradually enough that we almost failed to notice how far we had descended.",
  "We had to abandon one section of the survey after the conditions became too unstable.",
  "The readings improved once the instruments were given time to adjust to the surrounding conditions.",
  "The final measurements were taken slowly to ensure that fatigue did not affect the results.",
  "The specimen appeared unaffected by the extreme conditions surrounding it.",
  "We expected the deepest region to be lifeless, but the data suggested otherwise.",
  "The expedition became more complicated as additional variables began appearing in the results.",
  "No single measurement explained the pattern, so we compared the findings across several locations.",
  "The return journey required just as much attention as the descent.",
  "We reached the target depth later than planned and had only a short window for observations.",
  "The data became more difficult to interpret as the environmental conditions changed.",
  "A successful expedition depended less on speed than on knowing when to stop and reassess.",
  "The equipment could withstand the conditions, but only when operated within its intended limits.",
  "The survey team noted that unfamiliar conditions did not necessarily indicate a problem.",
  "Some results only became meaningful after they were compared with observations from shallower regions.",
  "The deeper environment was unforgiving of mistakes that would have been insignificant near the surface.",
  "We recorded the anomaly and continued the survey rather than assuming we already knew its cause.",
  "The final sample was retrieved just before conditions forced the submersible to begin its ascent.",
  "The journey back to the surface gave the team time to review what had been discovered below.",
  "Several unanswered questions remained after the expedition ended.",
  "The absence of familiar organisms did not mean that nothing was happening below.",
  "Every successful descent provided information that could make the next one safer and more precise.",
  "The pressure was constant, but our measurements only became useful when we remained patient.",
  "We surfaced with fewer answers than expected, but considerably more questions."
]

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Tablet"):
		create_tween().tween_property(fade_bg, "modulate:a", 0, 0.5).set_trans(Tween.TRANS_CUBIC)
		animation_player.play_backwards("Entrance_Exit")
		await animation_player.animation_finished
		self.queue_free()
		

func _ready() -> void:
	create_tween().tween_property(fade_bg, "modulate:a", 0.7, 0.5).set_trans(Tween.TRANS_CUBIC)
	animation_player.play("Entrance_Exit")
	research_meter.value = GlobalVars.research
	new_text()
	
	await animation_player.animation_finished
	await get_tree().create_timer(0.2).timeout
	
	create_tween().tween_property(tablet_on, "modulate:a", 1, 0.5).set_trans(Tween.TRANS_CUBIC)
	create_tween().tween_property(tablet_nodes, "modulate:a", 1, 0.5).set_trans(Tween.TRANS_CUBIC)
	

func new_text():
	var text_ind = randf_range(0, TextArray.size())
	
	need_to_copy.text = TextArray[text_ind]

func _on_copy_place_text_submitted() -> void:
	if copy_place.text == need_to_copy.text:
		new_text()
		copy_place.clear()
		GlobalVars.research += 0.1
		research_meter.value = GlobalVars.research
	else:
		animation_player.play("Shake")
