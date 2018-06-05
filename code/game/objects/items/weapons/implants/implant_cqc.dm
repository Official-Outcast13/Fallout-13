/obj/item/weapon/implant/cqc
	name = "CQC implant"
	desc = "Teaches you the art of Close Quarters Combat via an instructional video beamed directly into your eyeballs."
	icon = 'icons/obj/wizard.dmi'
	icon_state ="scroll2"
	activated = 1
	origin_tech = "materials=2;biotech=4;combat=5;syndicate=4"
	var/datum/martial_art/cqc/style = new

/obj/item/weapon/implant/cqc/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> CQC Implant<BR>
				<b>Life:</b> 4 hours after death of host<BR>
				<b>Implant Details:</b> <BR>
				<b>Function:</b> Teaches even the most clueless host the art of Close Quarters Combat."}
	return dat

/obj/item/weapon/implant/cqc/activate()
	var/mob/living/carbon/human/H = imp_in
	if(!ishuman(H))
		return
	if(istype(H.martial_art, /datum/martial_art/cqc))
		style.remove(H)
	else
		style.teach(H,1)

/obj/item/weapon/implanter/cqc
	name = "implanter (CQC)"

/obj/item/weapon/implanter/cqc/New()
	imp = new /obj/item/weapon/implant/cqc(src)
	..()

/obj/item/weapon/implantcase/cqc
	name = "implant case - 'CQC'"
	desc = "A glass case containing an implant that can teach the user the arts of CQC."

/obj/item/weapon/implantcase/cqc/New()
	imp = new /obj/item/weapon/implant/cqc(src)
	..()