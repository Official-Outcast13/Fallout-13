/obj/item/flag
	name = "flag frame"
	desc = "It's an empty flag frame. Apply leather to make a flag."
	density = 1
	anchored = 1
	w_class = 4

	layer = 4.1
	pixel_x = -3
	icon = 'icons/obj/flags.dmi'
	icon_state = "emptyflag"
	item_state = "emptyflag"
	var/faction = null

/obj/item/flag/ncr
	name = "NCR flag"
	desc = "NCR Flag"
	icon_state = "ncrflag"
	item_state = "ncrflag"
	faction = "NCR"

/obj/item/flag/legion
	name = "Legion flag"
	desc = "Legion Flag"
	icon_state = "legionflag"
	item_state = "legionflag"
	faction = "Legion"
