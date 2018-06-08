/obj/item/clothing/head/helmet
	name = "helmet"
	desc = "Standard Security gear. Protects the head from impacts."
	icon_state = "helmet"
	flags = HEADBANGPROTECT
	item_state = "helmet"
	armor = list(melee = 35, bullet = 30, laser = 30,energy = 10, bomb = 25, bio = 0, rad = 0, fire = 50, acid = 50)
	flags_inv = HIDEEARS
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_TEMP_PROTECT
	strip_delay = 60
	resistance_flags = 0
	flags_cover = HEADCOVERSEYES

	dog_fashion = /datum/dog_fashion/head/helmet


/obj/item/clothing/head/helmet/New()
	..()

/obj/item/clothing/head/helmet/sec
	can_flashlight = 1

/obj/item/clothing/head/helmet/alt
	name = "bulletproof helmet"
	desc = "A bulletproof combat helmet that excels in protecting the wearer against traditional projectile weaponry and explosives to a minor extent."
	icon_state = "helmetalt"
	item_state = "helmetalt"
	armor = list(melee = 15, bullet = 40, laser = 10, energy = 10, bomb = 40, bio = 0, rad = 0, fire = 50, acid = 50)
	can_flashlight = 1
	dog_fashion = null

/obj/item/clothing/head/helmet/blueshirt
	icon_state = "blueshift"
	item_state = "blueshift"

/obj/item/clothing/head/helmet/casinohelmet
	name = "Casino security helmet"
	desc = "A rather dated and now defunct pre-war Casino security guard's helmet, bearing mild ballistic protection suitable for defense against some melee weapons and basic handgun calibers."
	icon_state = "casinohelmet"
	item_state = "casinohelmet"
	flags = HEADBANGPROTECT
	armor = list(melee = 50, bullet = 35, laser = 25,energy = 25, bomb = 15, bio = 2, rad = 0, fire = 50, acid = 50)
	flags_inv = HIDEEARS|HIDEFACE
	strip_delay = 80
	actions_types = list(/datum/action/item_action/toggle)
	visor_flags_inv = HIDEFACE
	toggle_cooldown = 0
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	visor_flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	dog_fashion = null

/obj/item/clothing/head/helmet/riot
	name = "riot helmet"
	desc = "It's a helmet specifically designed to protect against close range attacks."
	icon_state = "riot"
	item_state = "helmet"
	toggle_message = "You pull the visor down on"
	alt_toggle_message = "You push the visor up on"
	can_toggle = 1
	flags = HEADBANGPROTECT
	armor = list(melee = 50, bullet = 15, laser = 5,energy = 5, bomb = 5, bio = 2, rad = 0, fire = 50, acid = 50)
	flags_inv = HIDEEARS|HIDEFACE
	strip_delay = 80
	actions_types = list(/datum/action/item_action/toggle)
	visor_flags_inv = HIDEFACE
	toggle_cooldown = 0
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	visor_flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	dog_fashion = null


/obj/item/clothing/head/helmet/attack_self(mob/user)
	if(can_toggle && !user.incapacitated())
		if(world.time > cooldown + toggle_cooldown)
			cooldown = world.time
			up = !up
			flags ^= visor_flags
			flags_inv ^= visor_flags_inv
			flags_cover ^= visor_flags_cover
			icon_state = "[initial(icon_state)][up ? "up" : ""]"
			to_chat(user, "[up ? alt_toggle_message : toggle_message] \the [src]")

			user.update_inv_head()
			if(iscarbon(user))
				var/mob/living/carbon/C = user
				C.head_update(src, forced = 1)

			if(active_sound)
				while(up)
					playsound(src.loc, "[active_sound]", 100, 0, 4)
					sleep(15)

/obj/item/clothing/head/helmet/justice
	name = "helmet of justice"
	desc = "WEEEEOOO. WEEEEEOOO. WEEEEOOOO."
	icon_state = "justice"
	toggle_message = "You turn off the lights on"
	alt_toggle_message = "You turn on the lights on"
	actions_types = list(/datum/action/item_action/toggle_helmet_light)
	can_toggle = 1
	toggle_cooldown = 20
	active_sound = 'sound/items/WEEOO1.ogg'
	dog_fashion = null

