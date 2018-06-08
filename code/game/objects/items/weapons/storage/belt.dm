/obj/item/weapon/storage/belt
	name = "belt"
	desc = "Can hold various things."
	icon = 'icons/obj/clothing/belts.dmi'
	icon_state = "utilitybelt"
	item_state = "utility"
	slot_flags = SLOT_BELT
	attack_verb = list("whipped", "lashed", "disciplined")
	obj_integrity = 300
	max_integrity = 300

/obj/item/weapon/storage/belt/update_icon()
	cut_overlays()
	for(var/obj/item/I in contents)
		add_overlay("[I.name]")
	..()

/obj/item/weapon/storage/belt/utility
	name = "toolbelt" //Carn: utility belt is nicer, but it bamboozles the text parsing.
	desc = "Holds tools."
	icon_state = "utilitybelt"
	item_state = "utility"
	can_hold = list(
		/obj/item/weapon/crowbar,
		/obj/item/weapon/screwdriver,
		/obj/item/weapon/weldingtool,
		/obj/item/weapon/wirecutters,
		/obj/item/weapon/wrench,
		/obj/item/device/multitool,
		/obj/item/device/flashlight,
		/obj/item/stack/cable_coil,
		/obj/item/device/t_scanner,
		/obj/item/device/analyzer,
		/obj/item/weapon/extinguisher/mini,
		/obj/item/device/radio,
		/obj/item/clothing/gloves,
		/obj/item/weapon/lighter,
		/obj/item/weapon/storage/fancy/cigarettes,
		/obj/item/weapon/storage/pill_bottle,
		/obj/item/device/flashlight/pen,
		/obj/item/weapon/kitchen
		)

/obj/item/weapon/storage/belt/utility/chief
	name = "Chief Engineer's toolbelt"
	desc = "Holds tools, looks snazzy"
	icon_state = "utilitybelt_ce"
	item_state = "utility_ce"

/obj/item/weapon/storage/belt/utility/chief/full/New()
	..()
	new /obj/item/weapon/screwdriver/power(src)
	new /obj/item/weapon/crowbar/power(src)
	new /obj/item/weapon/weldingtool/experimental(src)//This can be changed if this is too much
	new /obj/item/device/multitool(src)
	new /obj/item/stack/cable_coil(src,30,pick("red","yellow","orange"))
	new /obj/item/weapon/extinguisher/mini(src)
	new /obj/item/device/analyzer(src)
	//much roomier now that we've managed to remove two tools


/obj/item/weapon/storage/belt/utility/full/New()
	..()
	new /obj/item/weapon/screwdriver(src)
	new /obj/item/weapon/wrench(src)
	new /obj/item/weapon/weldingtool(src)
	new /obj/item/weapon/crowbar(src)
	new /obj/item/weapon/wirecutters(src)
	new /obj/item/device/multitool(src)
	new /obj/item/stack/cable_coil(src,30,pick("red","yellow","orange"))


/obj/item/weapon/storage/belt/utility/atmostech/New()
	..()
	new /obj/item/weapon/screwdriver(src)
	new /obj/item/weapon/wrench(src)
	new /obj/item/weapon/weldingtool(src)
	new /obj/item/weapon/crowbar(src)
	new /obj/item/weapon/wirecutters(src)
	new /obj/item/device/t_scanner(src)
	new /obj/item/weapon/extinguisher/mini(src)



/obj/item/weapon/storage/belt/medical
	name = "medical belt"
	desc = "Can hold various medical equipment."
	icon_state = "medicalbelt"
	item_state = "medical"
	max_w_class = WEIGHT_CLASS_BULKY
	can_hold = list(
		/obj/item/device/healthanalyzer,
		/obj/item/weapon/dnainjector,
		/obj/item/weapon/reagent_containers/dropper,
		/obj/item/weapon/reagent_containers/glass/beaker,
		/obj/item/weapon/reagent_containers/glass/bottle,
		/obj/item/weapon/reagent_containers/pill,
		/obj/item/weapon/reagent_containers/syringe,
		/obj/item/weapon/lighter,
		/obj/item/weapon/storage/fancy/cigarettes,
		/obj/item/weapon/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/device/flashlight/pen,
		/obj/item/weapon/extinguisher/mini,
		/obj/item/weapon/reagent_containers/hypospray,
		/obj/item/device/sensor_device,
		/obj/item/device/radio,
		/obj/item/clothing/gloves/,
		/obj/item/weapon/lazarus_injector,
		/obj/item/weapon/bikehorn/rubberducky,
		/obj/item/clothing/mask/surgical,
		/obj/item/clothing/mask/breath,
		/obj/item/clothing/mask/breath/medical,
		/obj/item/weapon/surgical_drapes, //for true paramedics
		/obj/item/weapon/scalpel,
		/obj/item/weapon/circular_saw,
		/obj/item/weapon/surgicaldrill,
		/obj/item/weapon/retractor,
		/obj/item/weapon/cautery,
		/obj/item/weapon/hemostat,
		/obj/item/device/geiger_counter,
		/obj/item/clothing/neck/stethoscope,
		/obj/item/weapon/stamp,
		/obj/item/clothing/glasses,
		/obj/item/weapon/wrench/medical,
		/obj/item/clothing/mask/muzzle,
		/obj/item/weapon/storage/bag/chemistry,
		/obj/item/weapon/storage/bag/bio,
		/obj/item/weapon/reagent_containers/blood,
		/obj/item/weapon/tank/internals/emergency_oxygen
		)


/obj/item/weapon/storage/belt/security
	name = "security belt"
	desc = "Can hold security gear like handcuffs and flashes."
	icon_state = "securitybelt"
	item_state = "security"//Could likely use a better one.
	storage_slots = 5
	max_w_class = WEIGHT_CLASS_NORMAL //Because the baton wouldn't fit otherwise. - Neerti
	can_hold = list(
		/obj/item/weapon/melee/baton,
		/obj/item/weapon/melee/classic_baton,
		/obj/item/weapon/grenade,
		/obj/item/weapon/reagent_containers/spray/pepper,
		/obj/item/weapon/restraints/handcuffs,
		/obj/item/device/assembly/flash/handheld,
		/obj/item/clothing/glasses,
		/obj/item/ammo_casing/shotgun,
		/obj/item/ammo_box,
		/obj/item/weapon/reagent_containers/food/snacks/donut,
		/obj/item/weapon/reagent_containers/food/snacks/donut/jelly,
		/obj/item/weapon/kitchen/knife/combat,
		/obj/item/device/flashlight/seclite,
		/obj/item/weapon/melee/classic_baton/telescopic,
		/obj/item/device/radio,
		/obj/item/clothing/gloves/,
		/obj/item/weapon/restraints/legcuffs/bola
		)

