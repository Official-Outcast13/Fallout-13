//Fallout 13 Vault blast doors and controls directory

/obj/structure/vault_door
	name = "Vault 113 blast door"
	desc = "A conventional Vault blast door of \"Nine cog\" model.<br>A blast door design incorporates proper sealants against radiation and other hazardous elements that may be created in the event of a nuclear war, to properly protect its inhabitants."
	icon = 'icons/fallout/machines/gear.dmi'
	icon_state = "113closed"
	density = 1
	opacity = 1
	layer = ABOVE_ALL_MOB_LAYER
	anchored = 1
	var/is_busy = 0
	var/destroyed = 0
	var/id = 1
	var/close_state = "113closed"
	var/open_state = "113open"
	var/closing_state = "113closing"
	var/opening_state = "113opening"
	var/broken_state = "113empty"
	var/plasteel_to_weld = 0
	pixel_x = -32
	pixel_y = -32
	obj_integrity = 50000
	max_integrity = 50000
	integrity_failure = 3000

/obj/structure/vault_door/examine(mob/user)
	..()
	if(plasteel_to_weld)
		to_chat(user, "[src] has [plasteel_to_weld] sheets of plasteel on it ready to weld")

/obj/structure/vault_door/old
	name = "\proper ancient Vault blast door"
	icon_state = "oldclosed"
	close_state = "oldclosed"
	open_state = "oldopen"
	closing_state = "oldclosing"
	opening_state = "oldopening"
	broken_state = "oldempty"

/obj/structure/vault_door/obj_break(damage_flag)
	icon_state = broken_state
	src.set_opacity(0)
	src.density = 0
	destroyed = 1

/obj/structure/vault_door/ex_act(severity)
	take_damage(300*severity)

/obj/structure/vault_door/proc/repaired()
	icon_state = close_state
	src.set_opacity(1)
	src.density = 1
	destroyed = 0

/obj/structure/vault_door/proc/open()
	is_busy = 1
	flick(opening_state, src)
	icon_state = open_state
	spawn(11)
		playsound(loc, 'sound/f13machines/doorgear_open.ogg', 50, 0, 10)
		spawn(19)
			src.set_opacity(0)
			src.density = 0
			is_busy = 0
/obj/structure/vault_door/proc/close()
	is_busy = 1
	flick(closing_state, src)
	icon_state = close_state
	spawn(11)
		playsound(loc, 'sound/f13machines/doorgear_close.ogg', 50, 0, 10)
		spawn(19)
			src.set_opacity(1)
			src.density = 1
			is_busy = 0

/obj/structure/vault_door/proc/toogle()
	if(destroyed)
		usr << "<span class='warning'>[src] is broken.</span>"
		return
	if(is_busy)
		usr << "<span class='warning'>[src] is busy.</span>"
		return
	if (density)
		open()
		return
	close()


/obj/structure/vault_door/take_damage(damage_amount, damage_type = BRUTE, damage_flag = 0, sound_effect = 1, attack_dir)
	if(damage_amount < 70)
		// Lowered the damage treshold because the door may now be repaired
		// For now we'll make it so you need something REALLY STRONG to break the damned vault door. - Sansaur
		// We'll think of newer ways to actually break the vault door, something that makes more sense than just "big damage numbers"
		visible_message("<span class='warning'>[src] looks unscratched</span>", null, null, COMBAT_MESSAGE_RANGE)
		return
	else
		..()
		if(obj_integrity <= 0)
			obj_integrity = 1

/obj/structure/vault_door/deconstruct(disassembled = TRUE)
	return

