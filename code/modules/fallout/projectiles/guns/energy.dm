//Fallout 13 energy firearms directory

/*
/obj/item/weapon/gun/energy/laser/wattz1000
	name = "Laser pistol"
	desc = "A Wattz 1000 Laser Pistol. Civilian model, so the wattage is lower than military or police versions"
	icon_state = "wattz1000"
	icon = 'icons/fallout/objects/guns/energy.dmi'
	ammo_type = list(/obj/item/ammo_casing/energy/lasergun)
	origin_tech = "combat=2;magnets=2"

/obj/item/weapon/gun/energy/wattz2000
	name = "wattz2000"
	desc = "A Wattz 2000 Laser Rifle"
	icon_state = "wattz2000"
	item_state = "wattz2000"
	icon = 'icons/fallout/objects/guns/energy.dmi'
	w_class = 4
	force = 10
	flags =  CONDUCT
	ammo_type = list(/obj/item/ammo_casing/energy/laser/heavy)
	ammo_x_offset = 3
*/

//////////PLASMA/////////

/obj/item/weapon/gun/energy/plasma
	name ="plasma rifle"
	icon_state = "plasma"
	item_state = "plasma"
	icon =  'icons/fallout/objects/guns/energy.dmi'
	desc = "One of the most advanced weapons of the Pre-War world, a superheated bolt of plasma is charged in a magnetic chamber before being unleashed upon its target."
	origin_tech = "combat=4;magnets=3"
	ammo_type = list(/obj/item/ammo_casing/energy/f13plasma)
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY
	fire_sound = 'sound/f13weapons/plasmarifle.ogg'
	burst_size = 2
	shaded_charge = 1
	fire_delay = 3

/obj/item/weapon/gun/energy/plasma/glock
	name ="glock 86"
	icon_state = "glock86"
	item_state = "glock86"
	icon = 'icons/fallout/objects/guns/energy.dmi'
	desc = "Glock 86 Plasma Pistol. Designed by the Gaston Glock artificial intelligence. Shoots a small bolt of superheated plasma."
	origin_tech = "combat=2;magnets=3"
	weapon_weight = WEAPON_LIGHT
	w_class = WEIGHT_CLASS_NORMAL
	burst_size = 1
	zoomable = TRUE
	zoom_amt = 3
	scopetype = /obj/screen/fullscreen/scope/tech

/obj/item/weapon/gun/energy/plasma/pistol
	name ="plasma pistol"
	icon_state = "plasma-pistol"
	item_state = "plasma-pistol"
	icon = 'icons/fallout/objects/guns/energy.dmi'
	desc = "The plasma pistol is a powerful energy-based handgun, firing superheated bolts of green plasma capable of frying it's targets."
	origin_tech = "combat=2;magnets=3"
	weapon_weight = WEAPON_LIGHT
	w_class = WEIGHT_CLASS_NORMAL
	burst_size = 1

/obj/item/weapon/gun/energy/plasma/tri
	name ="multiplas"
	icon_state = "multiplas"
	item_state = "multiplas"
	origin_tech = "combat=3;magnets=2"
	ammo_type = list(/obj/item/ammo_casing/energy/f13plasma/tri)
	w_class = WEIGHT_CLASS_BULKY
	fire_delay = 5
	burst_size = 1
	w_class = 3

/obj/item/weapon/gun/energy/plasma/turbo
	name ="plasma caster"
	icon_state = "turbo-plasma-rifle"
	item_state = "turbo-plasma-rifle"
	icon = 'icons/fallout/objects/guns/energy.dmi'
	desc = "A heavy plasma weapon, built around the frame of a industrial cutting laser, but refurbished to emit focused bolts of plasma at a high speed without overheating."
	origin_tech = "combat=6;magnets=6"
	ammo_type = list(/obj/item/ammo_casing/energy/f13plasma/turbo)
	weapon_weight = WEAPON_HEAVY
	w_class = WEIGHT_CLASS_HUGE
	fire_delay = 0
	w_class = 4
	burst_size = 3

///////LASERS//////

/obj/item/weapon/gun/energy/laser/rcw
	name ="laser RCW"
	icon_state = "rcw"
	item_state = "rcw"
	icon = 'icons/fallout/objects/guns/energy.dmi'
	desc = "Rapid capacitor weapon."
	origin_tech = "combat=6;magnets=6"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/rcw)
	burst_size = 5 //Fuck yeah
	w_class = 3
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY

/obj/item/weapon/gun/energy/laser/pistol
	name ="laser pistol"
	icon_state = "laser-pistol"
	item_state = "laser-pistol"
	icon = 'icons/fallout/objects/guns/energy.dmi'
	desc = "The AEP7 laser pistol was put into service to replace the AEP5 model. With a generous battery size, tight shot grouping at range, resilience to extended use, and fairly decent damage output, it is a very good choice for a sidearm and is used extensively in this role by the Brotherhood of Steel and the Enclave in the Capital Wasteland."
	origin_tech = "combat=3;magnets=2"
	ammo_type = list(/obj/item/ammo_casing/energy/laser)
	burst_size = 1
	fire_delay = 2
	w_class = 2
	weapon_weight = WEAPON_LIGHT
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/energy/laser/rifle
	name ="AER9 laser rifle"
	icon_state = "laser-rifle9"
	item_state = "laser-rifle9"
	icon = 'icons/fallout/objects/guns/energy.dmi'
	desc = "A prototype laser rifle, meant to fire much faster and longer without overheating"
	origin_tech = "combat=3;magnets=2"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/rifle)
	burst_size = 5
	w_class = 3
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY

/obj/item/weapon/gun/energy/laser/rifle/aer13
	name ="AER13 laser rifle"
	desc = "It appears to be a even more lightened version of the original AER9 rifle."
	icon_state = "laser-rifle13"
	item_state = "laser-rifle13"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/rifle/aer13)
	burst_size = 5

/obj/item/weapon/gun/energy/laser/rifle/tri
	name ="tribeam laser rifle"
	icon_state = "tribeam"
	item_state = "tribeam"
	origin_tech = "combat=3;magnets=2"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/rifle/tri)
	burst_size = 1
	fire_delay = 3
	w_class = 3

/obj/item/weapon/gun/energy/laser/laer
	name = "LAER"
	desc = "The Laser Assisted Electric Rifle is a prototype weapon developed at the Big Mountain Research Facility."
	icon = 'icons/fallout/objects/guns/energy.dmi'
	icon_state = "laer"
	item_state = "laer"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/laer)
	burst_size = 2
	w_class = 3
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY

//Gauss Rifles//

/obj/item/weapon/gun/energy/laser/gaussrifle
	name = "gauss rifle"
	desc = "The Gauss Rifle is loaded with a magazine filled with slivers of inert metal. Using a substantial amount of charge, a power cell activates magnetic coils to hurtle these slugs at incredible speeds."
	icon = 'icons/fallout/objects/guns/energy.dmi'
	icon_state = "gaussrifle"
	item_state = "gaussrifle"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/gauss2mm)
	w_class = 3
	zoomable = TRUE
	zoom_amt = 22
	slot_flags = SLOT_BACK
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY