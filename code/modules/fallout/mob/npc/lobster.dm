/mob/living/simple_animal/hostile/lobster
	name = "Lobstrosity"
	desc = "A very bizarre creature that resembles a mutated lobster somehow standing at six feet on it's tail, bearing two large and eerie eyes on stalks alongside pincers and serrated claws. It appears to be asking questions constantly, though you don't know if they have any meaning or are just noises."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "lobster"
	icon_living = "lobster"
	icon_dead = "lobster_d"
	icon_gib = "gib"
	turns_per_move = 5
	see_in_dark = 10
	speak_chance = 100
	speak = list("Dad-a-chum?","Dum-a-chum?","Ded-a-chek?","Did-a-chik?")
	emote_hear = list("hisses")
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab/spider = 2, /obj/item/weapon/reagent_containers/food/snacks/spiderleg = 10)
	response_help  = "touches"
	response_disarm = "hits"
	response_harm   = "kicks"
	maxHealth = 350
	health = 350
	self_weight = 120
	loot = list(/obj/item/stack/caps/random)

	faction = list("hostile", "scorpion")

	sound_speak_chance = 50
	sound_speak = list('sound/f13npc/scorpion_charge1.ogg','sound/f13npc/scorpion_charge2.ogg','sound/f13npc/scorpion_charge3.ogg')

	aggro_sound_chance = 50
	aggro_sound = 'sound/f13npc/scorpion_alert.ogg'

	death_sound = 'sound/f13npc/scorpion_death.ogg'

	melee_damage_lower = 25
	melee_damage_upper = 45
	environment_smash = 0
	move_to_delay = 7
	attacktext = "attacks"
	attack_sound = 'sound/weapons/bite.ogg'
	see_invisible = SEE_INVISIBLE_MINIMUM
	see_in_dark = 10
	aggro_vision_range = 8
	idle_vision_range = 7