/mob/living/simple_animal/hostile/poison/vampire
	name = "Vampire"
	desc = "A creature that could only be described as being spawned from the bowels of hell itself, it has pale skin and piercing yellow eyes lacking pupils or emotion of any sort, apart from hunger. A distinct feature of it's face are the two jutting animal-like fangs that curve down past it's malformed lip."
	icon_state = "vampire"
	icon_living = "vampire"
	icon_dead = "vampire_d"
	turns_per_move = 4
	see_in_dark = 10
	response_help  = "caresses"
	response_disarm = "swiftly pushes away"
	response_harm   = "hits"
	maxHealth = 100
	health = 100
	melee_damage_lower = 15
	melee_damage_upper = 30
	move_to_delay = 5
	ventcrawler = VENTCRAWLER_ALWAYS
	attacktext = "bites"
	attack_sound = 'sound/weapons/bite.ogg'
	see_invisible = SEE_INVISIBLE_MINIMUM
	pass_flags = PASSTABLE
	faction = list("vampires")
	var/point_regen_delay = 10
	loot = list(/obj/item/stack/caps/random)

/mob/living/simple_animal/hostile/dracula
	name = "Dracula"
	desc = "Some said he was born from pure malice, others claimed him to be Satan himself. Prince Vlad Dracul, born 1428, was perhaps best known as a prominent member of The Order of the Dragon; leading many a crusade against the enemies of Christianity, particularly the Ottoman Empire. After vengeful Turks sent false news of Vlad's death to his wife Elisabeta, she committed suicide mere hours before his return. Devastated, the Prince returned to find her corpse surrounded by native holy men of the church, claiming her soul was damned to hell due to committing suicide. A then-enraged Vlad renounced God entirely, and lived on for centuries to terrorize humanity in a bitter bid for revenge concerning his bride's tragic death. Or so the legends speak. This suit of armor looks remarkably similar to one Vlad Dracul was often depicted wearing in ancient texts detailing his war ventures, and seems eerily occupied and perhaps even alive in it's hostilities."
	icon = 'icons/fallout/mobs/dracula.dmi'
	icon_state = "draculasword"
	icon_living = "draculasword"
	icon_dead = "draculadead"
	turns_per_move = 6
	see_in_dark = 15
	response_help  = "pokes"
	response_disarm = "shoves"
	response_harm   = "hits"
	maxHealth = 1000
	health = 1000
	melee_damage_lower = 40
	melee_damage_upper = 75
	move_to_delay =7
	attacktext = "slashes"
	attack_sound = 'sound/weapons/slice.ogg'
	see_invisible = SEE_INVISIBLE_MINIMUM
	environment_smash = 1
	faction = list("vampires")
	var/point_regen_delay = 5
	stat_attack = 1
	loot = list(/obj/item/weapon/dracsword, /obj/item/stack/caps/random)

/mob/living/simple_animal/hostile/poison/orlox1
	name = "Count Olrox"
	desc = "A shadowy creature looking very similar to most others of its' kind, except for a unique purple outfit with gold trim, and a rather tall, lanky stature. It moves with superhuman speed, and appears to have knowledge of dark magics."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "orlox"
	icon_living = "orlox"
	icon_dead = "orlox_d"
	turns_per_move = 4
	see_in_dark = 20
	response_help  = "pokes"
	response_disarm = "shoves"
	response_harm   = "hits"
	maxHealth = 500
	health = 500
	melee_damage_lower = 25
	melee_damage_upper = 40
	move_to_delay =5
	attacktext = "slashes"
	attack_sound = 'sound/weapons/bite.ogg'
	see_invisible = SEE_INVISIBLE_MINIMUM
	environment_smash = 1
	faction = list("vampires")
	var/point_regen_delay = 1
	stat_attack = 1
	pass_flags = PASSTABLE
	status_flags = CANPUSH
	idle_vision_range = 10
	aggro_vision_range = 15
	loot = list(/mob/living/simple_animal/hostile/orlox2, /obj/item/stack/caps/random)

	retreat_distance = 3
	minimum_distance = 3
	del_on_death = 1

	var/obj/effect/proc_holder/spell/fireball/fireball = null
	var/next_cast = 0

/mob/living/simple_animal/hostile/poison/orlox1/New()
	..()
	fireball = new /obj/effect/proc_holder/spell/fireball
	fireball.clothes_req = 0
	fireball.human_req = 0
	fireball.player_lock = 0
	AddSpell(fireball)

/mob/living/simple_animal/hostile/poison/orlox1/handle_automated_action()
	. = ..()
	if(target && next_cast < world.time)
		if((get_dir(src,target) in list(SOUTH,EAST,WEST,NORTH)) && fireball.cast_check(0,src)) //Lined up for fireball
			src.setDir(get_dir(src,target))
			fireball.perform(list(target), user = src)
			next_cast = world.time + 20 //One spell per second
			return .

/mob/living/simple_animal/hostile/orlox2
	name = "Beast Olrox"
	desc = "A gargantuan green hulk of a lizard. How that purple guy transformed into this, you have no idea."
	icon = 'icons/mob/lavaland/96x96megafauna.dmi'
	icon_state = "praisedestroyer2100"
	icon_living = "praisedestroyer2100"
	icon_gib = "gib"
	turns_per_move = 5
	see_in_dark = 20
	response_help  = "pokes"
	response_disarm = "shoves"
	response_harm   = "hits"
	maxHealth = 2500
	health = 2500
	melee_damage_lower = 30
	melee_damage_upper = 75
	move_to_delay = 6
	attacktext = "slashes"
	attack_sound = 'sound/weapons/punch4.ogg'
	see_invisible = SEE_INVISIBLE_MINIMUM
	environment_smash = 2
	faction = list("vampires")
	var/point_regen_delay = 3
	stat_attack = 1
	idle_vision_range = 10
	aggro_vision_range = 15
	armour_penetration = 30
	del_on_death = 1
	loot = list(/obj/item/weapon/crissaegrim, /obj/item/stack/caps/random)