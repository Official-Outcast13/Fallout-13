/mob/living/simple_animal/hostile/creature
	name = "Experiment"
	desc = "The result of humankind tampering with genetics it had no business with in the first place, god help you."
	icon_state = "otherthing"
	icon_living = "otherthing"
	icon_dead = "otherthing-dead"
	health = 400
	maxHealth = 400
	environment_smash = 0
	melee_damage_lower = 30
	melee_damage_upper = 60
	attacktext = "chomps"
	attack_sound = 'sound/weapons/bite.ogg'
	faction = list("creature")
	speak_emote = list("screams")
	gold_core_spawnable = 1
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
