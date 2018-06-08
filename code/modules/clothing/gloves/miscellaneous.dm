
/obj/item/clothing/gloves/fingerless
	name = "fingerless gloves"
	desc = "Plain black gloves without fingertips for the hard working."
	icon_state = "fingerless"
	item_state = "fingerless"
	item_color = null	//So they don't wash.
	transfer_prints = TRUE
	strip_delay = 40
	put_on_delay = 20
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT

/obj/item/clothing/gloves/maxgloves
	name = "fingerless gloves"
	desc = "Plain leather gloves without fingertips, possibly part of an MFP uniform long ago."
	icon_state = "maxgloves"
	item_state = "maxgloves"
	item_color = null	//So they don't wash.
	transfer_prints = TRUE
	strip_delay = 40
	put_on_delay = 20
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT

/obj/item/clothing/gloves/chrisgloves
	name = "fingerless gloves"
	desc = "A pair of black leather gloves manufactured without fingertips."
	icon_state = "chrisgloves"
	item_state = "chrisgloves"
	item_color = null	//So they don't wash.
	transfer_prints = TRUE
	strip_delay = 40
	put_on_delay = 20
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT

/obj/item/clothing/gloves/rpdgloves
	name = "Police gloves"
	desc = "A pair of leather police officer's gloves manufactured without fingertips."
	icon_state = "rpdgloves"
	item_state = "rpdgloves"
	item_color = null	//So they don't wash.
	transfer_prints = TRUE
	strip_delay = 40
	put_on_delay = 20
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT

/obj/item/clothing/gloves/leongloves
	name = "Guardsman's gloves"
	desc = "A pair of black leather fingerless gloves with hardened bracers around the wrists, presumably to prevent sprains in combat."
	icon_state = "leongloves"
	item_state = "leongloves"
	item_color = null	//So they don't wash.
	transfer_prints = TRUE
	strip_delay = 40
	put_on_delay = 20
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT

/obj/item/clothing/gloves/liquidgloves
	name = "Thermal gloves"
	desc = "Heavily insulated combat gloves that seem to be a detachable part of a bodysuit."
	icon_state = "liquidgloves"
	item_state = "liquidgloves"
	item_color = null	//So they don't wash.
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 50, bio = 10, rad = 0, fire = 70, acid = 50)
	strip_delay = 40
	put_on_delay = 20
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT

/obj/item/clothing/gloves/vadergloves
	name = "Armored gloves"
	desc = "A pair of very durable kevlar mesh gloves that appear to have steel inserts in each knuckle for offensive purposes. They seem to be heavily bulletproofed."
	icon_state = "vadergloves"
	item_state = "vadergloves"
	item_color = null	//So they don't wash.
	armor = list(melee = 300, bullet = 300, laser = 300,energy = 300, bomb = 300, bio = 300, rad = 300, fire = 300, acid = 300)
	strip_delay = 40
	put_on_delay = 20
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	flags = NODROP

/obj/item/clothing/gloves/huntergloves
	name = "Gloves"
	desc = "A pair of beige gloves, you can't quite make out the material used in them, but they feel worn and flexible."
	icon_state = "huntergloves"
	item_state = "huntergloves"
	item_color = null	//So they don't wash.
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 50, bio = 10, rad = 0, fire = 70, acid = 50)
	strip_delay = 40
	put_on_delay = 20
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT

/obj/item/clothing/gloves/gatgloves
	name = "Fingerless gloves"
	desc = "Black leather gloves with the fingertips purposely sheared off. Blood in, blood out."
	icon_state = "gatgloves"
	item_state = "gatgloves"
	item_color = null	//So they don't wash.
	transfer_prints = TRUE
	strip_delay = 40
	put_on_delay = 20
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT

/obj/item/clothing/gloves/botanic_leather
	name = "botanist's leather gloves"
	desc = "These leather gloves protect against thorns, barbs, prickles, spikes and other harmful objects of floral origin.  They're also quite warm."
	icon_state = "leather"
	item_state = "ggloves"
	permeability_coefficient = 0.9
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = 0
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 70, acid = 30)

/obj/item/clothing/gloves/combat
	name = "combat gloves"
	desc = "These tactical gloves are fireproof and shock resistant."
	icon_state = "black"
	item_state = "blackgloves"
	siemens_coefficient = 0
	permeability_coefficient = 0.05
	strip_delay = 80
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = 0
	self_weight = 0.1
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 80, acid = 50)

/obj/item/clothing/gloves/bracer
	name = "bone bracers"
	desc = "For when you're expecting to get slapped on the wrist. Offers modest protection to your arms."
	icon_state = "bracers"
	item_state = "bracers"
	item_color = null	//So they don't wash.
	transfer_prints = TRUE
	strip_delay = 40
	put_on_delay = 20
	body_parts_covered = ARMS
	cold_protection = ARMS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = 0
	armor = list(melee = 15, bullet = 35, laser = 35, energy = 20, bomb = 35, bio = 35, rad = 35, fire = 0, acid = 0)

/obj/item/clothing/gloves/igongloves
	name = "Steel Bracers"
	desc = "These pair share similar looks to it's armor, definitely not complete without the whole set."
	icon_state = "igongloves"
	item_state = "igongloves"
	item_color = null	//So they don't wash.
	transfer_prints = TRUE
	strip_delay = 40
	put_on_delay = 20
	resistance_flags = 0
	armor = list(melee = 15, bullet = 35, laser = 35, energy = 20, bomb = 35, bio = 35, rad = 35, fire = 0, acid = 0)

/obj/item/clothing/gloves/sullygloves
	name = "Militia Gloves"
	desc = "Fingerless on the right hand, to avoid snagging triggers"
	icon_state = "sullygloves"
	item_state = "sullygloves"
	item_color = null	//So they don't wash.
	transfer_prints = TRUE
	strip_delay = 40
	put_on_delay = 20
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT