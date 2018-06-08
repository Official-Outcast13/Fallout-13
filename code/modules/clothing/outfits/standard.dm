/datum/outfit/space
	name = "Standard Space Gear"

	uniform = /obj/item/clothing/under/color/grey
	shoes = /obj/item/clothing/shoes/sneakers/black
	suit = /obj/item/clothing/suit/space
	head = /obj/item/clothing/head/helmet/space
	back = /obj/item/weapon/tank/jetpack/oxygen
	mask = /obj/item/clothing/mask/breath

/datum/outfit/tournament
	name = "tournament standard red"

	uniform = /obj/item/clothing/under/color/red
	shoes = /obj/item/clothing/shoes/sneakers/black
	suit = /obj/item/clothing/suit/armor/vest
	head = /obj/item/clothing/head/helmet/thunderdome
	r_hand = /obj/item/weapon/gun/energy/pulse/destroyer
	l_hand = /obj/item/weapon/kitchen/knife
	r_pocket = /obj/item/weapon/grenade/smokebomb

/datum/outfit/tournament/green
	name = "tournament standard green"

	uniform = /obj/item/clothing/under/color/green

/datum/outfit/tournament/gangster
	name = "tournament gangster"

	uniform = /obj/item/clothing/under/rank/det
	suit = /obj/item/clothing/suit/det_suit
	glasses = /obj/item/clothing/glasses/thermal/monocle
	head = /obj/item/clothing/head/det_hat
	r_hand = /obj/item/weapon/gun/ballistic
	l_hand = null
	r_pocket = /obj/item/ammo_box/c10mm

/datum/outfit/tournament/janitor
	name = "tournament janitor"

	uniform = /obj/item/clothing/under/rank/janitor
	back = /obj/item/weapon/storage/backpack
	suit = null
	head = null
	r_hand = /obj/item/weapon/mop
	l_hand = /obj/item/weapon/reagent_containers/glass/bucket
	r_pocket = /obj/item/weapon/grenade/chem_grenade/cleaner
	l_pocket = /obj/item/weapon/grenade/chem_grenade/cleaner
	backpack_contents = list(/obj/item/stack/tile/plasteel=6)

/datum/outfit/tournament/janitor/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/weapon/reagent_containers/glass/bucket/bucket = H.get_item_for_held_index(1)
	bucket.reagents.add_reagent("water",70)

/datum/outfit/laser_tag
	name = "Laser Tag Red"

	uniform = /obj/item/clothing/under/color/red
	shoes = /obj/item/clothing/shoes/sneakers/red
	head = /obj/item/clothing/head/helmet/redtaghelm
	gloves = /obj/item/clothing/gloves/color/red
	ears = /obj/item/device/radio/headset
	suit = /obj/item/clothing/suit/redtag
	back = /obj/item/weapon/storage/backpack
	suit_store = /obj/item/weapon/gun/energy/laser/redtag
	backpack_contents = list(/obj/item/weapon/storage/box=1)

/datum/outfit/laser_tag/blue
	name = "Laser Tag Blue"
	uniform = /obj/item/clothing/under/color/blue
	shoes = /obj/item/clothing/shoes/sneakers/blue
	head = /obj/item/clothing/head/helmet/bluetaghelm
	gloves = /obj/item/clothing/gloves/color/blue
	suit = /obj/item/clothing/suit/bluetag
	suit_store = /obj/item/weapon/gun/energy/laser/bluetag

/datum/outfit/pirate
	name = "Pirate"

	uniform = /obj/item/clothing/under/pirate
	shoes = /obj/item/clothing/shoes/sneakers/brown
	head = /obj/item/clothing/head/bandana
	glasses = /obj/item/clothing/glasses/eyepatch
	r_hand = /obj/item/weapon/melee/energy/sword/pirate

/datum/outfit/pirate/space
	name = "Space Pirate"

	suit = /obj/item/clothing/suit/space/pirate
	head = /obj/item/clothing/head/helmet/space/pirate

/datum/outfit/tunnel_clown
	name = "Tunnel Clown"

	uniform = /obj/item/clothing/under/rank/clown
	shoes = /obj/item/clothing/shoes/clown_shoes
	gloves = /obj/item/clothing/gloves/color/black
	mask = /obj/item/clothing/mask/gas/clown_hat
	ears = /obj/item/device/radio/headset
	glasses = /obj/item/clothing/glasses/thermal/monocle
	suit = /obj/item/clothing/suit/hooded/chaplain_hoodie
	l_pocket = /obj/item/weapon/reagent_containers/food/snacks/grown/banana
	r_pocket = /obj/item/weapon/bikehorn
	id = /obj/item/weapon/card/id
	r_hand = /obj/item/weapon/twohanded/fireaxe

/datum/outfit/tunnel_clown/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/weapon/card/id/W = H.wear_id
	W.access = get_all_accesses()
	W.assignment = "Tunnel Clown!"
	W.registered_name = H.real_name
	W.update_label(H.real_name)