/obj/item/weapon/storage/belt/security/full/New()
	..()
	new /obj/item/weapon/reagent_containers/spray/pepper(src)
	new /obj/item/weapon/restraints/handcuffs(src)
	new /obj/item/weapon/grenade/flashbang(src)
	new /obj/item/device/assembly/flash/handheld(src)
	new /obj/item/weapon/melee/baton/loaded(src)
	update_icon()


/obj/item/weapon/storage/belt/mining
	name = "explorer's webbing"
	desc = "A versatile chest rig, cherished by miners and hunters alike."
	icon_state = "explorer1"
	item_state = "explorer1"
	storage_slots = 6
	w_class = WEIGHT_CLASS_BULKY
	max_w_class = WEIGHT_CLASS_BULKY //Pickaxes are big.
	max_combined_w_class = 20 //Not an issue with this whitelist, probably.
	can_hold = list(
		/obj/item/weapon/crowbar,
		/obj/item/weapon/screwdriver,
		/obj/item/weapon/weldingtool,
		/obj/item/weapon/wirecutters,
		/obj/item/weapon/wrench,
		/obj/item/device/flashlight,
		/obj/item/stack/cable_coil,
		/obj/item/device/analyzer,
		/obj/item/weapon/extinguisher/mini,
		/obj/item/device/radio,
		/obj/item/clothing/gloves,
		/obj/item/weapon/resonator,
		/obj/item/device/mining_scanner,
		/obj/item/weapon/pickaxe,
		/obj/item/stack/sheet/animalhide,
		/obj/item/stack/sheet/sinew,
		/obj/item/stack/sheet/bone,
		/obj/item/weapon/lighter,
		/obj/item/weapon/storage/fancy/cigarettes,
		/obj/item/weapon/reagent_containers/food/drinks/bottle,
		/obj/item/stack/medical,
		/obj/item/weapon/kitchen/knife,
		/obj/item/weapon/reagent_containers/hypospray,
		/obj/item/device/gps,
		/obj/item/weapon/storage/bag/ore,
		/obj/item/weapon/survivalcapsule,
		/obj/item/device/t_scanner/adv_mining_scanner,
		/obj/item/weapon/reagent_containers/pill,
		/obj/item/weapon/storage/pill_bottle,
		/obj/item/weapon/ore,
		/obj/item/weapon/reagent_containers/food/drinks,
		/obj/item/organ/hivelord_core,
		/obj/item/device/wormhole_jaunter,
		/obj/item/weapon/storage/bag/plants,

		)


/obj/item/weapon/storage/belt/mining/vendor
	contents = newlist(/obj/item/weapon/survivalcapsule)

/obj/item/weapon/storage/belt/mining/alt
	icon_state = "explorer2"
	item_state = "explorer2"

/obj/item/weapon/storage/belt/mining/primitive
	name = "hunter's belt"
	desc = "A versatile belt, woven from sinew."
	storage_slots = 5
	icon_state = "ebelt"
	item_state = "ebelt"

/obj/item/weapon/storage/belt/soulstone
	name = "soul stone belt"
	desc = "Designed for ease of access to the shards during a fight, as to not let a single enemy spirit slip away"
	icon_state = "soulstonebelt"
	item_state = "soulstonebelt"
	storage_slots = 6
	can_hold = list(
		/obj/item/device/soulstone
		)

/obj/item/weapon/storage/belt/soulstone/full/New()
	..()
	for(var/i in 1 to 6)
		new /obj/item/device/soulstone(src)

/obj/item/weapon/storage/belt/champion
	name = "championship belt"
	desc = "Proves to the world that you are the strongest!"
	icon_state = "championbelt"
	item_state = "champion"
	materials = list(MAT_GOLD=400)
	storage_slots = 1
	can_hold = list(
		/obj/item/clothing/mask/luchador
		)

/obj/item/weapon/storage/belt/military
	name = "military belt"
	desc = "A syndicate belt designed to be used by boarding parties.  Its style is modeled after the hardsuits they wear."
	icon_state = "militarybelt"
	item_state = "military"
	max_w_class = WEIGHT_CLASS_SMALL
	self_weight = 0.6

/obj/item/weapon/storage/belt/military/abductor
	name = "agent belt"
	desc = "A belt used by abductor agents."
	icon = 'icons/obj/abductor.dmi'
	icon_state = "belt"
	item_state = "security"

/obj/item/weapon/storage/belt/military/abductor/full/New()
	..()
	new /obj/item/weapon/screwdriver/abductor(src)
	new /obj/item/weapon/wrench/abductor(src)
	new /obj/item/weapon/weldingtool/abductor(src)
	new /obj/item/weapon/crowbar/abductor(src)
	new /obj/item/weapon/wirecutters/abductor(src)
	new /obj/item/device/multitool/abductor(src)
	new /obj/item/stack/cable_coil(src,30,"white")


/obj/item/weapon/storage/belt/military/army
	name = "army belt"
	desc = "A belt used by military forces."
	icon_state = "grenadebeltold"
	item_state = "security"

/obj/item/weapon/storage/belt/military/assault
	name = "assault belt"
	desc = "A tactical assault belt."
	icon_state = "assaultbelt"
	item_state = "security"
	storage_slots = 6
	self_weight = 0.3

/obj/item/weapon/storage/belt/grenade
	name = "grenadier belt"
	desc = "A belt for holding grenades."
	icon_state = "grenadebeltnew"
	item_state = "security"
	max_w_class = WEIGHT_CLASS_BULKY
	storage_slots = 30
	can_hold = list(
		/obj/item/weapon/grenade,
		/obj/item/weapon/screwdriver,
		/obj/item/weapon/lighter,
		/obj/item/device/multitool,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/molotov,
		/obj/item/weapon/c4,
		)
