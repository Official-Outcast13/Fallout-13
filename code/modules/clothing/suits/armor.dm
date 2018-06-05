/obj/item/clothing/suit/armor
	allowed = list(/obj/item/weapon/gun/energy,/obj/item/weapon/reagent_containers/spray/pepper,/obj/item/weapon/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/restraints/handcuffs,/obj/item/device/flashlight/seclite,/obj/item/weapon/melee/classic_baton/telescopic,/obj/item/weapon/kitchen/knife/combat,/obj/item/weapon/tank/internals/emergency_oxygen)
	body_parts_covered = CHEST
	cold_protection = CHEST|GROIN
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	heat_protection = CHEST|GROIN
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	strip_delay = 60
	put_on_delay = 40
	obj_integrity = 250
	max_integrity = 250
	resistance_flags = 0
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 10, bomb = 25, bio = 0, rad = 0, fire = 50, acid = 50)

/obj/item/clothing/suit/armor/vest
	name = "armor"
	desc = "A slim armored vest that protects against most types of damage."
	icon_state = "armoralt"
	item_state = "armoralt"
	blood_overlay_type = "armor"
	dog_fashion = /datum/dog_fashion/back

/obj/item/clothing/suit/armor/vest/alt
	desc = "An armored vest that protects against most types of damage."
	icon_state = "armor"
	item_state = "armor"

/obj/item/clothing/suit/armor/vest/blueshirt
	icon_state = "blueshift"
	item_state = "blueshift"

/obj/item/clothing/suit/armor/hos
	name = "armored greatcoat"
	desc = "A greatcoat enchanced with a special alloy for some protection and style for those with a commanding presence."
	icon_state = "hos"
	item_state = "greatcoat"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 10, bomb = 25, bio = 0, rad = 0, fire = 70, acid = 90)
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	strip_delay = 80

/obj/item/clothing/suit/armor/hos/trenchcoat
	name = "armored trenchoat"
	desc = "A trenchcoat enchanced with a special lightweight kevlar. The epitome of tactical plainclothes."
	icon_state = "hostrench"
	item_state = "hostrench"
	flags_inv = 0
	strip_delay = 80

/obj/item/clothing/suit/armor/vest/warden
	name = "warden's jacket"
	desc = "A navy-blue armored jacket with blue shoulder designations and '/Warden/' stitched into one of the chest pockets."
	icon_state = "warden_alt"
	item_state = "armor"
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS|HANDS
	heat_protection = CHEST|GROIN|ARMS|HANDS
	strip_delay = 70
	resistance_flags = FLAMMABLE
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/warden/alt
	name = "warden's armored jacket"
	desc = "A red jacket with silver rank pips and body armor strapped on top."
	icon_state = "warden_jacket"

/obj/item/clothing/suit/armor/vest/leather
	name = "security overcoat"
	desc = "Lightly armored leather overcoat meant as casual wear for high-ranking officers. Bears the crest of Nanotrasen Security."
	icon_state = "leathercoat-sec"
	item_state = "hostrench"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/capcarapace
	name = "captain's carapace"
	desc = "An armored vest reinforced with ceramic plates and pauldrons to provide additional protection whilst still offering maximum mobility and flexibility. Issued only to the station's finest, although it does chafe your nipples."
	icon_state = "capcarapace"
	item_state = "armor"
	body_parts_covered = CHEST|GROIN
	armor = list(melee = 50, bullet = 40, laser = 50, energy = 10, bomb = 25, bio = 0, rad = 0, fire = 100, acid = 90)
	dog_fashion = null
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/armor/vest/capcarapace/alt
	name = "captain's parade jacket"
	desc = "For when an armoured vest isn't fashionable enough."
	icon_state = "capformal"
	item_state = "capspacesuit"

/obj/item/clothing/suit/armor/riot
	name = "riot suit"
	desc = "A suit of armor with heavy padding to protect against melee attacks."
	icon_state = "riot"
	item_state = "swat_suit"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor = list(melee = 70, bullet = 10, laser = 10, energy = 10, bomb = 0, bio = 0, rad = 0, fire = 80, acid = 80)
	strip_delay = 80
	put_on_delay = 60