/obj/item/clothing/head/helmet/justice/escape
	name = "alarm helmet"
	desc = "WEEEEOOO. WEEEEEOOO. STOP THAT MONKEY. WEEEOOOO."
	icon_state = "justice2"
	toggle_message = "You turn off the light on"
	alt_toggle_message = "You turn on the light on"

/obj/item/clothing/head/helmet/swat
	name = "\improper SWAT helmet"
	desc = "An extremely robust, space-worthy helmet in a nefarious red and black stripe pattern."
	icon_state = "swatsyndie"
	item_state = "swatsyndie"
	armor = list(melee = 40, bullet = 30, laser = 30,energy = 30, bomb = 50, bio = 90, rad = 20, fire = 50, acid = 50)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	flags = STOPSPRESSUREDMAGE
	strip_delay = 80
	dog_fashion = null

/obj/item/clothing/head/helmet/swat/nanotrasen
	name = "\improper SWAT helmet"
	desc = "An extremely robust, space-worthy helmet with the Nanotrasen logo emblazoned on the top."
	icon_state = "swat"
	item_state = "swat"

/obj/item/clothing/head/helmet/thunderdome
	name = "\improper Thunderdome helmet"
	desc = "<i>'Let the battle commence!'</i>"
	flags_inv = HIDEEARS|HIDEHAIR
	icon_state = "thunderdome"
	item_state = "thunderdome"
	armor = list(melee = 40, bullet = 30, laser = 25,energy = 10, bomb = 25, bio = 10, rad = 0, fire = 50, acid = 50)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	strip_delay = 80
	dog_fashion = null

/obj/item/clothing/head/helmet/bearpelt
	name = "Yao guai pelt mantle"
	desc = "A large helmet-like mantle crafted from skinning a very monstrous and mutated species of bear native to parts unknown in the wasteland, retaining the animal's eyes for a very morbid appearance."
	flags_inv = HIDEEARS|HIDEHAIR
	icon_state = "falloutbearpelt"
	item_state = "falloutbearpelt"
	armor = list(melee = 20, bullet = 10, laser = 5,energy = 5, bomb = 5, bio = 10, rad = 0, fire = 10, acid = 10)

/obj/item/clothing/head/helmet/roman
	name = "roman helmet"
	desc = "An ancient helmet made of bronze and leather."
	flags_inv = HIDEEARS|HIDEHAIR
	flags_cover = HEADCOVERSEYES
	armor = list(melee = 25, bullet = 0, laser = 25, energy = 10, bomb = 10, bio = 0, rad = 0, fire = 100, acid = 50)
	resistance_flags = FIRE_PROOF
	icon_state = "roman"
	item_state = "roman"
	strip_delay = 100
	dog_fashion = null

/obj/item/clothing/head/helmet/roman/legionaire
	name = "roman legionaire helmet"
	desc = "An ancient helmet made of bronze and leather. Has a red crest on top of it."
	icon_state = "roman_c"
	item_state = "roman_c"

/obj/item/clothing/head/helmet/gladiator
	name = "gladiator helmet"
	desc = "Ave, Imperator, morituri te salutant."
	icon_state = "gladiator"
	item_state = "gladiator"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR
	flags_cover = HEADCOVERSEYES
	dog_fashion = null

/obj/item/clothing/head/helmet/redtaghelm
	name = "red laser tag helmet"
	desc = "They have chosen their own end."
	icon_state = "redtaghelm"
	flags_cover = HEADCOVERSEYES
	item_state = "redtaghelm"
	armor = list(melee = 15, bullet = 10, laser = 20,energy = 10, bomb = 20, bio = 0, rad = 0, fire = 0, acid = 50)
	// Offer about the same protection as a hardhat.
	dog_fashion = null

