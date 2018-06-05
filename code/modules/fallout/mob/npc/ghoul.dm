//Fallout 13 npc ghouls directory

/mob/living/simple_animal/hostile/ghoul
	name = "feral ghoul"
	desc = "Have you ever seen a living ghoul before?<br>Ghouls are necrotic post-humans - decrepit, rotting, zombie-like mutants."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "retro_ghoul"
	icon_living = "retro_ghoul"
	icon_dead = "retro_ghoul_d"
	icon_gib = "gib"
	speak_chance = 0
	turns_per_move = 5
	environment_smash = 0
	response_help = "hugs"
	response_disarm = "pushes aside"
	response_harm = "slaps"
	move_to_delay = 4
	maxHealth = 70
	health = 70
	self_weight = 45
	loot = list(/obj/item/stack/caps/random)

	faction = list("hostile", "ghoul")

	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/ghoul_charge1.ogg','sound/f13npc/ghoul_charge2.ogg','sound/f13npc/ghoul_charge3.ogg')

	aggro_sound_chance = 50
	aggro_sound = 'sound/f13npc/ghoul_alert.ogg'

	death_sound = 'sound/f13npc/ghoul_death.ogg'

	melee_damage_lower = 15
	melee_damage_upper = 20
	aggro_vision_range = 10
	idle_vision_range = 7
	attacktext = "scratches"
	attack_sound = "punch"

/mob/living/simple_animal/hostile/reghoulone
	name = "infected ghoul"
	desc = "What was once a living breathing survivor of the apocalypse, re-animated by causes unknown and cursed to walk the ruined earth yet again."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "reghoulone"
	icon_living = "reghoulone"
	icon_dead = "reghoulone_d"
	icon_gib = "gib"
	speak_chance = 0
	turns_per_move = 5
	environment_smash = 0
	response_help = "hugs"
	response_disarm = "pushes aside"
	response_harm = "slaps"
	move_to_delay = 4
	maxHealth = 120
	health = 120
	self_weight = 45
	loot = list(/obj/item/stack/caps/random)

	faction = list("hostile", "ghoul")

	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/ghoul_charge1.ogg','sound/f13npc/ghoul_charge2.ogg','sound/f13npc/ghoul_charge3.ogg')

	aggro_sound_chance = 50
	aggro_sound = 'sound/f13npc/ghoul_alert.ogg'

	death_sound = 'sound/f13npc/ghoul_death.ogg'

	melee_damage_lower = 30
	melee_damage_upper = 40
	aggro_vision_range = 10
	idle_vision_range = 7
	attacktext = "scratches"
	attack_sound = "punch"

/mob/living/simple_animal/hostile/reghoultwo
	name = "infected ghoul"
	desc = "What was once a living breathing survivor of the apocalypse, re-animated by causes unknown and cursed to walk the ruined earth yet again."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "reghoultwo"
	icon_living = "reghoultwo"
	icon_dead = "reghoultwo_d"
	icon_gib = "gib"
	speak_chance = 0
	turns_per_move = 5
	environment_smash = 0
	response_help = "hugs"
	response_disarm = "pushes aside"
	response_harm = "slaps"
	move_to_delay = 4
	maxHealth = 120
	health = 120
	self_weight = 45
	loot = list(/obj/item/stack/caps/random)

	faction = list("hostile", "ghoul")

	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/ghoul_charge1.ogg','sound/f13npc/ghoul_charge2.ogg','sound/f13npc/ghoul_charge3.ogg')

	aggro_sound_chance = 50
	aggro_sound = 'sound/f13npc/ghoul_alert.ogg'

	death_sound = 'sound/f13npc/ghoul_death.ogg'

	melee_damage_lower = 30
	melee_damage_upper = 40
	aggro_vision_range = 10
	idle_vision_range = 7
	attacktext = "scratches"
	attack_sound = "punch"

/mob/living/simple_animal/hostile/reghoulthree
	name = "infected ghoul"
	desc = "What was once a living breathing survivor of the apocalypse, re-animated by causes unknown and cursed to walk the ruined earth yet again."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "reghoulcop"
	icon_living = "reghoulcop"
	icon_dead = "reghoulcop_d"
	icon_gib = "gib"
	speak_chance = 0
	turns_per_move = 5
	environment_smash = 0
	response_help = "hugs"
	response_disarm = "pushes aside"
	response_harm = "slaps"
	move_to_delay = 4
	maxHealth = 150
	health = 150
	self_weight = 45
	loot = list(/obj/item/stack/caps/random)

	faction = list("hostile", "ghoul")

	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/ghoul_charge1.ogg','sound/f13npc/ghoul_charge2.ogg','sound/f13npc/ghoul_charge3.ogg')

	aggro_sound_chance = 50
	aggro_sound = 'sound/f13npc/ghoul_alert.ogg'

	death_sound = 'sound/f13npc/ghoul_death.ogg'

	melee_damage_lower = 30
	melee_damage_upper = 40
	aggro_vision_range = 10
	idle_vision_range = 7
	attacktext = "scratches"
	attack_sound = "punch"
	loot = list(/obj/item/ammo_box/magazine/vp70, /obj/item/weapon/gun/ballistic/automatic/pistol/vp70)

