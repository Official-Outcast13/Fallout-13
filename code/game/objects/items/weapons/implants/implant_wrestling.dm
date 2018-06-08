/obj/item/weapon/implant/wrestling
	name = "Wrestling implant"
	desc = "Teaches you the art of smackin' a brother down via an instructional video beamed directly into your eyeballs."
	icon = 'icons/obj/wizard.dmi'
	icon_state ="scroll2"
	activated = 1
	origin_tech = "materials=2;biotech=4;combat=5;syndicate=4"
	var/datum/martial_art/wrestling/style = new

/obj/item/weapon/implant/wrestling/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Wrestling Implant<BR>
				<b>Life:</b> 4 hours after death of host<BR>
				<b>Implant Details:</b> <BR>
				<b>Function:</b> Teaches even the wimpiest host the art of Wrestling."}
	return dat

/obj/item/weapon/implant/wrestling/activate()
	var/mob/living/carbon/human/H = imp_in
	if(!ishuman(H))
		return
	if(istype(H.martial_art, /datum/martial_art/wrestling))
		style.remove(H)
	else
		style.teach(H,1)

/obj/item/weapon/implanter/wrestling
	name = "implanter (wrestling)"

/obj/item/weapon/implanter/wrestling/New()
	imp = new /obj/item/weapon/implant/wrestling(src)
	..()

/obj/item/weapon/implantcase/wrestling
	name = "implant case - 'Wrestling'"
	desc = "A glass case containing an implant that can teach the user the arts of Wrestling."

/obj/item/weapon/implantcase/wrestling/New()
	imp = new /obj/item/weapon/implant/wrestling(src)
	..()