/obj/item/clothing/suit/armor/bone
	name = "bone armor"
	desc = "A tribal armor plate, crafted from animal bone."
	icon_state = "bonearmor"
	item_state = "bonearmor"
	blood_overlay_type = "armor"
	armor = list(melee = 35, bullet = 25, laser = 25, energy = 10, bomb = 25, bio = 0, rad = 0, fire = 50, acid = 50)
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS

/obj/item/clothing/suit/armor/bulletproof
	name = "bulletproof armor"
	desc = "A bulletproof vest that excels in protecting the wearer against traditional projectile weaponry and explosives to a minor extent."
	icon_state = "bulletproof"
	item_state = "armor"
	blood_overlay_type = "armor"
	armor = list(melee = 15, bullet = 80, laser = 10, energy = 10, bomb = 40, bio = 0, rad = 0, fire = 50, acid = 50)
	strip_delay = 70
	put_on_delay = 50

/obj/item/clothing/suit/armor/laserproof
	name = "reflector vest"
	desc = "A vest that excels in protecting the wearer against energy projectiles, as well as occasionally reflecting them."
	icon_state = "armor_reflec"
	item_state = "armor_reflec"
	blood_overlay_type = "armor"
	armor = list(melee = 10, bullet = 10, laser = 60, energy = 50, bomb = 0, bio = 0, rad = 0, fire = 100, acid = 100)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	var/hit_reflect_chance = 40

/obj/item/clothing/suit/armor/laserproof/IsReflect(def_zone)
	if(!(def_zone in list("chest", "groin"))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return 0
	if (prob(hit_reflect_chance))
		return 1

/obj/item/clothing/suit/armor/vest/det_suit
	name = "armor"
	desc = "An armored vest with a detective's badge on it."
	icon_state = "detective-armor"
	allowed = list(/obj/item/weapon/tank/internals/emergency_oxygen,/obj/item/weapon/reagent_containers/spray/pepper,/obj/item/device/flashlight,/obj/item/weapon/gun/energy,/obj/item/weapon/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/restraints/handcuffs,/obj/item/weapon/storage/fancy/cigarettes,/obj/item/weapon/lighter,/obj/item/device/detective_scanner,/obj/item/device/taperecorder,/obj/item/weapon/melee/classic_baton)
	resistance_flags = FLAMMABLE
	dog_fashion = null


//Reactive armor
/obj/item/clothing/suit/armor/reactive
	name = "reactive armor"
	desc = "Doesn't seem to do much for some reason."
	var/active = 0
	var/reactivearmor_cooldown_duration = 0 //cooldown specific to reactive armor
	var/reactivearmor_cooldown = 0
	icon = 'icons/fallout/clothing/suits.dmi'
	icon_state = "tesla_chestplate_off"
	item_state = "tesla_chestplate_off"
	blood_overlay_type = "armor"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 100, acid = 100)
	actions_types = list(/datum/action/item_action/toggle)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	hit_reaction_chance = 50


/obj/item/clothing/suit/armor/reactive/attack_self(mob/user)
	src.active = !( src.active )
	if (src.active)
		to_chat(user, "<span class='notice'>[src] is now active.</span>")
		src.icon_state = "tesla_chestplate"
		src.item_state = "tesla_chestplate"
	else
		to_chat(user, "<span class='notice'>[src] is now inactive.</span>")
		src.icon_state = "tesla_chestplate_off"
		src.item_state = "tesla_chestplate_off"
	src.add_fingerprint(user)
	return

/obj/item/clothing/suit/armor/reactive/emp_act(severity)
	active = 0
	src.icon_state = "tesla_chestplate_off"
	src.item_state = "tesla_chestplate_off"
	reactivearmor_cooldown = world.time + 200
	..()

//When the wearer gets hit, this armor will teleport the user a short distance away (to safety or to more danger, no one knows. That's the fun of it!)
/obj/item/clothing/suit/armor/reactive/teleport
	name = "reactive teleport armor"
	desc = "Someone seperated our Research Director from his own head!"
	var/tele_range = 6
	var/rad_amount= 15
	reactivearmor_cooldown_duration = 100