/mob/living/simple_animal/hostile/tyrant
	name = "Tyrant X"
	desc = "A genetic experiment gone horribly wrong, thought to have derived from scientists attempting to perfect the F.E.V, this hulking monstrosity seems to be twice as aggressive as the average supermutant and thrice malformed. Perhaps it was once a scientist itself?"
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "tyrant"
	icon_living = "tyrant"
	icon_dead = "tyrant_d"
	turns_per_move = 6
	see_in_dark = 15
	response_help  = "prods"
	response_disarm = "shoves"
	response_harm   = "mauls"
	maxHealth = 4000
	health = 4000
	melee_damage_lower = 60
	melee_damage_upper = 95
	move_to_delay =7
	attacktext = "mauls"
	attack_sound = 'sound/weapons/slice.ogg'
	aggro_sound = 'sound/f13npc/tyrant.ogg'
	death_sound = 'sound/f13npc/tyrantdeath.ogg'
	see_invisible = SEE_INVISIBLE_MINIMUM
	environment_smash = 1
	faction = list("hostile", "ghoul")
	var/point_regen_delay = 5
	stat_attack = 1
	loot = list(/obj/item/weapon/reagent_containers/spray/chemsprayer, /obj/item/weapon/storage/belt/luckyholster/full)

/mob/living/simple_animal/hostile/johntyrant
	name = "Tyrant J"
	desc = "A genetic experiment gone horribly wrong, thought to have derived from scientists attempting to perfect the F.E.V, this hulking monstrosity seems to be twice as aggressive as the average supermutant and thrice malformed. Perhaps it was once an equally violent human being itself?"
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "johntyrant"
	icon_living = "johntyrant"
	icon_dead = "johntyrant_d"
	turns_per_move = 6
	see_in_dark = 15
	response_help  = "prods"
	response_disarm = "shoves"
	response_harm   = "mauls"
	maxHealth = 5000
	health = 5000
	melee_damage_lower = 70
	melee_damage_upper = 105
	move_to_delay =7
	attacktext = "mauls"
	attack_sound = 'sound/weapons/slice.ogg'
	aggro_sound = 'sound/f13npc/tyrant.ogg'
	death_sound = 'sound/f13npc/tyrantdeath.ogg'
	see_invisible = SEE_INVISIBLE_MINIMUM
	environment_smash = 1
	faction = list("hostile", "ghoul")
	var/point_regen_delay = 5
	stat_attack = 1
	loot = list(/obj/item/clothing/head/helmet/f13/johnhelmet, /obj/item/stack/caps/random)

/mob/living/simple_animal/hostile/ghoul/aggressive
	name = "feral ghoul"
	desc = "Have you ever seen a hungry ghoul before?<br>Similar to other feral ghouls, it's more aggressive and confident about the fact that you are the best food around.<br>It is missing a left arm."
	icon_state = "angry_ghoul"
	icon_living = "angry_ghoul"
	icon_dead = "angry_ghoul_d"
	icon_gib = "gib"
	maxHealth = 80
	health = 80
	melee_damage_lower = 20
	melee_damage_upper = 28
	aggro_vision_range = 15
	idle_vision_range = 10
	attacktext = "chomps"
	loot = list(/obj/item/stack/caps/random)

/mob/living/simple_animal/hostile/ghoul/glowing
	name = "glowing feral ghoul"
	desc = "Have you ever seen a glowing ghoul before?<br>Glowing ghouls are necrotic post-humans - rotting, zombie-like mutants, who are so irradiated they actually glow in the dark."
	icon_state = "retro_glowghoul"
	icon_living = "retro_glowghoul"
	icon_dead = "retro_glowghoul_d"
	icon_gib = "gib"
	maxHealth = 100
	health = 100
	melee_damage_lower = 15
	melee_damage_upper = 25
	loot = list(/obj/item/stack/caps/random)
	light_color = LIGHT_COLOR_GREEN
	light_power = 1
	light_range = 2

/mob/living/simple_animal/hostile/ghoul/glowing/New()
	..()
	SSradiation.processing += src