/datum/outfit/psycho
	name = "Masked Killer"

	uniform = /obj/item/clothing/under/overalls
	shoes = /obj/item/clothing/shoes/sneakers/white
	gloves = /obj/item/clothing/gloves/color/latex
	mask = /obj/item/clothing/mask/surgical
	head = /obj/item/clothing/head/welding
	ears = /obj/item/device/radio/headset
	glasses = /obj/item/clothing/glasses/thermal/monocle
	suit = /obj/item/clothing/suit/apron
	l_pocket = /obj/item/weapon/kitchen/knife
	r_pocket = /obj/item/weapon/scalpel
	r_hand = /obj/item/weapon/twohanded/fireaxe

/datum/outfit/psycho/post_equip(mob/living/carbon/human/H)
	for(var/obj/item/carried_item in H.get_equipped_items())
		carried_item.add_mob_blood(H)//Oh yes, there will be blood...
	for(var/obj/item/I in H.held_items)
		I.add_mob_blood(H)
	H.regenerate_icons()

/datum/outfit/assassin
	name = "Assassin"

	uniform = /obj/item/clothing/under/suit_jacket
	shoes = /obj/item/clothing/shoes/sneakers/black
	gloves = /obj/item/clothing/gloves/color/black
	ears = /obj/item/device/radio/headset
	glasses = /obj/item/clothing/glasses/sunglasses
	l_pocket = /obj/item/weapon/melee/energy/sword/saber
	l_hand = /obj/item/weapon/storage/secure/briefcase
	id = /obj/item/weapon/card/id/syndicate
	belt = /obj/item/device/pda/heads

/datum/outfit/assassin/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	var/obj/item/clothing/under/U = H.w_uniform
	U.attachTie(new /obj/item/clothing/tie/waistcoat(H))

	if(visualsOnly)
		return

	//Could use a type
	var/obj/item/weapon/storage/secure/briefcase/sec_briefcase = H.get_item_for_held_index(1)
	for(var/obj/item/briefcase_item in sec_briefcase)
		qdel(briefcase_item)
	for(var/i = 3 to 0 step -1)
		sec_briefcase.handle_item_insertion(new /obj/item/stack/spacecash/c1000,1)
	sec_briefcase.handle_item_insertion(new /obj/item/weapon/gun/energy/kinetic_accelerator/crossbow,1)
	sec_briefcase.handle_item_insertion(new /obj/item/weapon/gun/ballistic/revolver/mateba,1)
	sec_briefcase.handle_item_insertion(new /obj/item/ammo_box/a357,1)
	sec_briefcase.handle_item_insertion(new /obj/item/weapon/grenade/plastic/x4,1)

	var/obj/item/device/pda/heads/pda = H.belt
	pda.owner = H.real_name
	pda.ownjob = "Reaper"
	pda.update_label()

	var/obj/item/weapon/card/id/syndicate/W = H.wear_id
	W.access = get_all_accesses()
	W.assignment = "Reaper"
	W.registered_name = H.real_name
	W.update_label(H.real_name)

/datum/outfit/centcom_commander
	name = "Centcom Commander"

	uniform = /obj/item/clothing/under/rank/centcom_commander
	suit = /obj/item/clothing/suit/armor/bulletproof
	shoes = /obj/item/clothing/shoes/combat/swat
	gloves = /obj/item/clothing/gloves/combat
	ears = /obj/item/device/radio/headset/headset_cent/commander
	glasses = /obj/item/clothing/glasses/eyepatch
	mask = /obj/item/clothing/mask/cigarette/cigar/cohiba
	head = /obj/item/clothing/head/centhat
	belt = /obj/item/weapon/gun/ballistic/revolver/mateba
	r_pocket = /obj/item/weapon/lighter
	l_pocket = /obj/item/ammo_box/a357
	back = /obj/item/weapon/storage/backpack/satchel/leather
	id = /obj/item/weapon/card/id

/datum/outfit/centcom_commander/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/weapon/card/id/W = H.wear_id
	W.icon_state = "centcom"
	W.access = get_all_accesses()
	W.access += get_centcom_access("Centcom Commander")
	W.assignment = "Centcom Commander"
	W.registered_name = H.real_name
	W.update_label()

/datum/outfit/spec_ops
	name = "Special Ops Officer"

	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/space/officer
	shoes = /obj/item/clothing/shoes/combat/swat
	gloves = /obj/item/clothing/gloves/combat
	glasses = /obj/item/clothing/glasses/thermal/eyepatch
	ears = /obj/item/device/radio/headset/headset_cent/commander
	mask = /obj/item/clothing/mask/cigarette/cigar/havana
	head = /obj/item/clothing/head/helmet/space/beret
	belt = /obj/item/weapon/gun/energy/pulse/pistol/m1911
	r_pocket = /obj/item/weapon/lighter
	back = /obj/item/weapon/storage/backpack/satchel/leather
	id = /obj/item/weapon/card/id

/datum/outfit/spec_ops/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/weapon/card/id/W = H.wear_id
	W.icon_state = "centcom"
	W.access = get_all_accesses()
	W.access += get_centcom_access("Special Ops Officer")
	W.assignment = "Special Ops Officer"
	W.registered_name = H.real_name
	W.update_label()

	var/obj/item/device/radio/headset/R = H.ears
	R.set_frequency(CENTCOM_FREQ)
	R.freqlock = 1