/obj/item/clothing/head/helmet/bluetaghelm
	name = "blue laser tag helmet"
	desc = "They'll need more men."
	icon_state = "bluetaghelm"
	flags_cover = HEADCOVERSEYES
	item_state = "bluetaghelm"
	armor = list(melee = 15, bullet = 10, laser = 20,energy = 10, bomb = 20, bio = 0, rad = 0, fire = 0, acid = 50)
	// Offer about the same protection as a hardhat.
	dog_fashion = null

/obj/item/clothing/head/helmet/skull
	name = "skull helmet"
	desc = "An intimidating tribal helmet, it doesn't look very comfortable."
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	flags_cover = HEADCOVERSEYES
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 10, bomb = 10, bio = 5, rad = 20, fire = 40, acid = 20)
	icon_state = "skull"
	item_state = "skull"
	strip_delay = 100


//LightToggle

/obj/item/clothing/head/helmet/update_icon()

	var/state = "[initial(icon_state)]"
	if(F)
		if(F.on)
			state += "-flight-on" //"helmet-flight-on" // "helmet-cam-flight-on"
		else
			state += "-flight" //etc.

	icon_state = state

	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		H.update_inv_head()

	return

/obj/item/clothing/head/helmet/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/toggle_helmet_flashlight))
		toggle_helmlight()
	else
		..()

/obj/item/clothing/head/helmet/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/device/flashlight/seclite))
		var/obj/item/device/flashlight/seclite/S = I
		if(can_flashlight)
			if(!F)
				if(!user.unEquip(S))
					return
				to_chat(user, "<span class='notice'>You click [S] into place on [src].</span>")
				if(S.on)
					set_light(0)
				F = S
				update_icon()
				update_helmlight(user)
				verbs += /obj/item/clothing/head/helmet/proc/toggle_helmlight
				var/datum/action/A = new /datum/action/item_action/toggle_helmet_flashlight(src)
				if(loc == user)
					A.Grant(user)
		return

	if(istype(I, /obj/item/weapon/screwdriver))
		if(F)
			for(var/obj/item/device/flashlight/seclite/S in src)
				to_chat(user, "<span class='notice'>You unscrew the seclite from [src].</span>")
				F = null
				S.forceMove(get_turf(user))
				update_helmlight(user)
				S.update_brightness(user)
				update_icon()
				usr.update_inv_head()
				verbs -= /obj/item/clothing/head/helmet/proc/toggle_helmlight
			for(var/datum/action/item_action/toggle_helmet_flashlight/THL in actions)
				qdel(THL)
			return

	..()

/obj/item/clothing/head/helmet/proc/toggle_helmlight()
	set name = "Toggle Helmetlight"
	set category = "Object"
	set desc = "Click to toggle your helmet's attached flashlight."

	if(!F)
		return

	var/mob/user = usr
	if(user.incapacitated())
		return
	F.on = !F.on
	to_chat(user, "<span class='notice'>You toggle the helmetlight [F.on ? "on":"off"].</span>")

	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_helmlight(user)
	return

/obj/item/clothing/head/helmet/proc/update_helmlight(mob/user = null)
	if(F)
		if(F.on)
			set_light(F.brightness_on)
		else
			set_light(0)
		update_icon()

	else
		set_light(0)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()



/obj/item/clothing/head/bio_hood
	name = "bio hood"
	icon_state = "bio"
	desc = "A hood that protects the head and face from biological comtaminants."
	permeability_coefficient = 0.01
	flags = THICKMATERIAL
	armor = list(melee = 10, bullet = 10, laser = 10,energy = 10, bomb = 10, bio = 100, rad = 20, fire = 30, acid = 100)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR|HIDEFACE
	resistance_flags = ACID_PROOF
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	origin_tech = "magnets=3;biotech=2"


/obj/item/clothing/head/bio_hood/science
	name = "All-Purpose Science Hood"
	desc = "The hood of the All-Purpose Science Suit. An onboard computer system allows for easier programming and calculating advanced formulas"
	icon_state = "sciencehood"
	item_state = "sciencehood"
	origin_tech = "magnets=2;engineering=1"
	scan_reagents = 1
	actions_types = list(/datum/action/item_action/toggle_research_scanner)