/obj/item/clothing/suit/armor/reactive/teleport/hit_reaction(mob/living/carbon/human/owner, attack_text, final_block_chance)
	if(!active)
		return 0
	if(prob(hit_reaction_chance))
		var/mob/living/carbon/human/H = owner
		if(world.time < reactivearmor_cooldown)
			owner.visible_message("<span class='danger'>The reactive teleport system is still recharging! It fails to teleport [H]!</span>")
			return
		owner.visible_message("<span class='danger'>The reactive teleport system flings [H] clear of [attack_text], shutting itself off in the process!</span>")
		var/list/turfs = new/list()
		for(var/turf/T in orange(tele_range, H))
			if(T.density)
				continue
			if(T.x>world.maxx-tele_range || T.x<tele_range)
				continue
			if(T.y>world.maxy-tele_range || T.y<tele_range)
				continue
			turfs += T
		if(!turfs.len)
			turfs += pick(/turf in orange(tele_range, H))
		var/turf/picked = pick(turfs)
		if(!isturf(picked))
			return
		H.forceMove(picked)
		H.rad_act(rad_amount)
		reactivearmor_cooldown = world.time + reactivearmor_cooldown_duration
		return 1
	return 0

/obj/item/clothing/suit/armor/reactive/fire
	name = "reactive incendiary armor"
	desc = "An experimental suit of armor with a reactive sensor array rigged to a flame emitter. For the stylish pyromaniac."

/obj/item/clothing/suit/armor/reactive/fire/hit_reaction(mob/living/carbon/human/owner, attack_text)
	if(!active)
		return 0
	if(prob(hit_reaction_chance))
		if(world.time < reactivearmor_cooldown)
			owner.visible_message("<span class='danger'>The reactive incendiary armor on [owner] activates, but fails to send out flames as it is still recharging its flame jets!</spawn>")
			return
		owner.visible_message("<span class='danger'>The [src] blocks the [attack_text], sending out jets of flame!</span>")
		for(var/mob/living/carbon/C in range(6, owner))
			if(C != owner)
				C.fire_stacks += 8
				C.IgniteMob()
		owner.fire_stacks = -20
		reactivearmor_cooldown = world.time + reactivearmor_cooldown_duration
		return 1
	return 0


/obj/item/clothing/suit/armor/reactive/stealth
	name = "reactive stealth armor"
	desc = "An experimental suit of armor that renders the wearer invisible on detection of imminent harm, and creates a decoy that runs away from the owner. You can't fight what you can't see."

/obj/item/clothing/suit/armor/reactive/stealth/hit_reaction(mob/living/carbon/human/owner, attack_text)
	if(!active)
		return 0
	if(prob(hit_reaction_chance))
		if(world.time < reactivearmor_cooldown)
			owner.visible_message("<span class='danger'>The reactive stealth system on [owner] activates, but is still recharging its holographic emitters!</spawn>")
			return
		var/mob/living/simple_animal/hostile/illusion/escape/E = new(owner.loc)
		E.Copy_Parent(owner, 50)
		E.GiveTarget(owner) //so it starts running right away
		E.Goto(owner, E.move_to_delay, E.minimum_distance)
		owner.alpha = 0
		owner.visible_message("<span class='danger'>[owner] is hit by [attack_text] in the chest!</span>") //We pretend to be hit, since blocking it would stop the message otherwise
		spawn(40)
			owner.alpha = initial(owner.alpha)
		reactivearmor_cooldown = world.time + reactivearmor_cooldown_duration
		return 1

/obj/item/clothing/suit/armor/reactive/tesla
	name = "reactive tesla armor"
	desc = "An experimental suit of armor with sensitive detectors hooked up to a huge capacitor grid, with emitters strutting out of it. Zap."

/obj/item/clothing/suit/armor/reactive/tesla/hit_reaction(mob/living/carbon/human/owner, attack_text)
	if(!active)
		return 0
	if(prob(hit_reaction_chance))
		if(world.time < reactivearmor_cooldown)
			var/datum/effect_system/spark_spread/sparks = new /datum/effect_system/spark_spread
			sparks.set_up(1, 1, src)
			sparks.start()
			owner.visible_message("<span class='danger'>The tesla capacitors on [owner]'s reactive telsa armor are still recharging! The armor merely emits some sparks.</spawn>")
			return
		owner.visible_message("<span class='danger'>The [src] blocks the [attack_text], sending out arcs of lightning!</span>")
		for(var/mob/living/M in view(6, owner))
			if(M == owner)
				continue
			owner.Beam(M,icon_state="lightning[rand(1, 12)]",time=5)
			M.adjustFireLoss(25)
			playsound(M, 'sound/machines/defib_zap.ogg', 50, 1, -1)
		reactivearmor_cooldown = world.time + reactivearmor_cooldown_duration
		return 1