/datum/outfit/wizard
	name = "Blue Wizard"

	uniform = /obj/item/clothing/under/color/lightpurple
	suit = /obj/item/clothing/suit/wizrobe
	shoes = /obj/item/clothing/shoes/sandal/magic
	ears = /obj/item/device/radio/headset
	head = /obj/item/clothing/head/wizard
	r_pocket = /obj/item/weapon/teleportation_scroll
	r_hand = /obj/item/weapon/spellbook
	l_hand = /obj/item/weapon/staff
	back = /obj/item/weapon/storage/backpack
	backpack_contents = list(/obj/item/weapon/storage/box=1)

/datum/outfit/wizard/red
	name = "Red Wizard"

	suit = /obj/item/clothing/suit/wizrobe/red
	head = /obj/item/clothing/head/wizard/red

/datum/outfit/wizard/weeb
	name = "Marisa Wizard"

	suit = /obj/item/clothing/suit/wizrobe/marisa
	shoes = /obj/item/clothing/shoes/sandal/marisa
	head = /obj/item/clothing/head/wizard/marisa

/datum/outfit/soviet
	name = "Soviet Admiral"

	uniform = /obj/item/clothing/under/soviet
	head = /obj/item/clothing/head/pirate/captain
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	ears = /obj/item/device/radio/headset/headset_cent
	glasses = /obj/item/clothing/glasses/thermal/eyepatch
	suit = /obj/item/clothing/suit/pirate/captain
	back = /obj/item/weapon/storage/backpack/satchel/leather
	belt = /obj/item/weapon/gun/ballistic/revolver/mateba

	id = /obj/item/weapon/card/id

/datum/outfit/soviet/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/weapon/card/id/W = H.wear_id
	W.icon_state = "centcom"
	W.access = get_all_accesses()
	W.access += get_centcom_access("Admiral")
	W.assignment = "Admiral"
	W.registered_name = H.real_name
	W.update_label()

/datum/outfit/mobster
	name = "Mobster"

	uniform = /obj/item/clothing/under/suit_jacket/really_black
	head = /obj/item/clothing/head/fedora
	shoes = /obj/item/clothing/shoes/laceup
	gloves = /obj/item/clothing/gloves/color/black
	ears = /obj/item/device/radio/headset
	glasses = /obj/item/clothing/glasses/sunglasses
	r_hand = /obj/item/weapon/gun/ballistic/automatic/tommygun
	id = /obj/item/weapon/card/id

/datum/outfit/mobster/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/weapon/card/id/W = H.wear_id
	W.assignment = "Assistant"
	W.registered_name = H.real_name
	W.update_label()

/datum/outfit/plasmaman
	name = "Plasmaman"

	head = /obj/item/clothing/head/helmet/space/plasmaman
	uniform = /obj/item/clothing/under/plasmaman
	r_hand= /obj/item/weapon/tank/internals/plasmaman/belt/full
	mask = /obj/item/clothing/mask/breath

/datum/outfit/death_commando
	name = "Death Commando"

	uniform = /obj/item/clothing/under/color/green
	suit = /obj/item/clothing/suit/space/hardsuit/shielded/swat
	shoes = /obj/item/clothing/shoes/combat/swat
	gloves = /obj/item/clothing/gloves/combat
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	glasses = /obj/item/clothing/glasses/hud/toggle/thermal
	back = /obj/item/weapon/storage/backpack/security
	l_pocket = /obj/item/weapon/melee/energy/sword/saber
	r_pocket = /obj/item/weapon/shield/energy
	suit_store = /obj/item/weapon/tank/internals/emergency_oxygen
	belt = /obj/item/weapon/gun/ballistic/revolver/mateba
	r_hand = /obj/item/weapon/gun/energy/pulse/loyalpin
	id = /obj/item/weapon/card/id
	ears = /obj/item/device/radio/headset/headset_cent/alt

	backpack_contents = list(/obj/item/weapon/storage/box=1,\
		/obj/item/ammo_box/a357=1,\
		/obj/item/weapon/storage/firstaid/regular=1,\
		/obj/item/weapon/storage/box/flashbangs=1,\
		/obj/item/device/flashlight=1,\
		/obj/item/weapon/grenade/plastic/x4=1)

/datum/outfit/death_commando/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/device/radio/R = H.ears
	R.set_frequency(CENTCOM_FREQ)
	R.freqlock = 1

	var/obj/item/weapon/implant/mindshield/L = new/obj/item/weapon/implant/mindshield(H)//Here you go Deuryn
	L.implant(H, null, 1)


	var/obj/item/weapon/card/id/W = H.wear_id
	W.icon_state = "centcom"
	W.access = get_all_accesses()//They get full station access.
	W.access += get_centcom_access("Death Commando")//Let's add their alloted Centcom access.
	W.assignment = "Death Commando"
	W.registered_name = H.real_name
	W.update_label(W.registered_name, W.assignment)

/datum/outfit/death_commando/officer
	name = "Death Commando Officer"
	head = /obj/item/clothing/head/helmet/space/beret

/datum/outfit/chrono_agent
	name = "Timeline Eradication Agent"
	uniform = /obj/item/clothing/under/color/white
	suit = /obj/item/clothing/suit/space/chronos
	back = /obj/item/weapon/chrono_eraser
	head = /obj/item/clothing/head/helmet/space/chronos
	mask = /obj/item/clothing/mask/breath
	suit_store = /obj/item/weapon/tank/internals/oxygen

