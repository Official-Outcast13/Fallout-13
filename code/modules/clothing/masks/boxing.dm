/obj/item/clothing/mask/balaclava
	name = "balaclava"
	desc = "LOADSAMONEY"
	icon_state = "balaclava"
	item_state = "balaclava"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	visor_flags_inv = HIDEFACE|HIDEFACIALHAIR
	w_class = WEIGHT_CLASS_SMALL
	actions_types = list(/datum/action/item_action/adjust)

/obj/item/clothing/mask/balaclava/attack_self(mob/user)
	adjustmask(user)

/obj/item/clothing/mask/luchador
	name = "Luchador Mask"
	desc = "Worn by robust fighters, flying high to defeat their foes!"
	icon_state = "luchag"
	item_state = "luchag"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/mask/luchador/speechModification(message)
	if(copytext(message, 1, 2) != "*")
		message = replacetext(message, "captain", "CAPITÁN")
		message = replacetext(message, "station", "ESTACIÓN")
		message = replacetext(message, "sir", "SEÑOR")
		message = replacetext(message, "the ", "el ")
		message = replacetext(message, "my ", "mi ")
		message = replacetext(message, "is ", "es ")
		message = replacetext(message, "it's", "es")
		message = replacetext(message, "friend", "amigo")
		message = replacetext(message, "buddy", "amigo")
		message = replacetext(message, "hello", "hola")
		message = replacetext(message, " hot", " caliente")
		message = replacetext(message, " very ", " muy ")
		message = replacetext(message, "sword", "espada")
		message = replacetext(message, "library", "biblioteca")
		message = replacetext(message, "traitor", "traidor")
		message = replacetext(message, "wizard", "mago")
		message = uppertext(message)	//Things end up looking better this way (no mixed cases), and it fits the macho wrestler image.
		if(prob(25))
			message += " OLE!"
	return message

/obj/item/clothing/mask/luchador/tecnicos
	name = "Tecnicos Mask"
	desc = "Worn by robust fighters who uphold justice and fight honorably."
	icon_state = "luchador"
	item_state = "luchador"

/obj/item/clothing/mask/luchador/rudos
	name = "Rudos Mask"
	desc = "Worn by robust fighters who are willing to do anything to win."
	icon_state = "luchar"
	item_state = "luchar"

/obj/item/clothing/mask/myersmask
	name = "Latex face mask"
	desc = "You're not sure what this cheap Halloween mask is supposed to represent, but looking at the mere shape of it gives you the creeps. Say, didn't one of these get stolen from a shop recently?"
	icon_state = "myersmask"
	item_state = "myersmask"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/mask/kylozimhelmet
	name = "Steel helmet"
	desc = "An expressionless helmet with a one-way visor crafted from blackened steel and tempered with a presumably cutting edge furnace to achieve it's desired shape and tight fit. You feel an odd desire to betray and kill all of your friends while you're wearing it.."
	icon_state = "kylozimhelmet"
	item_state = "kylozimhelmet"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/mask/revanhelmet
	name = "Steel helmet"
	desc = "An expressionless helmet with a one-way visor crafted from blackened steel and tempered with a presumably cutting edge furnace to achieve it's desired shape and tight fit. You feel oddly at balance and very free while wearing it."
	icon_state = "revanhelmet"
	item_state = "revanhelmet"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/mask/vaderhelmet
	name = "Armored helmet"
	desc = "A dated but surprisingly effective blackened steel helmet capable of deflecting both gunshots and energy based projectiles all the same. It seems to be based heavily off of a salvaged power armor helmet with influences from pre-war death masks eerily visible in it's construction. You feel haunted just looking at it, let alone wearing it."
	icon_state = "vaderhelmet"
	item_state = "vaderhelmet"
	armor = list(melee = 300, bullet = 300, laser = 300,energy = 300, bomb = 300, bio = 300, rad = 300, fire = 300, acid = 300)
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/mask/pennywisemask
	name = "Clown wig and facepaint"
	desc = "Taking one look at this bizarre hair and facial paint combination tells you that it is eerily alive on it's wearer and not to be trusted. We all float down here"
	icon_state = "pennywisemask"
	item_state = "pennywisemask"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	w_class = WEIGHT_CLASS_SMALL
	flags = NODROP

/obj/item/clothing/mask/newpennywisemask
	name = "Clown wig and facepaint"
	desc = "Taking one look at this bizarre hair and facial paint combination tells you that it is eerily alive on it's wearer and not to be trusted. We all float down here"
	icon_state = "newpennywisemask"
	item_state = "newpennywisemask"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	w_class = WEIGHT_CLASS_SMALL
	flags = NODROP