/obj/item/clothing/suit/armor/reactive/table
	name = "reactive table armor"
	desc = "If you can't beat the memes, embrace them."
	var/tele_range = 10

/obj/item/clothing/suit/armor/reactive/table/hit_reaction(mob/living/carbon/human/owner, attack_text)
	if(!active)
		return 0
	if(prob(hit_reaction_chance))
		var/mob/living/carbon/human/H = owner
		if(world.time < reactivearmor_cooldown)
			owner.visible_message("<span class='danger'>The reactive table armor's fabricators are still on cooldown!</span>")
			return
		owner.visible_message("<span class='danger'>The reactive teleport system flings [H] clear of [attack_text] and slams them into a fabricated table!</span>")
		owner.visible_message("<font color='red' size='3'>[H] GOES ON THE TABLE!!!</font>")
		owner.Weaken(2)
		var/list/turfs = new/list()
		for(var/turf/T in orange(tele_range, H))
			if(T.density)
				continue
			if(T.x>world.maxx-tele_range || T.x<tele_range)
				continue
			if(T.y>world.maxy-tele_range || T.y<tele_range)
				continue
			turfs += T
		if(!turfs.len)
			turfs += pick(/turf in orange(tele_range, H))
		var/turf/picked = pick(turfs)
		if(!isturf(picked))
			return
		H.forceMove(picked)
		new /obj/structure/table(get_turf(owner))
		reactivearmor_cooldown = world.time + reactivearmor_cooldown_duration
		return 1
	return 0

/obj/item/clothing/suit/armor/reactive/table/emp_act()
	return

//All of the armor below is mostly unused

/obj/item/clothing/suit/armor/centcom
	name = "\improper Centcom armor"
	desc = "A suit that protects against some damage."
	icon_state = "centcom"
	item_state = "centcom"
	w_class = WEIGHT_CLASS_BULKY
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	allowed = list(/obj/item/weapon/gun/energy,/obj/item/weapon/melee/baton,/obj/item/weapon/restraints/handcuffs,/obj/item/weapon/tank/internals/emergency_oxygen)
	flags = THICKMATERIAL
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	cold_protection = CHEST | GROIN | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MAX_TEMP_PROTECT
	armor = list(melee = 80, bullet = 80, laser = 50, energy = 50, bomb = 100, bio = 100, rad = 100, fire = 90, acid = 90)

/obj/item/clothing/suit/armor/heavy
	name = "heavy armor"
	desc = "A heavily armored suit that protects against moderate damage."
	icon_state = "heavy"
	item_state = "swat_suit"
	w_class = WEIGHT_CLASS_BULKY
	gas_transfer_coefficient = 0.90
	flags = THICKMATERIAL
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	slowdown = 3
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	armor = list(melee = 80, bullet = 80, laser = 50, energy = 50, bomb = 100, bio = 100, rad = 100, fire = 90, acid = 90)

/obj/item/clothing/suit/armor/tdome
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	flags = THICKMATERIAL
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor = list(melee = 80, bullet = 80, laser = 50, energy = 50, bomb = 100, bio = 100, rad = 100, fire = 90, acid = 90)

/obj/item/clothing/suit/armor/tdome/red
	name = "thunderdome suit"
	desc = "Reddish armor."
	icon_state = "tdred"
	item_state = "tdred"

/obj/item/clothing/suit/armor/tdome/green
	name = "thunderdome suit"
	desc = "Pukish armor."	//classy.
	icon_state = "tdgreen"
	item_state = "tdgreen"

/obj/item/clothing/suit/johncoat
	name = "Military trench coat"
	desc = "An olive green trenchcoat with mild wear from traveling the wastes, significantly more stylish than it's sister model."
	icon_state = "johncoat"
	item_state = "johncoat"
	pockets = /obj/item/weapon/storage/internal/pocket/big/coat
	allowed = list(/obj/item/weapon/pen,/obj/item/weapon/paper,/obj/item/weapon/stamp,/obj/item/weapon/reagent_containers/food/drinks/flask,/obj/item/weapon/melee,/obj/item/weapon/storage/box/matches,/obj/item/weapon/lighter,/obj/item/clothing/mask/cigarette,/obj/item/weapon/storage/fancy/cigarettes,/obj/item/device/flashlight,/obj/item/weapon/gun,/obj/item/ammo_box,/obj/item/ammo_casing)