/obj/structure/vault_door/attackby(obj/item/W, mob/living/user, params)
	if(istype(W, /obj/item/stack/sheet/plasteel))
		var/obj/item/stack/sheet/plasteel/MYPLASTEEL = W
		to_chat(user, "<span class='info'>You begin deploying one sheet of [MYPLASTEEL] to [src] </span>")
		if(do_after(user, 50, 1, src, 1))
			if(MYPLASTEEL.use(1))
				to_chat(user, "<span class='info'>You deploy one sheet of [MYPLASTEEL] to [src] </span>")
				plasteel_to_weld++
		else
			to_chat(user, "<span class='warning'>You stopped deploying one sheet of [MYPLASTEEL] to [src] </span>")
		return
	
	if(istype(W, /obj/item/weapon/weldingtool))
		var/obj/item/weapon/weldingtool/MYWELDING = W
		if(MYWELDING.isOn() && (plasteel_to_weld > 0))
			MYWELDING.remove_fuel(1, user)
			playsound(user.loc, MYWELDING.usesound, 50, 1)
			to_chat(user, "<span class='info'>You begin repairing [src]</span>")
			if(do_after(user, 50, 1, src, 1))
				to_chat(user, "<span class='info'>You repair [src] by fusing one of it's plasteel covers into the door as additional armor</span>")
				// Each plasteel repairs 300 points of damage
				plasteel_to_weld--
				obj_integrity+=300
				if(obj_integrity > max_integrity)
					obj_integrity=max_integrity
				if(obj_integrity > integrity_failure)
					repaired()
			else
				to_chat(user, "<span class='info'>You stopped repairing [src]</span>")
		else
			to_chat(user, "<span class='warning'>You cannot repair [src] right now, check your welding tool and if [src] has been covered with plasteel</span>")
		return
	
	..()
//Lever

/obj/machinery/doorButtons/vaultButton
	name = "Vault access panel"
	desc = "Pull the lever to open the door - it's that simple."
	icon = 'icons/fallout/machines/lever.dmi'
	icon_state = "lever"
	anchored = 1
	density = 1
	var/id = 1
	// saving the vaultDOOR it doesn't run a fucking "foreach in world" every time someone presses a button.
	var/obj/structure/vault_door/vaultDOOR

/obj/machinery/doorButtons/vaultButton/New()
	. = ..()
	search_my_vault_door()

/obj/machinery/doorButtons/vaultButton/proc/search_my_vault_door()
	for(var/obj/structure/vault_door/door in world)
		if(door.id == id)
			vaultDOOR = door

/obj/machinery/doorButtons/vaultButton/proc/toggle_door()
	var/opened
	icon_state = "lever0"
	if(!vaultDOOR)
		search_my_vault_door()

	vaultDOOR.toogle()
	opened = !vaultDOOR.density
	spawn(50)
		if(opened)
			icon_state = "lever2"
		else
			icon_state = "lever"

/obj/machinery/doorButtons/vaultButton/attackby(obj/item/weapon/W, mob/user, params)
	if(user.a_intent == INTENT_HARM)
		return ..()
	if(istype(W, /obj/item/weapon/card/id/vault))
		var/obj/item/weapon/card/id/vault/MYID = W
		if(!MYID.registered_name)
			to_chat(user, "<span class='warning'>The access panel rejects [MYID] identification </span>")
		else
			toggle_door()
			return
	attack_hand(user)

/obj/machinery/doorButtons/vaultButton/attack_hand(mob/user, allowed)
	..()
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		if(C.handcuffed)
			return
		for(var/obj/item/G in C.contents)
			if(istype(G, /obj/item/weapon/card/id/vault))
				var/obj/item/weapon/card/id/vault/MYID = G
				if(!MYID.registered_name)
					to_chat(user, "<span class='warning'>The access panel rejects [MYID] identification </span>")
					continue
				else
					toggle_door()
					return
			if(istype(G, /obj/item/device/pda))
				var/obj/item/device/pda/MYPDA = G
				var/obj/item/weapon/card/id/vault/MYID = MYPDA.id
				if(!MYID)
					to_chat(user, "<span class='warning'>[MYPDA] doesn't have a valid ID</span>")
					continue
				if(!MYID.registered_name)
					to_chat(user, "<span class='warning'>The access panel rejects [MYID] identification </span>")
					continue
				else
					toggle_door()
					return

	to_chat(user, "<span class='warning'>[src] requires for an identification which you currently don't have on yourself</span>")