/datum/outfit/madmax
    name = "Mad Max loadout"
    uniform = /obj/item/clothing/under/pants/f13/mfp/raider
    suit = /obj/item/clothing/suit/f13/mfp/raider
    belt = /obj/item/weapon/gun/ballistic/revolver/madmax
    shoes = /obj/item/clothing/shoes/combat
    gloves = /obj/item/clothing/gloves/maxgloves
    r_pocket = /obj/item/ammo_casing/shotgun/decimator
    l_pocket = /obj/item/ammo_casing/shotgun/decimator
    suit_store = /obj/item/weapon/gun/ballistic/revolver/lucky
    back = /obj/item/weapon/storage/backpack/satchel/madmax
    r_hand = /obj/item/weapon/kitchen/knife/combat

/datum/outfit/furyroad
    name = "Fury Road loadout"
    uniform = /obj/item/clothing/under/furyclothes
    suit = /obj/item/clothing/suit/furyjacket
    belt = /obj/item/weapon/gun/ballistic/revolver/madmax
    shoes = /obj/item/clothing/shoes/furyshoes
    r_pocket = /obj/item/ammo_casing/shotgun/decimator
    l_pocket = /obj/item/ammo_casing/shotgun/decimator
    suit_store = /obj/item/weapon/gun/ballistic/automatic/pistol/browning
    back = /obj/item/weapon/gun/ballistic/shotgun/rifle/scope
    r_hand = /obj/item/weapon/kitchen/knife/combat

/datum/outfit/igon
    name = "Eygon loadout"
    uniform = /obj/item/clothing/under/igonarmor
    suit = /obj/item/clothing/suit/armor/igonchest
    belt = /obj/item/weapon/storage/belt/igonbelt/full
    back = /obj/item/weapon/twohanded/ingopolearm
    shoes = /obj/item/clothing/shoes/igonshoes
    gloves = /obj/item/clothing/gloves/igongloves
    head = /obj/item/clothing/head/igonhelmet
    r_pocket = /obj/item/device/flashlight/lantern
    l_pocket = /obj/item/weapon/kitchen/knife/combat/survival

/datum/outfit/mikeloadout
    name = "Hincken loadout"
    uniform = /obj/item/clothing/under/mikesuit
    belt = /obj/item/weapon/storage/belt/mikebelt/full
    suit = /obj/item/clothing/suit/mikecoat
    shoes = /obj/item/clothing/shoes/mikeboots
    gloves = /obj/item/clothing/gloves/fingerless
    r_pocket = /obj/item/weapon/grenade/smokebomb
    l_pocket = /obj/item/weapon/melee/classic_baton/telescopic

/datum/outfit/hitcherloadout
    name = "Hitcher loadout"
    uniform = /obj/item/clothing/under/mikeclothes
    suit = /obj/item/clothing/suit/mikeduster
    shoes = /obj/item/clothing/shoes/laceup
    r_pocket = /obj/item/ammo_box/colt357
    l_pocket = /obj/item/weapon/gun/ballistic/revolver/model19
    back = /obj/item/weapon/gun/ballistic/shotgun/maverick

/datum/outfit/wolfloadout
    name = "Briner loadout"
    uniform = /obj/item/clothing/under/loomisclothes
    belt = /obj/item/weapon/storage/belt/loomisholster/full
    suit = /obj/item/clothing/suit/loomiscoat
    shoes = /obj/item/clothing/shoes/laceup
    r_pocket = /obj/item/device/flashlight/seclite
    l_pocket = /obj/item/weapon/switchblade

/datum/outfit/reloadout
    name = "Kennedy loadout"
    uniform = /obj/item/clothing/under/leonclothes
    belt = /obj/item/weapon/storage/belt/leonholster/full
    suit = /obj/item/clothing/suit/leonjacket
    shoes = /obj/item/clothing/shoes/laceup
    gloves = /obj/item/clothing/gloves/leongloves
    r_pocket = /obj/item/device/flashlight/seclite
    l_pocket = /obj/item/weapon/reknife

/datum/outfit/re2loadout
    name = "RPD loadout"
    uniform = /obj/item/clothing/under/rpdclothes
    belt = /obj/item/weapon/storage/belt/reholster/full
    shoes = /obj/item/clothing/shoes/laceup
    gloves = /obj/item/clothing/gloves/rpdgloves
    r_pocket = /obj/item/device/flashlight/seclite
    l_pocket = /obj/item/weapon/reknife

/datum/outfit/alucardloadout
    name = "Vampire loadout"
    uniform = /obj/item/clothing/under/vampireclothes
    belt = /obj/item/weapon/alucardsword
    suit = /obj/item/clothing/suit/vampirecoat
    shoes = /obj/item/clothing/shoes/vampireboots
    r_pocket = /obj/item/device/necromantic_stone
    l_pocket = /obj/item/weapon/spellbook

/datum/outfit/stokerloadout
    name = "Stoker loadout"
    uniform = /obj/item/clothing/under/stokerclothes
    belt = /obj/item/weapon/storage/belt/stokerholster/full
    suit = /obj/item/clothing/suit/stokercoat
    shoes = /obj/item/clothing/shoes/laceup
    r_pocket = /obj/item/device/flashlight/lantern
    l_pocket = /obj/item/ammo_box/colt357
    r_hand = /obj/item/weapon/gun/ballistic/revolver/stokersp101
    suit_store = /obj/item/weapon/melee/classic_baton/truevampirekiller