/obj/item/weapon/storage/belt/grenade/full/New()
	..()
	new /obj/item/weapon/grenade/flashbang(src)
	new /obj/item/weapon/grenade/smokebomb(src)
	new /obj/item/weapon/grenade/smokebomb(src)
	new /obj/item/weapon/grenade/smokebomb(src)
	new /obj/item/weapon/grenade/smokebomb(src)
	new /obj/item/weapon/grenade/empgrenade(src)
	new /obj/item/weapon/grenade/empgrenade(src)
	new /obj/item/weapon/grenade/syndieminibomb/concussion/frag(src)
	new /obj/item/weapon/grenade/syndieminibomb/concussion/frag(src)
	new /obj/item/weapon/grenade/syndieminibomb/concussion/frag(src)
	new /obj/item/weapon/grenade/syndieminibomb/concussion/frag(src)
	new /obj/item/weapon/grenade/syndieminibomb/concussion/frag(src)
	new /obj/item/weapon/grenade/syndieminibomb/concussion/frag(src)
	new /obj/item/weapon/grenade/syndieminibomb/concussion/frag(src)
	new /obj/item/weapon/grenade/syndieminibomb/concussion/frag(src)
	new /obj/item/weapon/grenade/syndieminibomb/concussion/frag(src)
	new /obj/item/weapon/grenade/syndieminibomb/concussion/frag(src)
	new /obj/item/weapon/grenade/gluon(src)
	new /obj/item/weapon/grenade/gluon(src)
	new /obj/item/weapon/grenade/gluon(src)
	new /obj/item/weapon/grenade/gluon(src)
	new /obj/item/weapon/grenade/chem_grenade/incendiary(src)
	new /obj/item/weapon/grenade/chem_grenade/incendiary(src)
	new /obj/item/weapon/grenade/chem_grenade/facid(src)
	new /obj/item/weapon/grenade/syndieminibomb(src)
	new /obj/item/weapon/grenade/syndieminibomb(src)
	new /obj/item/weapon/screwdriver(src)
	new /obj/item/device/multitool(src)

/obj/item/weapon/storage/belt/wands
	name = "wand belt"
	desc = "A belt designed to hold various rods of power. A veritable fanny pack of exotic magic."
	icon_state = "soulstonebelt"
	item_state = "soulstonebelt"
	storage_slots = 6
	can_hold = list(
		/obj/item/weapon/gun/magic/wand
		)

/obj/item/weapon/storage/belt/wands/full/New()
	..()
	new /obj/item/weapon/gun/magic/wand/death(src)
	new /obj/item/weapon/gun/magic/wand/resurrection(src)
	new /obj/item/weapon/gun/magic/wand/polymorph(src)
	new /obj/item/weapon/gun/magic/wand/teleport(src)
	new /obj/item/weapon/gun/magic/wand/door(src)
	new /obj/item/weapon/gun/magic/wand/fireball(src)

	for(var/obj/item/weapon/gun/magic/wand/W in contents) //All wands in this pack come in the best possible condition
		W.max_charges = initial(W.max_charges)
		W.charges = W.max_charges

/obj/item/weapon/storage/belt/janitor
	name = "janibelt"
	desc = "A belt used to hold most janitorial supplies."
	icon_state = "janibelt"
	item_state = "janibelt"
	storage_slots = 6
	max_w_class = WEIGHT_CLASS_BULKY // Set to this so the  light replacer can fit.
	can_hold = list(
		/obj/item/weapon/grenade/chem_grenade,
		/obj/item/device/lightreplacer,
		/obj/item/device/flashlight,
		/obj/item/weapon/reagent_containers/spray,
		/obj/item/weapon/soap,
		/obj/item/weapon/holosign_creator,
		/obj/item/key/janitor,
		/obj/item/clothing/gloves
		)

/obj/item/weapon/storage/belt/bandolier
	name = "bandolier"
	desc = "A bandolier for holding shotgun ammunition."
	icon_state = "bandolier"
	item_state = "bandolier"
	storage_slots = 18
	can_hold = list(
		/obj/item/ammo_casing/shotgun
		)

