/client/proc/view_runtimes()
	set category = "Debug"
	set name = "View Runtimes"
	set desc = "Open the runtime Viewer"

	if(!holder)
		return

	error_cache.show_to(src)

// Time freezing a living mob - Sansaur

/client/proc/cmd_admin_timeFreeze(mob/M)
	set category = "Special Verbs"
	set name = "Time Freeze"

	if(!holder)
		to_chat(src, "Only administrators may use this command.")
		return
	if(!M)
		return

	M.timeFreeze()

/mob/proc/timeFreeze()
	var/obj/punishment/NEWPUN = new /obj/punishment(loc)
	src.forceMove(NEWPUN)
	NEWPUN.frozentarget = src
	NEWPUN.icon = src.icon
	NEWPUN.icon_state = src.icon_state
	NEWPUN.overlays = src.overlays
	NEWPUN.underlays = src.underlays
	NEWPUN.dir = src.dir
	NEWPUN.name = "[src.real_name] being punished in time"
	NEWPUN.desc = "[src.real_name] is time frozen right now, you better not mess with him or you'll suffer the same fate"
	
	NEWPUN.overlays += image('icons/fallout/objects/structures/punish.dmi',icon_state = "detain")
	timefrozen = 1


// Time freeze mechanic - Sansaur

/mob/living/Life()
	if(timefrozen)
		return
	..()

/mob/living/Move(atom/newloc, direct)
	if(timefrozen)
		return
	..(newloc,direct) 

/mob/living/swap_hand()
	if(timefrozen)
		return
	..()

/mob/living/mode()
	if(timefrozen)
		return
	..()

/mob/living/drop_item_v()
	if(timefrozen)
		return
	..()

/mob/living/canSuicide()
	if(timefrozen)
		return
	..()

/obj/punishment
	var/mob/living/frozentarget = null
	icon = 'icons/fallout/objects/structures/punish.dmi'
	icon_state = "punish"
	name = "Punishment anomaly"
	desc = "What the heck is this?"
	
/obj/punishment/Destroy(force=0)
	if(frozentarget)
		frozentarget.forceMove(src.loc)
		frozentarget.timefrozen = 0
	for(var/atom/movable/I in contents)
		I.forceMove(src.loc)
	..()

/obj/punishment/obj_break(damage_flag)
	return

/obj/punishment/take_damage()
	return

/obj/punishment/attackby()
	return

/obj/punishment/deconstruct(disassembled = TRUE)
	return

/obj/punishment/bullet_act()
	return 

/obj/punishment/ex_act()
	return 

/obj/punishment/acid_act()
	return

/obj/punishment/fire_act()
	return  