/datum/outfit/belmontloadout
    name = "Belmont loadout"
    uniform = /obj/item/clothing/under/belmontclothes
    belt = /obj/item/weapon/storage/belt/stokerholster/full
    suit = /obj/item/clothing/suit/belmontcoat
    shoes = /obj/item/clothing/shoes/belmontboots
    r_pocket = /obj/item/device/flashlight/lantern
    l_pocket = /obj/item/ammo_box/c45
    r_hand = /obj/item/weapon/gun/ballistic/revolver/stoker1917
    suit_store = /obj/item/weapon/melee/classic_baton/truevampirekiller

/datum/outfit/belmontloadoutalt
    name = "Belmont loadout alt"
    uniform = /obj/item/clothing/under/belmontclothesalt
    belt = /obj/item/weapon/storage/belt/belmontbelt/full
    suit = /obj/item/clothing/suit/belmontcoatalt
    shoes = /obj/item/clothing/shoes/belmontbootsalt
    r_pocket = /obj/item/device/flashlight/lantern
    l_pocket = /obj/item/weapon/gun/ballistic/revolver/bulldog

/datum/outfit/juliusloadout
    name = "Julius loadout"
    uniform = /obj/item/clothing/under/juliusclothes
    belt = /obj/item/weapon/storage/belt/belmontbelt/full
    suit = /obj/item/clothing/suit/juliuscoat
    shoes = /obj/item/clothing/shoes/juliusboots
    r_pocket = /obj/item/device/flashlight/lantern
    l_pocket = /obj/item/weapon/gun/ballistic/revolver/bulldog

/datum/outfit/gatloadout
    name = "Saint's loadout"
    uniform = /obj/item/clothing/under/gatclothes
    belt = /obj/item/weapon/storage/belt/gatholsters/full
    suit = /obj/item/clothing/suit/gatjacket
    shoes = /obj/item/clothing/shoes/laceup
    gloves = /obj/item/clothing/gloves/gatgloves
    glasses = /obj/item/clothing/glasses/sunglasses
    r_pocket = /obj/item/weapon/gun/ballistic/automatic/pistol/model1908
    l_pocket = /obj/item/weapon/kitchen/knife/combat
    back = /obj/item/weapon/gun/ballistic/automatic/ak74

/datum/outfit/wolfloadoutalt
    name = "Briner loadout alt"
    uniform = /obj/item/clothing/under/loomisclothes
    belt = /obj/item/weapon/storage/belt/loomisholsteralt/full
    suit = /obj/item/clothing/suit/loomiscoat
    shoes = /obj/item/clothing/shoes/laceup
    r_pocket = /obj/item/device/flashlight/seclite
    l_pocket = /obj/item/weapon/switchblade
    l_hand = /obj/item/weapon/cane

/datum/outfit/dirtyharryloadout
    name = "Callahan loadout"
    uniform = /obj/item/clothing/under/wolfclothes
    belt = /obj/item/weapon/storage/belt/wolfholster/full
    suit = /obj/item/clothing/suit/wolfjacket
    shoes = /obj/item/clothing/shoes/laceup
    r_pocket = /obj/item/device/flashlight/seclite
    l_pocket = /obj/item/weapon/switchblade

/datum/outfit/dirtyharryloadoutalt
    name = "Callahan loadout alt"
    uniform = /obj/item/clothing/under/harryclothes
    belt = /obj/item/weapon/storage/belt/wolfholster/full
    suit = /obj/item/clothing/suit/harryjacket
    shoes = /obj/item/clothing/shoes/laceup
    r_pocket = /obj/item/device/flashlight/seclite
    l_pocket = /obj/item/weapon/switchblade

/datum/outfit/zimzamloadout
    name = "Zim loadout"
    uniform = /obj/item/clothing/under/zimclothes
    suit = /obj/item/clothing/suit/zimjacket
    shoes = /obj/item/clothing/shoes/sneakers/white
    r_pocket = /obj/item/ammo_box/colt357
    l_pocket = /obj/item/weapon/switchblade
    l_hand = /obj/item/weapon/gun/ballistic/revolver/derringer

/datum/outfit/roland
    name = "Gunslinger loadout"
    uniform = /obj/item/clothing/under/rolandclothes
    suit = /obj/item/clothing/suit/f13/rolandcoat
    belt = /obj/item/weapon/storage/belt/rolandholsters/full
    shoes = /obj/item/clothing/shoes/rolandboots
    r_pocket = /obj/item/device/flashlight/lantern
    l_pocket = /obj/item/weapon/kitchen/knife/rolandknife

/datum/outfit/rolandremake
    name = "Gunslinger loadout remake"
    uniform = /obj/item/clothing/under/rolandclothesremake
    suit = /obj/item/clothing/suit/rolandcoatremake
    belt = /obj/item/weapon/storage/belt/rolandholstersremake/full
    shoes = /obj/item/clothing/shoes/rolandboots
    r_pocket = /obj/item/device/flashlight/lantern
    l_pocket = /obj/item/weapon/kitchen/knife/rolandknife

