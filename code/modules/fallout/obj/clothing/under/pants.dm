//Fallout 13 pants directory

/obj/item/clothing/under/pants/f13
	icon = 'icons/fallout/clothing/uniforms.dmi'
	self_weight = 0.3

/obj/item/clothing/under/pants/f13/ghoul
	name = "ripped pants"
	desc = "A pair of ripped pants that were not washed for over a hundred years.<br>Thanks to these you don't get to see ghouls genitals too often.<br><i>You can also wear these, to pretend you are a feral ghoul, just saying...</i>"
	icon_state = "ghoul"
	item_color = "ghoul"

/obj/item/clothing/under/pants/f13/cloth
	name = "cloth pants"
	desc = "A pair of worn dusty cloth pants made of various textile pieces.<br>Commonly found all over the wasteland."
	icon_state = "cloth"
	item_color = "cloth"

/obj/item/clothing/under/pants/f13/caravan //Caravanner - someone who travels with caravan. Caravaneer - caravan leader.
	name = "caravanner pants"
	desc = "A pair of wide dusty cargo pants.<br>Commonly worn by caravanners or caravan robbers."
	icon_state = "caravan"
	item_color = "caravan"

/obj/item/clothing/under/pants/f13/khan
	name = "Great Khan pants"
	desc = "Cloth pants with leather armor pads attached on both sides.<br>These are commonly worn by the Great Khans raiders."
	icon_state = "khan"
	item_color = "khan"
	flags = THICKMATERIAL
	body_parts_covered = LEGS
	armor = list(melee = 25, bullet = 20, laser = 20, energy = 20, bomb = 20, bio = 20, rad = 25, fire = 20, acid = 20)

/obj/item/clothing/under/pants/f13/mfp/raider
	name = "offbeat pants"
	desc = "Black leather trousers that appear to go with a long-defunct MFP uniform."
	icon_state = "madmax"
	item_color = "madmax"
	flags = THICKMATERIAL
	body_parts_covered = LEGS
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 30, bomb = 30, bio = 30, rad = 30, fire = 30, acid = 30)

/obj/item/clothing/under/pants/f13/johnclothes
	name = "bedraggled ranger wear"
	desc = "What used to be a grey thermal sweater, albeit with several rips and tears now present. Under layers of dust and dirt are also very worn brown slacks."
	icon_state = "johnclothes"
	item_color = "johnclothes"
	flags = THICKMATERIAL
	body_parts_covered = LEGS
	armor = list(melee = 15, bullet = 20, laser = 20, energy = 20, bomb = 20, bio = 0, rad = 100, fire = 100, acid = 100)

/obj/item/clothing/under/pants/f13/warboy //Mad Max 4 2015 babe!
	name = "war boy pants"
	desc = "A pair of dark brown pants, perfect for the one who grabs the sun, riding to Valhalla."
	icon_state = "warboy"
	item_color = "warboy"
	flags = THICKMATERIAL
	body_parts_covered = LEGS
	armor = list(melee = 20, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 0, rad = 10, fire = 20, acid = 20)

/obj/item/clothing/under/pants/f13/doom
	name = "green pants"
	desc = "An odd pair of green pants made of synthetic material."
	icon_state = "green"
	item_color = "green"
	flags = THICKMATERIAL
	body_parts_covered = LEGS
	self_weight = 3
	armor = list(melee = 20, bullet = 20, laser = 20, energy = 20, bomb = 20, bio = 20, rad = 20, fire = 20, acid = 20)