/obj/item/clothing/suit/armor/igonchest
	name = "Coat of Plates"
	desc = "Covering the entirity of the owner's armor, resistant and durable, coming from the 10th century."
	icon_state = "igonchest"
	w_class = WEIGHT_CLASS_BULKY
	allowed = list(/obj/item/weapon/gun/energy,/obj/item/weapon/melee/baton,/obj/item/weapon/restraints/handcuffs,/obj/item/weapon/tank/internals/emergency_oxygen)
	flags = THICKMATERIAL
	armor = list(melee = 40, bullet = 50, laser = 20, energy = 10, bomb = 10, bio = 10, rad = 10, fire = 20, acid = 0)

/obj/item/clothing/suit/bio_suit
	name = "bio suit"
	desc = "A suit that protects against biological contamination."
	icon_state = "bio"
	item_state = "bio_suit"
	w_class = WEIGHT_CLASS_BULKY
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	flags = THICKMATERIAL | BLOCK_GAS_SMOKE_EFFECT
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	slowdown = 1
	allowed = list(/obj/item/weapon/tank/internals/emergency_oxygen,/obj/item/weapon/pen,/obj/item/device/flashlight/pen, /obj/item/weapon/reagent_containers/dropper, /obj/item/weapon/reagent_containers/syringe, /obj/item/weapon/reagent_containers/hypospray)
	armor = list(melee = 30, bullet = 30, laser = 20,energy = 20, bomb = 20, bio = 100, rad = 30, fire = 30, acid = 100)
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	strip_delay = 70
	put_on_delay = 70
	resistance_flags = ACID_PROOF

/obj/item/clothing/suit/bio_suit/sciencesuit
	name = "All-Purpose Science Suit"
	desc = "The All-Purpose Science Suit is an environmentally sealed suit similar to that of a hazmat suit. While it does not protect against radiation as well as it, it provides slightly more protection against physical and chemical hazards. Perfect for scientific expeditions!."
	allowed = list(/obj/item/weapon/gun/energy,/obj/item/weapon/reagent_containers/spray/pepper,/obj/item/weapon/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/restraints/handcuffs,/obj/item/device/flashlight/seclite,/obj/item/weapon/melee/classic_baton/telescopic,/obj/item/weapon/kitchen/knife/combat,/obj/item/weapon/tank/internals/emergency_oxygen)
	icon_state = "sciencesuit"
	item_state = "sciencesuit"


/* Stealth Suits */

/obj/item/clothing/suit/stealth/stealthsuit
	name = "Chinese Stealth Suit"
	desc = "A form-fitting armor suit complete with an active stealth field that can be triggered at the press of a button."
	icon_state = "stealthsuit"
	item_state = "stealthsuit"
	allowed = list(/obj/item/weapon/gun,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/restraints/handcuffs,/obj/item/weapon/tank/internals,/obj/item/weapon/stock_parts/cell)
	slowdown = 0
	resistance_flags = LAVA_PROOF | ACID_PROOF
	armor = list(melee = 60, bullet = 50, laser = 30,energy = 15, bomb = 30, bio = 30, rad = 30, fire = 100, acid = 100)
	strip_delay = 12
	var/mob/living/carbon/human/user = null
	var/charge = 300
	var/max_charge = 300
	var/on = 0
	var/old_alpha = 0
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/suit/stealth/stealthsuit/ui_action_click(mob/user)
	if(user.get_item_by_slot(slot_wear_suit) == src)
		if(!on)
			Activate(usr)
		else
			Deactivate()
	return

/obj/item/clothing/suit/stealth/stealthsuit/item_action_slot_check(slot, mob/user)
	if(slot == slot_wear_suit)
		return 1

/obj/item/clothing/suit/stealth/stealthsuit/proc/Activate(mob/living/carbon/human/user)
	if(!user)
		return
	to_chat(user, "<span class='notice'>You activate [src].</span>")
	src.user = user
	START_PROCESSING(SSobj, src)
	old_alpha = user.alpha
	on = 1