/datum/outfit/rolandbookoutfit
    name = "Gunslinger book loadout"
    uniform = /obj/item/clothing/under/rolandclothesremake
    suit = /obj/item/clothing/suit/rolandcoatthree
    belt = /obj/item/weapon/storage/belt/rolandholstersremake/full
    shoes = /obj/item/clothing/shoes/rolandboots
    r_pocket = /obj/item/device/flashlight/lantern
    l_pocket = /obj/item/weapon/kitchen/knife/rolandknife
    head = /obj/item/clothing/head/rolandhatthree

/datum/outfit/jake
    name = "Jake Chambers loadout"
    uniform = /obj/item/clothing/under/jakeclothes
    belt = /obj/item/weapon/storage/belt/jakeholster/full
    shoes = /obj/item/clothing/shoes/jakeshoes
    r_pocket = /obj/item/device/flashlight/lantern
    l_pocket = /obj/item/weapon/kitchen/knife/combat

/datum/outfit/rolandalt
    name = "Alternate Gunslinger loadout"
    uniform = /obj/item/clothing/under/rolandclothesalt
    belt = /obj/item/weapon/storage/belt/rolandholstertwo/full
    shoes = /obj/item/clothing/shoes/rolandboots
    r_pocket = /obj/item/device/flashlight/lantern
    l_pocket = /obj/item/weapon/kitchen/knife/rolandknife
    head = /obj/item/clothing/head/rolandhat

/datum/outfit/rolandalttwo
    name = "Poncho Gunslinger loadout"
    uniform = /obj/item/clothing/under/rolandclothesalt
    belt = /obj/item/weapon/storage/belt/rolandholsterstwo/full
    suit = /obj/item/clothing/suit/rolandponcho
    shoes = /obj/item/clothing/shoes/rolandboots
    r_pocket = /obj/item/device/flashlight/lantern
    l_pocket = /obj/item/weapon/kitchen/knife/rolandknife
    head = /obj/item/clothing/head/rolandhat

/datum/outfit/drawingofthree
    name = "Drawing of the Three Gunslinger loadout"
    uniform = /obj/item/clothing/under/rolandclothestwo
    belt = /obj/item/weapon/storage/belt/rolandholster/full
    shoes = /obj/item/clothing/shoes/rolandbootstwo
    suit = /obj/item/clothing/suit/rolandcloak
    r_pocket = /obj/item/device/flashlight/lantern
    l_pocket = /obj/item/weapon/kitchen/knife/rolandknife
    head = /obj/item/clothing/head/rolandhattwo

/datum/outfit/eluria
    name = "Gunslinger of Eluria loadout"
    uniform = /obj/item/clothing/under/gunslingerclothes
    belt = /obj/item/weapon/storage/belt/gunslingerholsters/full
    shoes = /obj/item/clothing/shoes/gunslingerboots
    suit = /obj/item/clothing/suit/gunslingercoat
    r_pocket = /obj/item/device/flashlight/lantern
    l_pocket = /obj/item/weapon/kitchen/knife/rolandknife
    head = /obj/item/clothing/head/gunslingerhat

/datum/outfit/desperado
    name = "Desperado loadout"
    uniform = /obj/item/clothing/under/johncowboyclothes
    belt = /obj/item/weapon/storage/belt/johncowboyholster/full
    shoes = /obj/item/clothing/shoes/johncowboyboots
    suit = /obj/item/clothing/suit/johncowboycoat
    r_pocket = /obj/item/weapon/gun/ballistic/revolver/coltsaashort
    l_pocket = /obj/item/weapon/gun/ballistic/revolver/coltsaashort
    head = /obj/item/clothing/head/johncowboyhat

/datum/outfit/liquidloadout
    name = "Liquid loadout"
    uniform = /obj/item/clothing/under/liquidsuit
    belt = /obj/item/weapon/storage/belt/liquidholsters/full
    shoes = /obj/item/clothing/shoes/liquidshoes
    suit = /obj/item/clothing/suit/liquidarmor
    gloves = /obj/item/clothing/gloves/liquidgloves
    head = /obj/item/clothing/head/helmet/f13/liquidhelmet

/datum/outfit/hunterloadout
    name = "Hunter loadout"
    uniform = /obj/item/clothing/under/hunterclothes
    belt = /obj/item/weapon/storage/belt/hunterholster/full
    shoes = /obj/item/clothing/shoes/hunterboots
    suit = /obj/item/clothing/suit/hunterjacket
    gloves = /obj/item/clothing/gloves/huntergloves
    head = /obj/item/clothing/head/helmet/f13/huntermask
    r_pocket = /obj/item/ammo_box/magazine/sniper_rounds
    l_pocket = /obj/item/ammo_box/magazine/sniper_rounds
    back = /obj/item/weapon/gun/ballistic/automatic/sniper_rifle

/datum/outfit/cruzloadout
    name = "Cruz loadout"
    uniform = /obj/item/clothing/under/cruzclothes
    belt = /obj/item/weapon/storage/belt/cruzholster/full
    shoes = /obj/item/clothing/shoes/cruzshoes
    suit = /obj/item/clothing/suit/cruzcoat
    r_pocket = /obj/item/device/flashlight/seclite
    l_pocket = /obj/item/weapon/spellbook
    back = /obj/item/weapon/zimsword