/obj/item/weapon/storage/belt/eldritchbelt
	name = "Belt of The Skinless One"
	desc = "A complex and otherworldly fabric of seemingly endless storage space woven into a grandiose sash for discreetly holding various objects."
	icon_state = "eldritchbelt"
	item_state = "eldritchbelt"
	storage_slots = 14
	max_w_class = WEIGHT_CLASS_HUGE
	max_combined_w_class = 40
	can_hold = list(
		/obj/item/weapon/khopesh,
		/obj/item/weapon/restraints/handcuffs,
		/obj/item/weapon/throwingknife,
		/obj/item/weapon/restraints/legcuffs/bola/tribal,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/eldritchbelt/full/New()
	..()
	new /obj/item/weapon/restraints/legcuffs/bola/tribal(src)
	new /obj/item/weapon/restraints/legcuffs/bola/tribal(src)
	new /obj/item/weapon/restraints/legcuffs/bola/tribal(src)
	new /obj/item/weapon/restraints/legcuffs/bola/tribal(src)
	new /obj/item/weapon/restraints/legcuffs/bola/tribal(src)
	new /obj/item/weapon/throwingknife(src)
	new /obj/item/weapon/throwingknife(src)
	new /obj/item/weapon/throwingknife(src)
	new /obj/item/weapon/throwingknife(src)
	new /obj/item/weapon/throwingknife(src)
	new /obj/item/weapon/restraints/handcuffs(src)
	new /obj/item/weapon/restraints/handcuffs(src)
	new /obj/item/weapon/khopesh(src)
	new /obj/item/weapon/khopesh(src)

/obj/item/weapon/storage/belt/igonbelt
	name = "Sheath"
	desc = "Holds a sword and a few pockets for spare equipment. It's made out of fine leather, though is worn through many years of use."
	icon_state = "igonbelt"
	item_state = "igonbelt"
	storage_slots = 5
	max_w_class = WEIGHT_CLASS_HUGE
	max_combined_w_class = 40
	can_hold = list(
		/obj/item/weapon/igonsword,
		/obj/item/weapon/restraints/legcuffs/bola/tribal,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/igonbelt/full/New()
	..()
	new /obj/item/weapon/restraints/legcuffs/bola/tribal(src)
	new /obj/item/weapon/restraints/legcuffs/bola/tribal(src)
	new /obj/item/weapon/restraints/legcuffs/bola/tribal(src)
	new /obj/item/weapon/restraints/legcuffs/bola/tribal(src)
	new /obj/item/weapon/igonsword(src)

/obj/item/weapon/storage/belt/mikebelt
	name = "Military belt"
	desc = "A dated 80's era military belt containing various surprises to it's wearer, possibly even a small firearm. Seems oddly cajun."
	icon_state = "mikebelt"
	item_state = "mikebelt"
	storage_slots = 21
	max_w_class = WEIGHT_CLASS_HUGE
	max_combined_w_class = 40
	can_hold = list(
		/obj/item/weapon/grenade/flashbang,
		/obj/item/weapon/restraints/handcuffs,
		/obj/item/weapon/throwingknife,
		/obj/item/ammo_box/magazine/c32,
		/obj/item/weapon/gun/ballistic/automatic/pistol/model1910,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/mikebelt/full/New()
	..()
	new /obj/item/weapon/restraints/handcuffs(src)
	new /obj/item/weapon/restraints/handcuffs(src)
	new /obj/item/weapon/restraints/handcuffs(src)
	new /obj/item/weapon/restraints/handcuffs(src)
	new /obj/item/weapon/grenade/flashbang(src)
	new /obj/item/weapon/grenade/flashbang(src)
	new /obj/item/weapon/grenade/flashbang(src)
	new /obj/item/weapon/grenade/flashbang(src)
	new /obj/item/weapon/throwingknife(src)
	new /obj/item/weapon/throwingknife(src)
	new /obj/item/weapon/throwingknife(src)
	new /obj/item/weapon/throwingknife(src)
	new /obj/item/weapon/throwingknife(src)
	new /obj/item/weapon/throwingknife(src)
	new /obj/item/ammo_box/magazine/c32(src)
	new /obj/item/ammo_box/magazine/c32(src)
	new /obj/item/ammo_box/magazine/c32(src)
	new /obj/item/ammo_box/magazine/c32(src)
	new /obj/item/ammo_box/magazine/c32(src)
	new /obj/item/ammo_box/magazine/c32(src)
	new /obj/item/weapon/gun/ballistic/automatic/pistol/model1910(src)

/obj/item/weapon/storage/belt/holster
	name = "shoulder holster"
	desc = "A holster to carry a handgun and ammo. WARNING: Badasses only."
	icon_state = "holster"
	item_state = "holster"
	storage_slots = 3
	max_w_class = WEIGHT_CLASS_NORMAL
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/rolandholster
	name = "Gunslinger's holster"
	desc = "A holster that is probably older than the person eyeing it, but as old as the person carrying it. It seems to have several intricate pouches sewn to it's belt to allow the toting of up to six reloads, in addition to the very large weapon itself."
	icon_state = "rolandholster"
	item_state = "rolandholster"
	storage_slots = 7
	max_w_class = WEIGHT_CLASS_HUGE
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/rolandholster/full/New()
	..()
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/weapon/gun/ballistic/revolver/sandalwood(src)

/obj/item/weapon/storage/belt/rolandholsters
	name = "Gunslinger's holsters"
	desc = "Holsters that are probably older than the person eyeing them, but as old as the person carrying them. They seem to have several intricate pouches sewn to their belt to allow the toting of up to twelve reloads, in addition to the very large weapons themselves."
	icon_state = "rolandholsters"
	item_state = "rolandholsters"
	storage_slots = 14
	max_w_class = WEIGHT_CLASS_HUGE
	max_combined_w_class = 40
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/rolandholsters/full/New()
	..()
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/weapon/gun/ballistic/revolver/sandalwood(src)
	new /obj/item/weapon/gun/ballistic/revolver/sandalwood(src)

/obj/item/weapon/storage/belt/liquidholsters
	name = "Vaquero holsters"
	desc = "Holsters that are probably older than the person eyeing them, but as old as the person carrying them. They seem to have several intricate pouches sewn to their belt to allow the toting of up to five reloads, in addition to the very large weapons themselves."
	icon_state = "liquidholsters"
	item_state = "liquidholsters"
	storage_slots = 14
	max_w_class = WEIGHT_CLASS_HUGE
	max_combined_w_class = 40
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/liquidholsters/full/New()
	..()
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/weapon/gun/ballistic/revolver/liquidsequoia(src)
	new /obj/item/weapon/gun/ballistic/revolver/liquidsequoia(src)

/obj/item/weapon/storage/belt/bespinbelt
	name = "Gun belt"
	desc = "A standard tanned leather belt accompanied by a drop leg holster with a strap to hold it securely around the wearer's left thigh. The holster itself seems to be flexible enough to accomodate a revolver or semi-automatic pistol."
	icon_state = "bespinbelt"
	item_state = "bespinbelt"
	storage_slots = 4
	max_w_class = WEIGHT_CLASS_HUGE
	max_combined_w_class = 40
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/ammo_box,
		/obj/item/weapon/melee/energy/sword/saber,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/bespinbelt/full/New()
	..()
	new /obj/item/ammo_box/magazine/mauser(src)
	new /obj/item/ammo_box/magazine/mauser(src)
	new /obj/item/weapon/gun/ballistic/automatic/pistol/mauser(src)
	new /obj/item/weapon/melee/energy/sword/saber/blue(src)

/obj/item/weapon/storage/belt/gatholsters
	name = "Saint's holsters"
	desc = "Holsters that are worth more than the greedy bastard likely hoping to loot them, and carrying not only two massive hand-cannons, but several spare magazines on it's belt. Why's everyone think they can fuck with the Saints? Don't they know anything?"
	icon_state = "gatholsters"
	item_state = "gatholsters"
	storage_slots = 14
	max_w_class = WEIGHT_CLASS_HUGE
	max_combined_w_class = 40
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/gatholsters/full/New()
	..()
	new /obj/item/ammo_box/magazine/m440/bleed(src)
	new /obj/item/ammo_box/magazine/m440/bleed(src)
	new /obj/item/ammo_box/magazine/m440/bleed(src)
	new /obj/item/ammo_box/magazine/m440/bleed(src)
	new /obj/item/ammo_box/magazine/m440/bleed(src)
	new /obj/item/ammo_box/magazine/m440/bleed(src)
	new /obj/item/ammo_box/magazine/m440/bleed(src)
	new /obj/item/ammo_box/magazine/m440/bleed(src)
	new /obj/item/ammo_box/magazine/m440/bleed(src)
	new /obj/item/ammo_box/magazine/m440/bleed(src)
	new /obj/item/ammo_box/magazine/m440/bleed(src)
	new /obj/item/ammo_box/magazine/m440/bleed(src)
	new /obj/item/weapon/gun/ballistic/automatic/pistol/gatdeagle(src)
	new /obj/item/weapon/gun/ballistic/automatic/pistol/gatdeagle(src)

/obj/item/weapon/storage/belt/praiseholsters
	name = "Surplus holsters"
	desc = "What seem to be a pair of leftover WW-II era handgun holsters, with several spare magazine pouches integrated on the opposite sides for the toting of several reloads."
	icon_state = "praiseholsters"
	item_state = "praiseholsters"
	storage_slots = 14
	max_w_class = WEIGHT_CLASS_HUGE
	max_combined_w_class = 40
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/praiseholsters/full/New()
	..()
	new /obj/item/ammo_box/magazine/steyrmag(src)
	new /obj/item/ammo_box/magazine/steyrmag(src)
	new /obj/item/ammo_box/magazine/steyrmag(src)
	new /obj/item/ammo_box/magazine/steyrmag(src)
	new /obj/item/ammo_box/magazine/steyrmag(src)
	new /obj/item/ammo_box/magazine/steyrmag(src)
	new /obj/item/ammo_box/magazine/steyrmag(src)
	new /obj/item/ammo_box/magazine/steyrmag(src)
	new /obj/item/ammo_box/magazine/steyrmag(src)
	new /obj/item/ammo_box/magazine/steyrmag(src)
	new /obj/item/ammo_box/magazine/steyrmag(src)
	new /obj/item/ammo_box/magazine/steyrmag(src)
	new /obj/item/weapon/gun/ballistic/automatic/pistol/sm1912(src)
	new /obj/item/weapon/gun/ballistic/automatic/pistol/sm1912(src)

/obj/item/weapon/storage/belt/gunslingerholsters
	name = "Gunslinger's holsters"
	desc = "Holsters that are probably older than the person eyeing them, but as old as the person carrying them. They seem to have several intricate pouches sewn to their belt to allow the toting of up to five reloads, in addition to the very large weapons themselves."
	icon_state = "gunslingerholsters"
	item_state = "gunslingerholsters"
	storage_slots = 14
	max_w_class = WEIGHT_CLASS_HUGE
	max_combined_w_class = 40
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/gunslingerholsters/full/New()
	..()
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/weapon/gun/ballistic/revolver/sandalwood(src)
	new /obj/item/weapon/gun/ballistic/revolver/sandalwood(src)

/obj/item/weapon/storage/belt/rolandholstersremake
	name = "Gunslinger's holsters"
	desc = "Holsters that are probably older than the person eyeing them, but as old as the person carrying them. They seem to have several intricate pouches sewn to their belt to allow the toting of up to five reloads, in addition to the very large weapons themselves."
	icon_state = "rolandholsters"
	item_state = "rolandholsters"
	storage_slots = 14
	max_w_class = WEIGHT_CLASS_HUGE
	max_combined_w_class = 40
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/rolandholstersremake/full/New()
	..()
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/ammo_box/sandalwoodcylinder(src)
	new /obj/item/weapon/gun/ballistic/revolver/sandalwood(src)
	new /obj/item/weapon/gun/ballistic/revolver/sandalwood(src)

/obj/item/weapon/storage/belt/rolandholsterstwo
	name = "Gunslinger's holsters"
	desc = "Holsters that are probably older than the person eyeing them, but as old as the person carrying them. They seem to have several intricate pouches sewn to their belt to allow the toting of up to five reloads, in addition to the very large weapons themselves."
	icon_state = "rolandholsters"
	item_state = "rolandholsters"
	storage_slots = 14
	max_w_class = WEIGHT_CLASS_HUGE
	max_combined_w_class = 40
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/rolandholsterstwo/full/New()
	..()
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/weapon/gun/ballistic/revolver/sandalwood(src)
	new /obj/item/weapon/gun/ballistic/revolver/sandalwood(src)

/obj/item/weapon/storage/belt/rolandholstertwo
	name = "Gunslinger's holster"
	desc = "A holster that is probably older than the person eyeing it, but as old as the person carrying it. It seems to have several intricate pouches sewn to it's belt to allow the toting of up to six reloads, in addition to the very large weapon itself."
	icon_state = "rolandholster"
	item_state = "rolandholster"
	storage_slots = 7
	max_w_class = WEIGHT_CLASS_HUGE
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/rolandholstertwo/full/New()
	..()
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/ammo_box/a45colt(src)
	new /obj/item/weapon/gun/ballistic/revolver/sandalwood(src)

/obj/item/weapon/storage/belt/ingoholster
	name = "Wastelander's holster"
	desc = "A holster sewn roughly from classy black leather, but gives off a very eerie and menacing vibe due to the large revolver it carries. Seems to have speedloaders attached to the belt, for quick access."
	icon_state = "praiseholster"
	item_state = "praiseholster"
	storage_slots = 7
	max_w_class = WEIGHT_CLASS_HUGE
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/ingoholster/full/New()
	..()
	new /obj/item/ammo_box/a500luke(src)
	new /obj/item/ammo_box/a500luke(src)
	new /obj/item/ammo_box/a500luke(src)
	new /obj/item/ammo_box/a500luke(src)
	new /obj/item/ammo_box/a500luke(src)
	new /obj/item/ammo_box/a500luke(src)
	new /obj/item/weapon/gun/ballistic/revolver/luke(src)

/obj/item/weapon/storage/belt/johncowboyholster
	name = "Desperado's holster"
	desc = "A holster crafted from generic tanned leather, albeit it is unique in the fact it has six loops for spare cartridges sewn along the belt rather than speedloaders."
	icon_state = "johncowboyholster"
	item_state = "johncowboyholster"
	storage_slots = 14
	max_w_class = WEIGHT_CLASS_HUGE
	max_combined_w_class = 40
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/ammo_casing,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/johncowboyholster/full/New()
	..()
	new /obj/item/ammo_casing/a357(src)
	new /obj/item/ammo_casing/a357(src)
	new /obj/item/ammo_casing/a357(src)
	new /obj/item/ammo_casing/a357(src)
	new /obj/item/ammo_casing/a357(src)
	new /obj/item/ammo_casing/a357(src)
	new /obj/item/ammo_casing/a357(src)
	new /obj/item/ammo_casing/a357(src)
	new /obj/item/ammo_casing/a357(src)
	new /obj/item/ammo_casing/a357(src)
	new /obj/item/ammo_casing/a357(src)
	new /obj/item/ammo_casing/a357(src)
	new /obj/item/ammo_casing/a357(src)
	new /obj/item/weapon/gun/ballistic/revolver/coltsaa(src)

/obj/item/weapon/storage/belt/loomisholster
	name = "Shoulder holster"
	desc = "A classic shoulder holster meant for carrying a concealed firearm, presumably a revolver judging by the three identical speedloader pouches sewn under the right side of it."
	icon_state = "loomisholster"
	item_state = "loomisholster"
	storage_slots = 4
	max_w_class = WEIGHT_CLASS_HUGE
	max_combined_w_class = 40
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/loomisholster/full/New()
	..()
	new /obj/item/ammo_box/c38(src)
	new /obj/item/ammo_box/c38(src)
	new /obj/item/ammo_box/c38(src)
	new /obj/item/weapon/gun/ballistic/revolver/model15(src)

/obj/item/weapon/storage/belt/cruzholster
	name = "Shoulder holster"
	desc = "A classic shoulder holster meant for carrying a concealed firearm, presumably a semi-automatic pistol judging by the three identical magazine pouches sewn under the right side of it."
	icon_state = "loomisholster"
	item_state = "loomisholster"
	storage_slots = 4
	max_w_class = WEIGHT_CLASS_HUGE
	max_combined_w_class = 40
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/cruzholster/full/New()
	..()
	new /obj/item/ammo_box/magazine/luger(src)
	new /obj/item/ammo_box/magazine/luger(src)
	new /obj/item/ammo_box/magazine/luger(src)
	new /obj/item/weapon/gun/ballistic/automatic/pistol/p38(src)

/obj/item/weapon/storage/belt/leonholster
	name = "Shoulder holster"
	desc = "A classic shoulder holster meant for carrying a concealed firearm, presumably a semi-automatic pistol judging by the three identical magazine pouches sewn under the right side of it."
	icon_state = "loomisholster"
	item_state = "loomisholster"
	storage_slots = 4
	max_w_class = WEIGHT_CLASS_HUGE
	max_combined_w_class = 40
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/leonholster/full/New()
	..()
	new /obj/item/ammo_box/magazine/silverghostmag(src)
	new /obj/item/ammo_box/magazine/silverghostmag(src)
	new /obj/item/ammo_box/magazine/silverghostmag(src)
	new /obj/item/weapon/gun/ballistic/automatic/pistol/silverghostscope(src)

/obj/item/weapon/storage/belt/stokerholster
	name = "Shoulder holster"
	desc = "A classic shoulder holster meant for carrying a concealed firearm, presumably a semi-automatic pistol judging by the three identical magazine pouches sewn under the right side of it."
	icon_state = "loomisholster"
	item_state = "loomisholster"
	storage_slots = 4
	max_w_class = WEIGHT_CLASS_HUGE
	max_combined_w_class = 40
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/stokerholster/full/New()
	..()
	new /obj/item/ammo_box/magazine/browning(src)
	new /obj/item/ammo_box/magazine/browning(src)
	new /obj/item/ammo_box/magazine/browning(src)
	new /obj/item/weapon/gun/ballistic/automatic/pistol/stoker9mm(src)

/obj/item/weapon/storage/belt/belmontbelt
	name = "Belt"
	desc = "What seems to be a basic black leather belt bearing a holster of the same material meant for an average sized revolver and configured to be drawn with the user's right hand. On the opposite side a fairly large leather pouch is affixed to the hip, presumably for holding spare ammunition. Near the small of the back there's a small leather loop with closing snaps, perhaps for holding a lasso or whip of some kind in typical western fashion."
	icon_state = "belmontbelt"
	item_state = "belmontbelt"
	storage_slots = 5
	max_w_class = WEIGHT_CLASS_HUGE
	max_combined_w_class = 40
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/weapon/melee/classic_baton/truevampirekiller,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/belmontbelt/full/New()
	..()
	new /obj/item/ammo_box/a44spl(src)
	new /obj/item/ammo_box/c45(src)
	new /obj/item/ammo_box/c45(src)
	new /obj/item/weapon/gun/ballistic/revolver/stoker1917(src)
	new /obj/item/weapon/melee/classic_baton/truevampirekiller(src)

/obj/item/weapon/storage/belt/zimholster
	name = "Shoulder holster"
	desc = "A classic shoulder holster meant for carrying a concealed firearm, presumably a semi-automatic pistol judging by the four identical magazine pouches sewn under the right side of it."
	icon_state = "loomisholster"
	item_state = "loomisholster"
	storage_slots = 5
	max_w_class = WEIGHT_CLASS_HUGE
	max_combined_w_class = 40
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/zimholster/full/New()
	..()
	new /obj/item/ammo_box/magazine/luger(src)
	new /obj/item/ammo_box/magazine/luger(src)
	new /obj/item/ammo_box/magazine/luger(src)
	new /obj/item/ammo_box/magazine/luger(src)
	new /obj/item/weapon/gun/ballistic/automatic/pistol/lugerzim(src)

/obj/item/weapon/storage/belt/wolfholster
	name = "Shoulder holster"
	desc = "A classic shoulder holster meant for carrying a concealed firearm, presumably a large revolver judging by the three identical speedloader pouches sewn under the right side of it."
	icon_state = "wolfholster"
	item_state = "wolfholster"
	storage_slots = 4
	max_w_class = WEIGHT_CLASS_HUGE
	max_combined_w_class = 40
	can_hold = list(
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/wolfholster/full/New()
	..()
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/weapon/gun/ballistic/revolver/model29(src)

/obj/item/weapon/storage/belt/loomisholsteralt
	name = "Shoulder holster"
	desc = "A classic shoulder holster meant for carrying a concealed firearm, presumably an automatic pistol judging by the three identical magazine pouches sewn under the right side of it."
	icon_state = "loomisholster"
	item_state = "loomisholster"
	storage_slots = 4
	max_w_class = WEIGHT_CLASS_HUGE
	max_combined_w_class = 40
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/loomisholsteralt/full/New()
	..()
	new /obj/item/ammo_box/magazine/smith(src)
	new /obj/item/ammo_box/magazine/smith(src)
	new /obj/item/ammo_box/magazine/smith(src)
	new /obj/item/weapon/gun/ballistic/automatic/pistol/briner639(src)

/obj/item/weapon/storage/belt/johnholster
	name = "Desert Ranger's holster"
	desc = "A holster sewn from high-grade dyed brown leather and accompanied by a professional kydex gun belt. Seems to have speedloaders attached to the belt, for quick access."
	icon_state = "johnholster"
	item_state = "johnholster"
	storage_slots = 7
	max_w_class = WEIGHT_CLASS_HUGE
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/johnholster/full/New()
	..()
	new /obj/item/ammo_box/a357(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/weapon/gun/ballistic/revolver/johnpython(src)

/obj/item/weapon/storage/belt/legionbelt
	name = "Legionnaire's belt"
	desc = "A roughly crafted belt fashioned from both hide and cloth, capable of storing various weapons and tools for use by Caesar's Legion."
	icon_state = "legionbelt"
	item_state = "legionbelt"
	storage_slots = 14
	w_class = WEIGHT_CLASS_BULKY
	max_w_class = WEIGHT_CLASS_BULKY
	max_combined_w_class = 50
	can_hold = list(
		/obj/item/weapon/restraints/legcuffs/bola,
		/obj/item/weapon/restraints/handcuffs,
		/obj/item/weapon/kitchen/knife,
		/obj/item/weapon/machetem,
		/obj/item/weapon/machete,
		/obj/item/ammo_box,
		/obj/item/weapon/melee/bullwhip,
		/obj/item/device/flashlight/torch,
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/weapon/reagent_containers/pill/patch,
		/obj/item/weapon/bowie,
		/obj/item/weapon/trench,
		/obj/item/weapon/reknife,
		/obj/item/weapon/bumpersword,
		)

/obj/item/weapon/storage/belt/legionbelt/full/New()
	..()
	new /obj/item/weapon/restraints/legcuffs/bola/tribal(src)
	new /obj/item/weapon/restraints/legcuffs/bola/tribal(src)
	new /obj/item/weapon/restraints/legcuffs/bola/tribal(src)
	new /obj/item/weapon/restraints/handcuffs/cable/zipties(src)
	new /obj/item/weapon/restraints/handcuffs/cable/zipties(src)
	new /obj/item/weapon/restraints/handcuffs/cable/zipties(src)
	new /obj/item/weapon/machetem(src)
	new /obj/item/weapon/reagent_containers/pill/patch/healingpowder(src)
	new /obj/item/weapon/reagent_containers/pill/patch/healingpowder(src)
	new /obj/item/weapon/reagent_containers/pill/patch/healingpowder(src)
	new /obj/item/device/flashlight/torch(src)
	new /obj/item/ammo_box/magazine/luger(src)
	new /obj/item/ammo_box/magazine/luger(src)
	new /obj/item/weapon/gun/ballistic/automatic/pistol/luger(src)

/obj/item/weapon/storage/belt/jakeholster
	name = "Makeshift holster"
	desc = "A very raggedy looking holster presumably created from scraps of leather and sisal rope, and crafted to accommodate a large revolver. Seems to have speedloader pouches attached to the belt, for quick access."
	icon_state = "jakeholster"
	item_state = "jakeholster"
	storage_slots = 7
	max_w_class = WEIGHT_CLASS_HUGE
	can_hold = list(
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/jakeholster/full/New()
	..()
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/weapon/gun/ballistic/revolver/ruger(src)

/obj/item/weapon/storage/belt/luckyholster
	name = "Fancy holster"
	desc = "A holster made from dyed high-grade Casino leather, made to hold a large revolver. Seems to have speedloader pouches attached to the belt, for quick access."
	icon_state = "luckyholster"
	item_state = "luckyholster"
	storage_slots = 7
	max_w_class = WEIGHT_CLASS_HUGE
	can_hold = list(
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/luckyholster/full/New()
	..()
	new /obj/item/ammo_box/a500(src)
	new /obj/item/ammo_box/a500(src)
	new /obj/item/ammo_box/a500(src)
	new /obj/item/ammo_box/a500(src)
	new /obj/item/ammo_box/a500(src)
	new /obj/item/ammo_box/a500(src)
	new /obj/item/weapon/gun/ballistic/revolver/lucky(src)

/obj/item/weapon/storage/belt/rochellholster
	name = "Raider holster"
	desc = "A surprisingly well made Raider holster made from dyed black leather, fit to accommodate a full sized semi-automatic pistol. Seems to have spare magazine pouches attached to the belt, for quick access."
	icon_state = "rochellholster"
	item_state = "rochellholster"
	storage_slots = 7
	max_w_class = WEIGHT_CLASS_HUGE
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/rochellholster/full/New()
	..()
	new /obj/item/ammo_box/magazine/mp443(src)
	new /obj/item/ammo_box/magazine/mp443(src)
	new /obj/item/ammo_box/magazine/mp443(src)
	new /obj/item/ammo_box/magazine/mp443(src)
	new /obj/item/ammo_box/magazine/mp443(src)
	new /obj/item/ammo_box/magazine/mp443(src)

/obj/item/weapon/storage/belt/terminatorholster
	name = "Black holster"
	desc = "A well crafted holster made from dyed black leather, fit to accommodate a semi-automatic pistol. Seems to have spare magazine pouches attached to the belt, for quick access."
	icon_state = "terminatorholster"
	item_state = "terminatorholster"
	storage_slots = 7
	max_w_class = WEIGHT_CLASS_HUGE
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/terminatorholster/full/New()
	..()
	new /obj/item/ammo_box/magazine/m45(src)
	new /obj/item/ammo_box/magazine/m45(src)
	new /obj/item/ammo_box/magazine/m45(src)
	new /obj/item/ammo_box/magazine/m45(src)
	new /obj/item/ammo_box/magazine/m45(src)
	new /obj/item/ammo_box/magazine/m45(src)
	new /obj/item/weapon/gun/ballistic/automatic/pistol/longslide(src)

/obj/item/weapon/storage/belt/reholster
	name = "Surplus holster"
	desc = "A well crafted holster made from standard brown leather, fit to accommodate a semi-automatic pistol or revolver alike. Seems to have pouches to accomodate magazines or speedloaders attached to the belt, for quick access."
	icon_state = "reholster"
	item_state = "reholster"
	storage_slots = 7
	max_w_class = WEIGHT_CLASS_HUGE
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/reholster/full/New()
	..()
	new /obj/item/ammo_box/magazine/vp70(src)
	new /obj/item/ammo_box/magazine/vp70(src)
	new /obj/item/ammo_box/magazine/vp70(src)
	new /obj/item/ammo_box/magazine/vp70(src)
	new /obj/item/ammo_box/magazine/vp70(src)
	new /obj/item/ammo_box/magazine/vp70(src)
	new /obj/item/weapon/gun/ballistic/automatic/pistol/vp70(src)

/obj/item/weapon/storage/belt/hunterholster
	name = "Black holster"
	desc = "A well crafted holster made from dyed black leather, fit to accommodate a semi-automatic pistol. Seems to have spare magazine pouches attached to the belt, for quick access."
	icon_state = "terminatorholster"
	item_state = "terminatorholster"
	storage_slots = 7
	max_w_class = WEIGHT_CLASS_HUGE
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/hunterholster/full/New()
	..()
	new /obj/item/ammo_box/magazine/m45(src)
	new /obj/item/ammo_box/magazine/m45(src)
	new /obj/item/ammo_box/magazine/m45(src)
	new /obj/item/ammo_box/magazine/m45(src)
	new /obj/item/ammo_box/magazine/m45(src)
	new /obj/item/ammo_box/magazine/m45(src)
	new /obj/item/weapon/gun/ballistic/automatic/pistol/mike1911(src)

/obj/item/weapon/storage/belt/wolfwoodholster
	name = "Black holsters"
	desc = "A pair of well crafted holsters made from dyed black leather, fit to accommodate two .45 caliber pistols or guns of similar size. Seems to have spare magazine pouches on the opposite sides."
	icon_state = "wolfwoodholsters"
	item_state = "wolfwoodholsters"
	storage_slots = 7
	max_w_class = WEIGHT_CLASS_HUGE
	can_hold = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol,
		/obj/item/weapon/gun/ballistic/revolver,
		/obj/item/ammo_box,
		)
	alternate_worn_layer = UNDER_SUIT_LAYER

/obj/item/weapon/storage/belt/wolfwoodholster/full/New()
	..()
	new /obj/item/ammo_box/magazine/m45(src)
	new /obj/item/ammo_box/magazine/m45(src)
	new /obj/item/ammo_box/magazine/m45(src)
	new /obj/item/ammo_box/magazine/m45(src)
	new /obj/item/ammo_box/magazine/m45(src)
	new /obj/item/weapon/gun/ballistic/automatic/pistol/grader(src)
	new /obj/item/weapon/gun/ballistic/automatic/pistol/grader(src)

/obj/item/weapon/storage/belt/fannypack
	name = "fannypack"
	desc = "A dorky fannypack for keeping small items in."
	icon_state = "fannypack_leather"
	item_state = "fannypack_leather"
	storage_slots = 3
	max_w_class = WEIGHT_CLASS_SMALL

/obj/item/weapon/storage/belt/fannypack/black
	name = "black fannypack"
	icon_state = "fannypack_black"
	item_state = "fannypack_black"

/obj/item/weapon/storage/belt/fannypack/red
	name = "red fannypack"
	icon_state = "fannypack_red"
	item_state = "fannypack_red"

/obj/item/weapon/storage/belt/fannypack/purple
	name = "purple fannypack"
	icon_state = "fannypack_purple"
	item_state = "fannypack_purple"

/obj/item/weapon/storage/belt/fannypack/blue
	name = "blue fannypack"
	icon_state = "fannypack_blue"
	item_state = "fannypack_blue"

/obj/item/weapon/storage/belt/fannypack/orange
	name = "orange fannypack"
	icon_state = "fannypack_orange"
	item_state = "fannypack_orange"

/obj/item/weapon/storage/belt/fannypack/white
	name = "white fannypack"
	icon_state = "fannypack_white"
	item_state = "fannypack_white"

/obj/item/weapon/storage/belt/fannypack/green
	name = "green fannypack"
	icon_state = "fannypack_green"
	item_state = "fannypack_green"

/obj/item/weapon/storage/belt/fannypack/pink
	name = "pink fannypack"
	icon_state = "fannypack_pink"
	item_state = "fannypack_pink"

/obj/item/weapon/storage/belt/fannypack/cyan
	name = "cyan fannypack"
	icon_state = "fannypack_cyan"
	item_state = "fannypack_cyan"

/obj/item/weapon/storage/belt/fannypack/yellow
	name = "yellow fannypack"
	icon_state = "fannypack_yellow"
	item_state = "fannypack_yellow"

/obj/item/weapon/storage/belt/sabre
	name = "sabre sheath"
	desc = "An ornate sheath designed to hold an officer's blade."
	icon_state = "sheath"
	item_state = "sheath"
	storage_slots = 1
	w_class = WEIGHT_CLASS_BULKY
	max_w_class = WEIGHT_CLASS_BULKY
	can_hold = list(
		/obj/item/weapon/melee/sabre
		)

/obj/item/weapon/storage/belt/sabre/examine(mob/user)
	..()
	if(contents.len)
		to_chat(user, "<span class='notice'>Alt-click it to quickly draw the blade.</span>")

/obj/item/weapon/storage/belt/sabre/AltClick(mob/user)
	if(!ishuman(user) || !user.canUseTopic(src, be_close=TRUE))
		return
	if(contents.len)
		var/obj/item/I = contents[1]
		user.visible_message("[user] takes [I] out of [src].", "<span class='notice'>You take [I] out of [src].</span>",\
		)
		user.put_in_hands(I)
		update_icon()
	else
		to_chat(user, "[src] is empty.")

/obj/item/weapon/storage/belt/sabre/update_icon()
	icon_state = "sheath"
	item_state = "sheath"
	if(contents.len)
		icon_state += "-sabre"
		item_state += "-sabre"
	if(loc && isliving(loc))
		var/mob/living/L = loc
		L.regenerate_icons()
	..()


/obj/item/weapon/storage/belt/sabre/New()
	..()
	new /obj/item/weapon/melee/sabre(src)
	update_icon()

/obj/item/weapon/storage/belt/military/sullybelt
	name = "Dark Leather Belt"
	desc = "This belt contains pouches on the rear, and a strange emblem on the front"
	icon_state = "sullybelt"
	item_state = "sullybelt"