/obj/item/clothing/suit/stealth/stealthsuit/proc/Deactivate()
	to_chat(user, "<span class='notice'>You deactivate [src].</span>")
	STOP_PROCESSING(SSobj, src)
	if(user)
		user.alpha = old_alpha
	on = 0
	user = null



/obj/item/clothing/suit/stealth/stealthsuit/dropped(mob/user)
	..()
	if(user && user.get_item_by_slot(slot_wear_suit) != src)
		Deactivate()

/obj/item/clothing/suit/stealth/stealthsuit/process()
	if(user.get_item_by_slot(slot_wear_suit) != src)
		Deactivate()
		return
	var/turf/T = get_turf(src)
	if(on)
		var/lumcount = T.get_lumcount()
		if(lumcount > 3)
			charge = max(0,charge - 25)//Quick decrease in light
		else
			charge = min(max_charge,charge + 50) //Charge in the dark
		animate(user,alpha = Clamp(255 - charge,0,255),time = 5)

/obj/item/clothing/suit/armor/ranger
	name = "Veteran Ranger Trenchcoat"
	desc = "An armored leather trenchcoat - the traditional uniform of the Desert Rangers."
	icon_state = "vet_ranger"
	item_state = "vet_ranger"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list(melee = 50, bullet = 55, laser = 30, energy = 30, bomb = 30, bio = 0, rad = 50, fire = 30, acid = 30)
	put_on_delay = 20
	strip_delay = 20
	self_weight = 2
	allowed = list(/obj/item/weapon/gun/ballistic/revolver)

/obj/item/clothing/suit/armor/ranger/old
	name = "Worn Veteran Ranger Combat Armor"
	desc = "A unique armor, that has been in countless battles and caused much bloodshed."
	icon_state = "old_ranger"
	item_state = "old_ranger"
	armor = list(melee = 30, bullet = 60, laser = 15, energy = 10, bomb = 25, bio = 0, rad = 20, fire = 20, acid = 20)
	self_weight = 2

/obj/item/clothing/suit/armor/ranger/eliteriotgear
	name = "Elite Riot Gear"
	desc = "An armored leather trenchcoat that has been heavily modified for the purposes of advanced riot control. It has been reinforced with shoulder plates and knee pads as well as features an enhanced gas filtration system."
	icon_state = "elite_riot_gear"
	item_state = "elite_riot_gear"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list(melee = 65, bullet = 65, laser = 30, energy = 30, bomb = 30, bio = 0, rad = 50, fire = 30, acid = 30)
	put_on_delay = 20
	strip_delay = 20
	self_weight = 2

/obj/item/clothing/suit/armor/sullyvest
	name = "Militia Vest"
	desc = "An improved ballistic vest, crafted in Flagstaff"
	icon_state = "sullyvest"
	item_state = "sullyvest"
	armor = list(melee = 45, bullet = 85, laser = 40, energy = 40, bomb = 60, bio = 0, rad = 0, fire = 50, acid = 50)
	strip_delay = 70
	put_on_delay = 50

/obj/item/clothing/suit/bio_suit/advancedsciencesuit
	name = "Advanced Science Suit"
	desc = "A modified All-Purpose Science Suit engineered by an Enclave scientist. It is crafted of lightweight polymers similar to that of the Advanced Power Armor, but lacks the weight and servos of a true suit of power armor has. Like the Science Suit, it is still environmentally sealed for maximum protection from the elements of the wasteland."
	icon_state = "advscience"
	item_state = "advscience"
	w_class = WEIGHT_CLASS_BULKY
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	flags = THICKMATERIAL | BLOCK_GAS_SMOKE_EFFECT
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	slowdown = 1
	allowed = list(/obj/item/weapon/gun/energy,/obj/item/weapon/reagent_containers/spray/pepper,/obj/item/weapon/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/restraints/handcuffs,/obj/item/device/flashlight/seclite,/obj/item/weapon/melee/classic_baton/telescopic,/obj/item/weapon/kitchen/knife/combat,/obj/item/weapon/tank/internals/emergency_oxygen)
	armor = list(melee = 50, bullet = 65, laser = 65, energy = 65, bomb = 50, bio = 50, rad = 60, fire = 60, acid = 100)
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	strip_delay = 70
	put_on_delay = 70
	resistance_flags = ACID_PROOF