/datum/outfit/fatass
    name = "Fatass loadout"
    uniform = /obj/item/clothing/under/f13/bennys
    belt = /obj/item/weapon/storage/belt/luckyholster/full
    back = /obj/item/weapon/gun/ballistic/automatic/bozar
    shoes = /obj/item/clothing/shoes/laceup
    glasses = /obj/item/clothing/glasses/sunglasses
    r_pocket = /obj/item/weapon/storage/fancy/cigarettes/cigpack_robustgold
    l_pocket = /obj/item/weapon/lighter/black

/datum/outfit/terminator
    name = "T-800 loadout"
    uniform = /obj/item/clothing/under/terminatorclothes
    belt = /obj/item/weapon/storage/belt/terminatorholster/full
    suit = /obj/item/clothing/suit/terminatorjacket
    shoes = /obj/item/clothing/shoes/laceup
    glasses = /obj/item/clothing/glasses/sunglasses
    r_pocket = /obj/item/ammo_box/magazine/m45
    l_pocket = /obj/item/ammo_box/magazine/m45
    back = /obj/item/weapon/gun/ballistic/shotgun/terminator

/datum/outfit/wolfwood
    name = "Wolfwood"
    uniform = /obj/item/clothing/under/wolfwood
    belt = /obj/item/weapon/storage/belt/wolfwoodholster/full
    shoes = /obj/item/clothing/shoes/laceup
    glasses = /obj/item/clothing/glasses/sunglasses
    r_pocket = /obj/item/ammo_box/magazine/sniper_rounds
    l_pocket = /obj/item/ammo_box/magazine/sniper_rounds
    back = /obj/item/weapon/gun/ballistic/automatic/punisher

/datum/outfit/pennywise
	name = "Pennywise loadout"

	uniform = /obj/item/clothing/under/pennywisesuit
	shoes = /obj/item/clothing/shoes/laceup
	gloves = /obj/item/clothing/gloves/pennywisegloves
	mask = /obj/item/clothing/mask/pennywisemask
	l_pocket = /obj/item/weapon/reagent_containers/food/snacks/grown/banana
	r_pocket = /obj/item/weapon/bikehorn

/datum/outfit/newpennywise
	name = "2017 Pennywise loadout"

	uniform = /obj/item/clothing/under/newpennywisesuit
	shoes = /obj/item/clothing/shoes/newpennywiseshoes
	gloves = /obj/item/clothing/gloves/newpennywisegloves
	mask = /obj/item/clothing/mask/newpennywisemask
	l_pocket = /obj/item/weapon/reagent_containers/food/snacks/grown/banana
	r_pocket = /obj/item/weapon/bikehorn
	r_hand = /obj/item/latexballon

/datum/outfit/crimsonking
	name = "Crimson King loadout"
	uniform = /obj/item/clothing/under/pants/black
	shoes = /obj/item/clothing/shoes/sandal
	suit = /obj/item/clothing/suit/hooded/crimsonking
	belt = /obj/item/weapon/crimsonsword

/datum/outfit/walter
	name = "Man in Black loadout"
	uniform = /obj/item/clothing/under/walter
	shoes = /obj/item/clothing/shoes/laceup

/datum/outfit/myers
	name = "Halloween loadout"
	uniform = /obj/item/clothing/under/myers
	belt = /obj/item/weapon/kitchen/knife/butcher/myers
	shoes = /obj/item/clothing/shoes/laceup
	mask = /obj/item/clothing/mask/myersmask

/datum/outfit/dmaster
	name = "Dmaster Loadout"
	glasses = /obj/item/clothing/glasses/thermal/eyepatch
	uniform = /obj/item/clothing/under/color/black
	back = /obj/item/weapon/twohanded/shizenblade
	shoes = /obj/item/clothing/shoes/space_ninja
	suit = /obj/item/clothing/suit/stealth/stealthsuit
	head = /obj/item/clothing/head/helmet/stealth/stealthhelmet

/datum/outfit/dmaster2
	name = "Smith Loadout"
	gloves = /obj/item/clothing/gloves/f13/military
	uniform = /obj/item/clothing/under/f13/enclave_officer
	shoes = /obj/item/clothing/shoes/f13/military
	back = /obj/item/weapon/storage/backpack/satchel/leather
	suit = /obj/item/clothing/suit/bio_suit/advancedsciencesuit
	head = /obj/item/clothing/head/bio_hood/advsciencehood
	weapon = /obj/item/weapon/gun/energy/laser/laer

/datum/outfit/puristlearner
	name = "Purist Learner Loadout"
	uniform = /obj/item/clothing/under/puristunderalt
	shoes = /obj/item/clothing/shoes/puristboots
	belt = /obj/item/weapon/melee/energy/sword/saber/blue
	suit = /obj/item/clothing/suit/hooded/puristrobes
	suit_store = /obj/item/weapon/dnainjector/telemut/darkbundle
	l_pocket = /obj/item/device/radio
	r_pocket = /obj/item/device/flashlight/seclite

