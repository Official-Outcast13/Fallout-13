//  get_faction_datum()

/obj/item/device/radio
	var/faction = 0

/obj/item/device/radio/New()
	. = ..()
	attempt_faction_radio_freq()

/obj/item/device/radio/proc/attempt_faction_radio_freq()
	if(faction)
		var/datum/f13_faction/F = get_faction_datum(faction)
		if(F)
			set_frequency(F.freq)

/obj/item/device/radio/faction/ncr
	faction = "ncr"
/obj/item/device/radio/faction/bs
	faction = "bs"
/obj/item/device/radio/faction/enclave
	faction = "enclave"
/obj/item/device/radio/faction/raiders
	faction = "raiders"
/obj/item/device/radio/faction/legion
	faction = "legion"
/obj/item/device/radio/faction/city
	faction = "city"
/obj/item/device/radio/faction/vault
	faction = "vault"