/obj/item/clothing/head/helmet/stealth/stealthhelmet
	desc = "A mask and visor meant to be worn with the Chinese Stealth Suit"
	name = "Stealth Helmet"
	icon_state = "stealthhelmet"
	item_state = "stealthhelmet"
	armor = list(melee = 60, bullet = 50, laser = 30,energy = 15, bomb = 30, bio = 30, rad = 25, fire = 100, acid = 100)
	strip_delay = 12
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	blockTracking = 1//Roughly the only unique thing about this helmet.
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/head/helmet/ranger
	name = "ranger helmet"
	desc = "An old military helmet with a built-in night vision device, commonly worn by Veteran Rangers."
	icon_state = "vet_rangerhelmet"
	item_state = "vet_rangerhelmet"
	armor = list(melee = 40, bullet = 40, laser = 30, energy = 30, bomb = 30, bio = 0, rad = 40, fire = 40, acid = 30)
	flags = HEADCOVERSEYES | HEADCOVERSMOUTH
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	put_on_delay = 10
	strip_delay = 50
	resistance_flags = FIRE_PROOF
	self_weight = 1
	darkness_view = 8
	invis_view = SEE_INVISIBLE_MINIMUM
	glass_colour_type = /datum/client_colour/glass_colour/lightorange
	actions_types = list(/datum/action/item_action/toggle)
	visor_vars_to_toggle = VISOR_DARKNESSVIEW | VISOR_INVISVIEW
	can_toggle = 1
	var/enabled = 1

/obj/item/clothing/head/helmet/ranger/New()
	..()
	visor_toggling()

/obj/item/clothing/head/helmet/ranger/attack_self(mob/user)
	to_chat(user, "<span class='notice'>You [up ? "enabled" : "disabled"] [src].</span>")
	visor_toggling()
	user << sound('sound/misc/compiler-stage2.ogg',0,0,0,50)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		C.head_update(src, forced = 1)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/clothing/head/helmet/ranger/old
	name = "old ranger helmet"
	desc = "An old military helmet, commonly worn by Desert Rangers, that went through the fire and the flames, saving a single life amongst heavy bloodshed.<br>This particular helmet has a \"Forgive me mama\" inscription on the side."
	icon_state = "old_rangerhelmet"
	item_state = "old_rangerhelmet"
	armor = list(melee = 40, bullet = 40, laser = 20, energy = 20, bomb = 20, bio = 0, rad = 40, fire = 30, acid = 10)
	self_weight = 1
	glass_colour_type = /datum/client_colour/glass_colour/lightgreen

obj/item/clothing/head/helmet/ranger/eliteriot
	name = "Elte Riot Helmet"
	desc = "An old military helmet worn by the Las Vegas Police Department Riot division, this one has an advanced gas filtration system built into the helmet."
	icon_state = "elite_riothelmet"
	item_state = "elite_riothelmet"
	flags = BLOCK_GAS_SMOKE_EFFECT | HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list(melee = 40, bullet = 50, laser = 20, energy = 20, bomb = 20, bio = 0, rad = 40, fire = 30, acid = 10)
	self_weight = 1

/obj/item/clothing/head/bio_hood/advsciencehood
	name = "Advanced Science Hood"
	desc = "The environmentally sealed hood to the Advanced Science Suit, featuring an onboard computer that can compute complex mathematical equations as well as a thermal imaging device."
	icon_state = "advhood"
	item_state = "advhood"
	armor = list(melee = 40, bullet = 50, laser = 40, energy = 40, bomb = 20, bio = 50, rad = 80, fire = 30, acid = 100)
	origin_tech = "magnets=3;engineering=1"
	scan_reagents = 1
	vision_flags = SEE_MOBS
	invis_view = 2
	flash_protect = 0
	glass_colour_type = /datum/client_colour/glass_colour/lightblue
	actions_types = list(/datum/action/item_action/toggle_research_scanner)