/datum/outfit/puristmaster
	name = "Purist Master Loadout"
	uniform = /obj/item/clothing/under/puristunder
	shoes = /obj/item/clothing/shoes/puristboots
	belt = /obj/item/weapon/melee/energy/sword/saber/green
	suit = /obj/item/clothing/suit/hooded/puristrobes
	suit_store = /obj/item/weapon/dnainjector/telemut/darkbundle
	l_pocket = /obj/item/device/radio
	r_pocket = /obj/item/device/flashlight/seclite

/datum/outfit/extremistapprentice
	name = "Extremist Apprentice Loadout"
	uniform = /obj/item/clothing/under/extremistunderalt
	shoes = /obj/item/clothing/shoes/extremistboots
	belt = /obj/item/weapon/melee/energy/sword/saber/red
	suit = /obj/item/clothing/suit/hooded/extremistrobes
	suit_store = /obj/item/weapon/dnainjector/telemut/darkbundle
	l_pocket = /obj/item/device/radio
	r_pocket = /obj/item/device/flashlight/seclite

/datum/outfit/extremistlord
	name = "Extremist Lord Loadout"
	uniform = /obj/item/clothing/under/extremistunder
	shoes = /obj/item/clothing/shoes/extremistboots
	belt = /obj/item/weapon/melee/energy/sword/saber/red
	suit = /obj/item/clothing/suit/hooded/extremistrobes
	suit_store = /obj/item/weapon/dnainjector/telemut/darkbundle
	l_pocket = /obj/item/device/radio
	r_pocket = /obj/item/device/flashlight/seclite

/datum/outfit/jones
	name = "Jones Loadout"
	uniform = /obj/item/clothing/under/puristunderalt
	shoes = /obj/item/clothing/shoes/extremistboots
	belt = /obj/item/weapon/melee/energy/sword/saber/blue
	suit = /obj/item/clothing/suit/hooded/extremistrobes
	suit_store = /obj/item/weapon/dnainjector/telemut/darkbundle
	l_pocket = /obj/item/device/radio
	r_pocket = /obj/item/device/flashlight/seclite

/datum/outfit/cane
	name = "Cane Loadout"
	uniform = /obj/item/clothing/under/puristunder
	shoes = /obj/item/clothing/shoes/puristboots
	belt = /obj/item/weapon/melee/energy/sword/saber/blue
	suit = /obj/item/clothing/suit/hooded/puristrobes
	suit_store = /obj/item/weapon/dnainjector/telemut/darkbundle
	l_pocket = /obj/item/device/radio
	r_pocket = /obj/item/device/flashlight/seclite

/datum/outfit/kylozim
	name = "Kylo Zim Loadout"
	uniform = /obj/item/clothing/under/extremistunder
	shoes = /obj/item/clothing/shoes/extremistboots
	belt = /obj/item/weapon/melee/energy/sword/saber/zimsword
	suit = /obj/item/clothing/suit/hooded/extremistrobes
	suit_store = /obj/item/weapon/dnainjector/telemut/darkbundle
	gloves = /obj/item/clothing/gloves/color/black
	l_pocket = /obj/item/device/radio
	r_pocket = /obj/item/device/flashlight/seclite
	mask = /obj/item/clothing/mask/kylozimhelmet

/datum/outfit/revan
	name = "Revan Loadout"
	uniform = /obj/item/clothing/under/extremistunder
	shoes = /obj/item/clothing/shoes/extremistboots
	belt = /obj/item/weapon/melee/energy/sword/saber/purple
	suit = /obj/item/clothing/suit/hooded/extremistrobes
	suit_store = /obj/item/weapon/dnainjector/telemut/darkbundle
	gloves = /obj/item/clothing/gloves/color/black
	l_pocket = /obj/item/device/radio
	r_pocket = /obj/item/device/flashlight/seclite
	mask = /obj/item/clothing/mask/revanhelmet

/datum/outfit/vader
	name = "Vader Loadout"
	uniform = /obj/item/clothing/under/vadersuit
	shoes = /obj/item/clothing/shoes/vaderboots
	belt = /obj/item/weapon/melee/energy/sword/saber/red
	r_hand = /obj/item/weapon/dnainjector/telemut/darkbundle
	gloves = /obj/item/clothing/gloves/vadergloves
	l_pocket = /obj/item/device/radio
	r_pocket = /obj/item/device/flashlight/seclite
	mask = /obj/item/clothing/mask/vaderhelmet

datum/outfit/sully
	name = "Sully Loadout"
	uniform = /obj/item/clothing/under/sullycoat
	suit = /obj/item/clothing/suit/armor/sullyvest
	shoes = /obj/item/clothing/shoes/sullyshoes
	gloves = /obj/item/clothing/gloves/sullygloves
	belt = /obj/item/weapon/storage/belt/military/sullybelt
	back = /obj/item/weapon/gun/ballistic/shotgun/sc_pump
	weapon = /obj/item/weapon/gun/ballistic/revolver/python
	l_pocket = /obj/item/device/radio
	head = /obj/item/clothing/head/sullybag

datum/outfit/tribal
	name = "Tribal Loadout"
	uniform = /obj/item/clothing/under/tribalshaman
	suit = /obj/item/clothing/suit/tribalshamancloak
	back = /obj/item/weapon/melee/classic_baton/warclub
	head = /obj/item/clothing/head/tribalfeather
	mask = /obj/item/clothing/mask/tribalpaintpurple