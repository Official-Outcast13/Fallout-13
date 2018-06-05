/obj/item/weapon/gun/ballistic/revolver
	name = "\improper .357 revolver"
	desc = "A suspicious revolver. Uses .357 ammo." //usually used by syndicates
	icon_state = "revolver"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder
	origin_tech = "combat=3;materials=2"
	mag_load_sound = 'sound/effects/wep_magazines/bullet_insert.ogg'
	casing_ejector = 0

/obj/item/weapon/gun/ballistic/revolver/New()
	..()
	if(!istype(magazine, /obj/item/ammo_box/magazine/internal/cylinder))
		verbs -= /obj/item/weapon/gun/ballistic/revolver/verb/spin

/obj/item/weapon/gun/ballistic/revolver/chamber_round(spin = 1)
	if(spin)
		chambered = magazine.get_round(1)
	else
		chambered = magazine.stored_ammo[1]

/obj/item/weapon/gun/ballistic/revolver/shoot_with_empty_chamber(mob/living/user as mob|obj)
	..()
	chamber_round(1)

/obj/item/weapon/gun/ballistic/revolver/attackby(obj/item/A, mob/user, params)
	. = ..()
	if(.)
		return
	var/num_loaded = magazine.attackby(A, user, params, 1)
	if(num_loaded)
		to_chat(user, "<span class='notice'>You load [num_loaded] shell\s into \the [src].</span>")
		playsound(loc, mag_load_sound, 50)
		A.update_icon()
		update_icon()
		chamber_round(0)

/obj/item/weapon/gun/ballistic/revolver/attack_self(mob/living/user)
	var/num_unloaded = 0
	chambered = null
	while (get_ammo() > 0)
		var/obj/item/ammo_casing/CB
		CB = magazine.get_round(0)
		if(CB)
			CB.forceMove(get_turf(src.loc))
			CB.SpinAnimation(10, 1)
			CB.update_icon()
			num_unloaded++
	if (num_unloaded)
		to_chat(user, "<span class='notice'>You unload [num_unloaded] shell\s from [src].</span>")
		playsound(loc, pick('sound/effects/wep_misc/casing_bounce1.ogg', 'sound/effects/wep_misc/casing_bounce2.ogg', 'sound/effects/wep_misc/casing_bounce3.ogg'), 80)
	else
		to_chat(user, "<span class='warning'>[src] is empty!</span>")

/obj/item/weapon/gun/ballistic/revolver/verb/spin()
	set name = "Spin Chamber"
	set category = "Object"
	set desc = "Click to spin your revolver's chamber."

	var/mob/M = usr

	if(M.stat || !in_range(M,src))
		return

	if(do_spin())
		usr.visible_message("[usr] spins [src]'s chamber.", "<span class='notice'>You spin [src]'s chamber.</span>")
	else
		verbs -= /obj/item/weapon/gun/ballistic/revolver/verb/spin

/obj/item/weapon/gun/ballistic/revolver/proc/do_spin()
	var/obj/item/ammo_box/magazine/internal/cylinder/C = magazine
	. = istype(C)
	if(.)
		C.spin()
		chamber_round(0)

/obj/item/weapon/gun/ballistic/revolver/can_shoot()
	return get_ammo(0,0)

/obj/item/weapon/gun/ballistic/revolver/get_ammo(countchambered = 0, countempties = 1)
	var/boolets = 0 //mature var names for mature people
	if (chambered && countchambered)
		boolets++
	if (magazine)
		boolets += magazine.ammo_count(countempties)
	return boolets

/obj/item/weapon/gun/ballistic/revolver/examine(mob/user)
	..()
	to_chat(user, "[get_ammo(0,0)] of those are live rounds.")

/obj/item/weapon/gun/ballistic/revolver/detective
	name = "\improper .38 Mars Special"
	desc = "A cheap Martian knock-off of a classic law enforcement firearm. Uses .38-special rounds."
	icon_state = "detective"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev38
	unique_rename = 1
	unique_reskin = 1

/obj/item/weapon/gun/ballistic/revolver/detective/New()
	..()
	options["Default"] = "detective"
	options["Leopard Spots"] = "detective_leopard"
	options["Black Panther"] = "detective_panther"
	options["Gold Trim"] = "detective_gold"
	options["The Peacemaker"] = "detective_peacemaker"
	options["Cancel"] = null

/obj/item/weapon/gun/ballistic/revolver/detective/process_fire(atom/target as mob|obj|turf, mob/living/user as mob|obj, message = 1, params, zone_override = "")
	if(magazine.caliber != initial(magazine.caliber))
		if(prob(70 - (magazine.ammo_count() * 10)))	//minimum probability of 10, maximum of 60
			playsound(user, fire_sound, 50, 1)
			to_chat(user, "<span class='userdanger'>[src] blows up in your face!</span>")
			user.take_bodypart_damage(0,20)
			user.unEquip(src)
			return 0
	..()

/obj/item/weapon/gun/ballistic/revolver/detective/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/weapon/screwdriver))
		if(magazine.caliber == "38")
			to_chat(user, "<span class='notice'>You begin to reinforce the barrel of [src]...</span>")
			if(magazine.ammo_count())
				afterattack(user, user)	//you know the drill
				user.visible_message("<span class='danger'>[src] goes off!</span>", "<span class='userdanger'>[src] goes off in your face!</span>")
				return
			if(do_after(user, 30*A.toolspeed, target = src))
				if(magazine.ammo_count())
					to_chat(user, "<span class='warning'>You can't modify it!</span>")
					return
				magazine.caliber = "357"
				desc = "The barrel and chamber assembly seems to have been modified."
				to_chat(user, "<span class='notice'>You reinforce the barrel of [src]. Now it will fire .357 rounds.</span>")
		else
			to_chat(user, "<span class='notice'>You begin to revert the modifications to [src]...</span>")
			if(magazine.ammo_count())
				afterattack(user, user)	//and again
				user.visible_message("<span class='danger'>[src] goes off!</span>", "<span class='userdanger'>[src] goes off in your face!</span>")
				return
			if(do_after(user, 30*A.toolspeed, target = src))
				if(magazine.ammo_count())
					to_chat(user, "<span class='warning'>You can't modify it!</span>")
					return
				magazine.caliber = "38"
				desc = initial(desc)
				to_chat(user, "<span class='notice'>You remove the modifications on [src]. Now it will fire .38 rounds.</span>")


/obj/item/weapon/gun/ballistic/revolver/mateba
	name = "\improper Unica 6 auto-revolver"
	desc = "A retro high-powered autorevolver typically used by officers of the New Russia military. Uses .357 ammo."
	icon_state = "mateba"

/obj/item/weapon/gun/ballistic/revolver/golden
	name = "\improper Golden revolver"
	desc = "This ain't no game, ain't never been no show, And I'll gladly gun down the oldest lady you know. Uses .357 ammo."
	icon_state = "goldrevolver"
	fire_sound = 'sound/weapons/resonator_blast.ogg'
	recoil = 8
	pin = /obj/item/device/firing_pin

/obj/item/weapon/gun/ballistic/revolver/nagant
	name = "Nagant M1895"
	desc = "A gas-seal revolver designed and produced by Belgian industrialist Léon Nagant for the Russian Empire in 1895. Uses 7.62x38mmR ammo."
	icon_state = "nagant"
	item_state = "nagant"
	origin_tech = "combat=3"
	can_suppress = 1
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev762

/obj/item/weapon/gun/ballistic/revolver/thatgun
	name = "That Gun"
	desc = "What seems to be a 5.56mm revolving rifle cut down to a handgun-sized format. The grips read ''Deckard'' in very faded etching."
	icon_state = "thatgun"
	item_state = "thatgun"
	origin_tech = "combat=3"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/thatgun

/obj/item/weapon/gun/ballistic/revolver/lucky
	name = "Lucky"
	desc = "What looks to be a .500 S&W Magnum revolver in the platform of a single action army. Yikes."
	icon_state = "lucky"
	item_state = "lucky"
	origin_tech = "combat=3"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/magnum

/obj/item/weapon/gun/ballistic/revolver/coltsaa
	name = "Colt Model 1873"
	desc = "Designed in 1872 by William Mason and Charles Brinckerhoff Richards, the Model 1873 ''peacemaker'', ''Single action army'' and many other names it's received over time remains a popular classic as far as revolvers go. This particular post-1950's model appears to be chambered in .357 Magnum."
	icon_state = "coltsaa"
	item_state = "coltsaa"
	fire_sound = 'sound/f13weapons/357fire.ogg'
	origin_tech = "combat=3"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/coltsaa

/obj/item/weapon/gun/ballistic/revolver/coltsaashort
	name = "Colt Model 1873"
	desc = "Designed in 1872 by William Mason and Charles Brinckerhoff Richards, the Model 1873 ''peacemaker'', ''Single action army'' and many other names it's received over time remains a popular classic as far as revolvers go. This particular post-1950's model appears to be chambered in .357 Magnum, and is unique in the fact it comes with a 'birds head' set of grips and a three inch barrel. This model was often used by shopkeepers and bankers in the 1800's. Small enough to fit in a pocket"
	icon_state = "coltsaashort"
	item_state = "coltsaashort"
	fire_sound = 'sound/f13weapons/357fire.ogg'
	origin_tech = "combat=3"
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/coltsaa

/obj/item/weapon/gun/ballistic/revolver/model15
	name = "Smith & Wesson Model 15"
	desc = "The Smith & Wesson Model 15 is a classic revolver built on a K-Frame and chambered in .38 Special, originally known as the 'K-38 Combat Masterpiece'. Popular with law enforcement and psychiatrists hunting escaped mental patients everywhere before the nuclear fallout."
	icon_state = "model15"
	item_state = "model15"
	origin_tech = "combat=3"
	fire_sound = 'sound/weapons/loomisgun.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev38

/obj/item/weapon/gun/ballistic/revolver/model29
	name = "Smith & Wesson Model 29"
	desc = "The Smith & Wesson Model 29 is a six-shot, double action revolver built on an N-Frame and chambered for the .44 Remington Magnum cartridge and manufactured by the United States company Smith & Wesson since 1955. This particular model sports a six-inch barrel and factory wooden grips. Do you feel lucky? Well do ya', punk?"
	icon_state = "model29"
	item_state = "model29"
	origin_tech = "combat=3"
	fire_sound = 'sound/weapons/dirtyharrygunshot.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/m44

/obj/item/weapon/gun/ballistic/revolver/model629
	name = "Smith & Wesson Model 629"
	desc = "The Smith & Wesson Model 629 is a six-shot, double action revolver built on an N-Frame and chambered for the .44 Remington Magnum cartridge and manufactured by the United States company Smith & Wesson since 1978. This particular model sports a six-inch barrel and factory rubber grips. Dynamite, dynamite!"
	icon_state = "model629"
	item_state = "model629"
	origin_tech = "combat=3"
	fire_sound = 'sound/weapons/dirtyharrygunshot.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/m44

/obj/item/weapon/gun/ballistic/revolver/m1917
	name = "Smith & Wesson Model 1917"
	desc = "The Smith & Wesson Model 1917 was a six-shot double action revolver first produced in 1917 and chambered for the .45 ACP cartridge. Being that the .45 ACP was a rimless round that required half or full moon clips to load the cartridges, this particular model has had extensive work done to allow the rimless rounds to be extracted and loaded without moonclips, making reloading much less of a hassle."
	icon_state = "m1917"
	item_state = "m1917"
	origin_tech = "combat=3"
	fire_sound = 'sound/f13weapons/coltfire.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/model1917

/obj/item/weapon/gun/ballistic/revolver/stoker1917
	name = "Smith & Wesson Model 1917"
	desc = "The Smith & Wesson Model 1917 was a six-shot double action revolver first produced in 1917 and chambered for the .45 ACP cartridge. Being that the .45 ACP was a rimless round that required half or full moon clips to load the cartridges, this particular model has had extensive work done to allow the rimless rounds to be extracted and loaded without moonclips, making reloading much less of a hassle. This gun's factory wooden grips appear to have been replaced with pristine ones fashioned from mother of pearl, indiciating it may be a long-time personal weapon."
	icon_state = "stoker1917"
	item_state = "stoker1917"
	origin_tech = "combat=3"
	fire_sound = 'sound/f13weapons/coltfire.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/model1917

/obj/item/weapon/gun/ballistic/revolver/webley
	name = "Webley Mk IV"
	desc = "A classic Webley Mk IV revolver dating back to 1894. The finish seems to be mostly worn off leaving the gun's bare steel exposed, and the weapon itself is fitted with hard black plastic composite grips. This particular model is chambered in .455 Webley and sports a 4-inch barrel."
	icon_state = "webley"
	item_state = "webley"
	origin_tech = "combat=3"
	fire_sound = 'sound/f13weapons/coltfire.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/webley

/obj/item/weapon/gun/ballistic/revolver/policepistol
	name = "Colt New Service"
	desc = "The Colt New Service was a six-shot double action revolver first produced in 1898 and chambered in a variety of popular calibers, being manufactured for several years up until 1946. This particular model is chambered in .357 Magnum and seems to have had most of it's original blue finish worn off due to age, leaving the metal looking rather bare. The wooden grips are similarly weathered with age but effectively retain most of their checkering."
	icon_state = "policepistol"
	item_state = "policepistol"
	origin_tech = "combat=3"
	fire_sound = 'sound/f13weapons/policepistol.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/newservice

/obj/item/weapon/gun/ballistic/revolver/bulldog
	name = "Charter Arms Bulldog"
	desc = "The Charter Arms Bulldog is a traditional double action revolver chambered in .44 S&W Special designed by Doug McClenahan and produced by Charter Arms starting in 1973. The gun features a solid matte black finish and somewhat oversized wooden grips to make shooting more comfortable on the user's hands. It also sports a 3-inch barrel making it easier to conceal, and has a cylinder capacity of five rounds."
	icon_state = "charterbulldog"
	item_state = "charterbulldog"
	origin_tech = "combat=3"
	fire_sound = 'sound/weapons/dirtyharrygunshot.ogg'
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/bulldog

/obj/item/weapon/gun/ballistic/revolver/bulldogstainless
	name = "Charter Arms Bulldog"
	desc = "The Charter Arms Bulldog is a traditional double action revolver chambered in .44 S&W Special designed by Doug McClenahan and produced by Charter Arms starting in 1973. The gun features a polished stainless steel finish and somewhat oversized rubber grips to make shooting more comfortable on the user's hands. It also sports a 3-inch barrel making it easier to conceal, and has a cylinder capacity of five rounds."
	icon_state = "charterbulldogstainless"
	item_state = "charterbulldogstainless"
	origin_tech = "combat=3"
	fire_sound = 'sound/weapons/dirtyharrygunshot.ogg'
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/bulldog

/obj/item/weapon/gun/ballistic/revolver/webleysnub
	name = "Webley Mk IV"
	desc = "A classic Webley Mk IV revolver dating back to 1894. The finish seems to be mostly worn off leaving the gun's bare steel exposed, and the weapon itself is fitted with hard black plastic composite grips. This particular model is chambered in .455 Webley and sports a 2-inch barrel, small enough to fit into your shoes or pockets."
	icon_state = "webleysnub"
	item_state = "webleysnub"
	origin_tech = "combat=3"
	fire_sound = 'sound/f13weapons/coltfire.ogg'
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/webley

/obj/item/weapon/gun/ballistic/revolver/stokerwebley
	name = "Webley Mk IV"
	desc = "A classic Webley Mk IV revolver dating back to 1894. The finish seems to be matte black oxide over steel, and the weapon itself is fitted with mahogany wood grips. This particular model is chambered in .455 Webley and sports a 2-inch barrel, small enough to fit into your shoes or pockets."
	icon_state = "stokerwebley"
	item_state = "stokerwebley"
	origin_tech = "combat=3"
	fire_sound = 'sound/f13weapons/coltfire.ogg'
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/webley

/obj/item/weapon/gun/ballistic/revolver/webleynickel
	name = "Webley Mk IV"
	desc = "A classic Webley Mk IV revolver dating back to 1894. The finish seems to be quite intact and made from fine nickel, and is fitted with hard black plastic composite grips. This particular model is chambered in .455 Webley and sports a 2-inch barrel, small enough to fit into your shoes or pockets."
	icon_state = "webleynickel"
	item_state = "webleynickel"
	origin_tech = "combat=3"
	fire_sound = 'sound/f13weapons/coltfire.ogg'
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/webley

/obj/item/weapon/gun/ballistic/revolver/model10
	name = "Smith & Wesson Model 10"
	desc = "The Smith & Wesson Model 10 is a classic revolver built on a K-Frame and chambered in .38 Special, originally known as the 'Smith & Wesson .38 Hand Ejector' or 'Smith & Wesson Military & Police'. Popular with law enforcement, militaries, and civillians worldwide before the nuclear fallout."
	icon_state = "model10"
	item_state = "model10"
	origin_tech = "combat=3"
	fire_sound = 'sound/weapons/loomisgun.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev38

/obj/item/weapon/gun/ballistic/revolver/model10snub
	name = "Smith & Wesson Model 10"
	desc = "The Smith & Wesson Model 10 is a classic revolver built on a K-Frame and chambered in .38 Special, originally known as the 'Smith & Wesson .38 Hand Ejector' or 'Smith & Wesson Military & Police'. Popular with law enforcement, militaries, and civillians worldwide before the nuclear fallout. This one appears to have a 2-inch barrel and very well polished ivory grips, small enough to fit into your shoes or pockets."
	icon_state = "model10snub"
	item_state = "model10snub"
	origin_tech = "combat=3"
	fire_sound = 'sound/weapons/loomisgun.ogg'
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev38

/obj/item/weapon/gun/ballistic/revolver/model66
	name = "Smith & Wesson Model 66"
	desc = "The Smith & Wesson Model 66 is a stainless steel .357 Magnum revolver introduced in 1972 and built on a K-Frame. Popular with law enforcement, militaries, and civillians worldwide before the nuclear fallout. This one appears to have a 2-inch barrel and factory wooden grips, small enough to fit into your shoes or pockets."
	icon_state = "model66"
	item_state = "model66"
	origin_tech = "combat=3"
	fire_sound = 'sound/f13weapons/357fire.ogg'
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/model66

/obj/item/weapon/gun/ballistic/revolver/model19
	name = "Smith & Wesson Model 19"
	desc = "The Smith & Wesson Model 19 is a blued .357 Magnum revolver introduced in 1957 and built on a K-Frame. Popular with law enforcement, militaries, and civillians worldwide before the nuclear fallout. This one appears to have a 2-inch barrel and factory wooden grips, small enough to fit into your shoes or pockets."
	icon_state = "model19"
	item_state = "model19"
	origin_tech = "combat=3"
	fire_sound = 'sound/f13weapons/357fire.ogg'
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/model66

/obj/item/weapon/gun/ballistic/revolver/sp101
	name = "Ruger SP101"
	desc = " The Ruger SP101 is a double-action revolver produced by the American company Sturm, Ruger. They remain popular for their small frame and all steel construction, and the gun itself features a five round cylinder capacity alongside synthetic rubber grips and a brushed stainless finish."
	icon_state = "sp101"
	item_state = "sp101"
	origin_tech = "combat=3"
	fire_sound = 'sound/f13weapons/357fire.ogg'
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/sp101

/obj/item/weapon/gun/ballistic/revolver/stokersp101
	name = "Ruger SP101"
	desc = " The Ruger SP101 is a double-action revolver produced by the American company Sturm, Ruger. They remain popular for their small frame and all steel construction, and the gun itself features a five round cylinder capacity alongside a brushed stainless finish. It appears to have been fitted with custom stag horn grips, indicating it may be a long-time personal weapon."
	icon_state = "stokersp101"
	item_state = "stokersp101"
	origin_tech = "combat=3"
	fire_sound = 'sound/f13weapons/357fire.ogg'
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/sp101

/obj/item/weapon/gun/ballistic/revolver/model460
	name = "Smith & Wesson Model 460 ES"
	desc = "The Smith & Wesson Model 460 is a large bore double-action revolver produced by Smith & Wesson and chambered for the massive .460 S&W Magnum cartridge. It was designed as a hunting and dangerous game firearm for use in Africa and Alaska. The revolver is built on the company's largest and strongest frame, the X-Frame. This particular model bears the ''ES'' designation, standing for Emergency Survival, and sports the smallest barrel length of the line at two inches."
	icon_state = "model460"
	item_state = "model460"
	origin_tech = "combat=3"
	fire_sound = 'sound/f13weapons/rolandgunshot.ogg'
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/model460

/obj/item/weapon/gun/ballistic/revolver/model500
	name = "Smith & Wesson Model 500"
	desc = "The Smith & Wesson Model 500 is a large bore double-action revolver produced by Smith & Wesson and chambered for the massive .500 S&W Magnum cartridge. It was designed as a hunting and dangerous game firearm for use in Africa and Alaska. The revolver is built on the company's largest and strongest frame, the X-Frame. This particular model features a heavily customized and slightly extended barrel with a rail-mounted laser sight and fine mahogany wood grips that bear a handsome brass medallion on either panel."
	icon_state = "handcannon"
	item_state = "handcannon"
	icon = 'icons/fallout/objects/guns/handcannon.dmi'
	origin_tech = "combat=3"
	fire_sound = 'sound/f13weapons/handcannon.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/model500

/obj/item/weapon/gun/ballistic/revolver/derringer
	name = "Cobra Derringer"
	desc = "The Cobra Derringer was originally released as the Davis Derringer in 1982. When the Davis company went bankrupt in 1998 the designs and tooling for the pistol were bought by Cobra Firearms, who have produced various versions of the pistol ever since. This particular model is known as part of the ''big bore'' series of Derringers, due to being chambered in.357 Magnum. It appears to be a personal weapon, due to the extensive gold decorations on it's controls and classy mother of pearl grips fitted onto it. Small enough to fit into your shoes or pockets."
	icon_state = "derringer"
	item_state = "derringer"
	origin_tech = "combat=3"
	fire_sound = 'sound/f13weapons/357fire.ogg'
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/derringer

/obj/item/weapon/gun/ballistic/revolver/python
	name = "Colt Python"
	desc = "The Colt Python is a revolver formerly manufactured by Colt's Manufacturing Company of Hartford Connecticut, chambered in .357 Magnum. It was first introduced in 1955 and formally discontinued in 2005, making it highly sought after. This particular model is made from stainless steel and sports a full 6-inch barrel with factory wooden grips."
	icon_state = "python"
	item_state = "python"
	origin_tech = "combat=3"
	fire_sound = 'sound/f13weapons/357fire.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/python

/obj/item/weapon/gun/ballistic/revolver/anaconda
	name = "Custom Colt Anaconda"
	desc = "The Colt Anaconda is a revolver formerly manufactured by Colt's Manufacturing Company of Hartford Connecticut, chambered in .44 Remington Magnum. It was first introduced in 1990 and formally discontinued in 2003, making it highly sought after. This particular model is made from stainless steel and sports a full 6-inch barrel with custom walnut grips bearing a strange umbrella-like medallion in the center of them."
	icon_state = "anaconda"
	item_state = "anaconda"
	origin_tech = "combat=3"
	fire_sound = 'sound/weapons/dirtyharrygunshot.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/anaconda

/obj/item/weapon/gun/ballistic/revolver/johnpython
	name = "Custom Colt Python"
	desc = "The Colt Python is a revolver formerly manufactured by Colt's Manufacturing Company of Hartford Connecticut, chambered in .357 Magnum. It was first introduced in 1955 and formally discontinued in 2005, making it highly sought after. This particular model has been refinished in blue-grey nitride and fitted with stag horn grips, it's previous owner presumably not considering the value of the gun before desecrating it so terribly."
	icon_state = "johnpython"
	item_state = "johnpython"
	origin_tech = "combat=3"
	fire_sound = 'sound/f13weapons/357fire.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/python

/obj/item/weapon/gun/ballistic/revolver/brinerpython
	name = "Colt Python"
	desc = "The Colt Python is a revolver formerly manufactured by Colt's Manufacturing Company of Hartford Connecticut, chambered in .357 Magnum. It was first introduced in 1955 and formally discontinued in 2005, making it highly sought after. This particular model is made from stainless steel and sports a 4-inch barrel with custom mother of pearl grips, indicating it must be a personal sidearm."
	icon_state = "brinerpython"
	item_state = "brinerpython"
	origin_tech = "combat=3"
	fire_sound = 'sound/f13weapons/357fire.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/python

/obj/item/weapon/gun/ballistic/revolver/model36
	name = "Smith & Wesson Model 36"
	desc = "The Smith & Wesson Model 36 is a classic revolver built on a J-Frame and chambered in .38 Special, sometimes known as the 'Chief's Special' due to it's introduction at the International Association of Chiefs of Police (IACP) convention in 1950. Popular with law enforcement and civillians worldwide before the nuclear fallout. Small enough to fit into your shoes or pockets."
	icon_state = "model36"
	item_state = "model36"
	origin_tech = "combat=3"
	fire_sound = 'sound/weapons/loomisgun.ogg'
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/model36

/obj/item/weapon/gun/ballistic/revolver/luke
	name = "Luke"
	desc = "A classic Smith & Wesson .500 Magnum revolver, heavily weathered from both use and surviving the initial nuclear fallout. In very faded lettering you can make out ''Luke'' scratched into either side of the barrel, presumably with a knife or other crude instrument."
	icon_state = "luke"
	item_state = "luke"
	origin_tech = "combat=3"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/luke

/obj/item/weapon/gun/ballistic/revolver/excalibur
	name = "Excalibur"
	desc = "Rumored to be one of the many guns melted down from the blade of Arthur Eld himself, this one seems to be chambered for .45 Colt or ''Long Colt'' as it is so often dubbed, fitted with sandalwood grips; and heavily engraved with a creed written in High Speech."
	icon_state = "excalibur"
	item_state = "excalibur"
	origin_tech = "combat=3"
	fire_sound = 'sound/f13weapons/rolandgunshot.ogg'
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/excalibur
	scopetype = /obj/screen/fullscreen/scope/long

/obj/item/weapon/gun/ballistic/revolver/highexcalibur
	name = "High Excalibur"
	desc = "A firearm blacksmithed from the legendary sword of Arthur Eld himself and passed down only to Gunslingers bearing his very blood, this one seems to be chambered for .45 Colt or ''Long Colt'' as it is so often dubbed, fitted with sandalwood grips; and radiating to it's very touch with a mysterious otherworldly vibe."
	icon_state = "highexcalibur"
	item_state = "highexcalibur"
	origin_tech = "combat=3"
	fire_sound = 'sound/f13weapons/rolandgunshot.ogg'
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/excalibur
	scopetype = /obj/screen/fullscreen/scope/long

/obj/item/weapon/gun/ballistic/revolver/elderexcalibur
	name = "Elder Excalibur"
	desc = "A firearm blacksmithed from the legendary sword of Arthur Eld himself and passed down only to Gunslingers bearing his very blood, this one seems to be chambered for .45 Colt or ''Long Colt'' as it is so often dubbed, fitted with sandalwood grips; and seems to lack the fancy engraving or chromed finish of other Excalibur firearms so as to indicate it belongs to a master Gunslinger."
	icon_state = "elderexcalibur"
	item_state = "elderexcalibur"
	origin_tech = "combat=3"
	fire_sound = 'sound/f13weapons/rolandgunshot.ogg'
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/excalibur
	scopetype = /obj/screen/fullscreen/scope/long

/obj/item/weapon/gun/ballistic/revolver/sandalwood
	name = "Sandalwood-gripped revolver"
	desc = "Being an entirely different beast from all of the ''Excalibur'' revolvers, there are only two of these weapons (that we know of) in existence. The sandalwood grips of the gun have never lost their fragrance and near the muzzle of each gun can be seen scroll work which translates to ''White'', which was Arthur's dinh mark. They were presumably made using the melted down blue-grey steel of the aforementioned sword, Excalibur, and have the rose, the sign of the Eld, engraved in the side. A firearm lost to the ages of Mid-World, it appears to heavily resemble a Colt Walker but has been converted to fire metalic .45 Colt cartridges, and seems to have had it's cylinder modified to be removable for fast reloading with a spare one, similarly to a Remington 1858."
	icon_state = "sandalwood"
	item_state = "sandalwood"
	origin_tech = "combat=3"
	fire_sound = 'sound/f13weapons/rolandgunshot.ogg'
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/sandalwood
	scopetype = /obj/screen/fullscreen/scope/long
	zoomable = TRUE
	zoom_amt = 14

/obj/item/weapon/gun/ballistic/revolver/coltnavy
	name = "Colt 1851 Navy"
	desc = "A classic civil war firearm that has been heavily modified, most notably in the fact that it is no longer able to fire using percussion caps, rather it has been converted to fire modern .38 Special cartridges and the cylinder is interchangeable for fast reloading - similarly to the Remington 1858."
	icon_state = "navy"
	item_state = "navy"
	origin_tech = "combat=3"
	fire_sound = 'sound/weapons/loomisgun.ogg'
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/navy

/obj/item/weapon/gun/ballistic/revolver/m1849
	name = "Colt 1849 Pocket"
	desc = "The Colt 1849 Pocket Model was a smaller version of the 1851 Navy, with about 340,000 produced between 1850 and 1873, more 1849 Pocket revolvers were manufactured than any other Colt percussion firearm. Made in a variety of barrel lengths, the 4-inch barreled version was the most popular with those wanting a concealable revolver. This one has been heavily modified, most notably in the fact that it is no longer able to fire using percussion caps, rather it has been converted to fire modern .38 Special cartridges and the cylinder is interchangeable for fast reloading - similarly to the Remington 1858. The gun itself appears to have strengthened metallurgy in order to handle the modern cartridge pressures, and features a sleek nickel finish."
	icon_state = "m1849"
	item_state = "m1849"
	origin_tech = "combat=3"
	w_class = WEIGHT_CLASS_SMALL
	fire_sound = 'sound/weapons/loomisgun.ogg'
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/navy

/obj/item/weapon/gun/ballistic/revolver/coltwalker
	name = "Colt Walker"
	desc = "Quite possibly the meanest handgun of the 1800's, the Colt Walker was designed in 1846 as a collaboration between Captain Samuel Hamilton Walker and American firearms inventor Samuel Colt. This one is unique in the fact that it is no longer able to fire using percussion caps, and it has been converted to fire modern .44 Remington Magnum cartridges and the cylinder is interchangeable for fast reloading - similarly to the Remington 1858. The metallurgy must've been strengthened immensely if it's using .44 Magnum rounds"
	icon_state = "walker"
	item_state = "walker"
	fire_sound = 'sound/f13weapons/rolandgunshot.ogg'
	origin_tech = "combat=3"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/walker

// A gun to play Russian Roulette!
// You can spin the chamber to randomize the position of the bullet.

/obj/item/weapon/gun/ballistic/revolver/russian
	name = "\improper russian revolver"
	desc = "A Russian-made revolver for drinking games. Uses .357 ammo, and has a mechanism requiring you to spin the chamber before each trigger pull."
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rus357
	var/spun = FALSE

/obj/item/weapon/gun/ballistic/revolver/russian/New()
	..()
	do_spin()
	spun = TRUE
	update_icon()

/obj/item/weapon/gun/ballistic/revolver/russian/attackby(obj/item/A, mob/user, params)
	..()
	if(get_ammo() > 0)
		spin()
		spun = TRUE
	update_icon()
	A.update_icon()
	return

/obj/item/weapon/gun/ballistic/revolver/russian/attack_self(mob/user)
	if(!spun && can_shoot())
		spin()
		spun = TRUE
		return
	..()

/obj/item/weapon/gun/ballistic/revolver/russian/afterattack(atom/target, mob/living/user, flag, params)
	if(flag)
		if(!(target in user.contents) && ismob(target))
			if(user.a_intent == INTENT_HARM) // Flogging action
				return

	if(isliving(user))
		if(!can_trigger_gun(user))
			return
	if(target != user)
		if(ismob(target))
			to_chat(user, "<span class='warning'>A mechanism prevents you from shooting anyone but yourself!</span>")
		return

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(!spun)
			to_chat(user, "<span class='warning'>You need to spin the revolver's chamber first!</span>")
			return

		spun = FALSE

		if(chambered)
			var/obj/item/ammo_casing/AC = chambered
			if(AC.fire_casing(user, user))
				playsound(user, fire_sound, 50, 1)
				var/zone = check_zone(user.zone_selected)
				var/obj/item/bodypart/affecting = H.get_bodypart(zone)
				if(zone == "head" || zone == "eyes" || zone == "mouth")
					shoot_self(user, affecting)
				else
					user.visible_message("<span class='danger'>[user.name] cowardly fires [src] at [user.p_their()] [affecting.name]!</span>", "<span class='userdanger'>You cowardly fire [src] at your [affecting.name]!</span>", "<span class='italics'>You hear a gunshot!</span>")
				chambered = null
				return

		user.visible_message("<span class='danger'>*click*</span>")
		playsound(user, 'sound/weapons/empty.ogg', 100, 1)

/obj/item/weapon/gun/ballistic/revolver/russian/proc/shoot_self(mob/living/carbon/human/user, affecting = "head")
	user.apply_damage(300, BRUTE, affecting)
	user.visible_message("<span class='danger'>[user.name] fires [src] at [user.p_their()] head!</span>", "<span class='userdanger'>You fire [src] at your head!</span>", "<span class='italics'>You hear a gunshot!</span>")

/obj/item/weapon/gun/ballistic/revolver/russian/soul
	name = "cursed russian revolver"
	desc = "To play with this revolver requires wagering your very soul."

/obj/item/weapon/gun/ballistic/revolver/russian/soul/shoot_self(mob/living/user)
	..()
	var/obj/item/device/soulstone/anybody/SS = new /obj/item/device/soulstone/anybody(get_turf(src))
	if(!SS.transfer_soul("FORCE", user)) //Something went wrong
		qdel(SS)
		return
	user.visible_message("<span class='danger'>[user.name]'s soul is captured by \the [src]!</span>", "<span class='userdanger'>You've lost the gamble! Your soul is forfiet!</span>")

/////////////////////////////
// DOUBLE BARRELED SHOTGUN //
/////////////////////////////

/obj/item/weapon/gun/ballistic/revolver/madmax
	name = "Sawn-off shotgun"
	desc = "A classic side by side shotgun featuring cut down barrels and a pistol grip in place of a stock. Oh, what a day. What a lovely day!"
	icon_state = "maxgun"
	item_state = "maxgun"
	w_class = WEIGHT_CLASS_NORMAL
	force = 10
	flags = CONDUCT
	slot_flags = SLOT_BELT
	mag_type = /obj/item/ammo_box/magazine/internal/shot/madmax

/obj/item/weapon/gun/ballistic/revolver/johnshotgun
	name = "Sawn-off shotgun"
	desc = "An over-under shotgun that has been shortened substantially, presumably to make it easier to conceal and to hold with a single hand. Chambered in 12 Gauge shells."
	icon_state = "johnshotgun"
	item_state = "johnshotgun"
	w_class = WEIGHT_CLASS_NORMAL
	force = 10
	flags = CONDUCT
	slot_flags = SLOT_BELT
	mag_type = /obj/item/ammo_box/magazine/internal/shot/madmax

/obj/item/weapon/gun/ballistic/revolver/doublebarrel
	name = "double-barreled shotgun"
	desc = "A true classic."
	icon_state = "dshotgun"
	item_state = "shotgun"
	w_class = WEIGHT_CLASS_BULKY
	force = 10
	flags = CONDUCT
	slot_flags = SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/internal/shot/dual
	sawn_desc = "Omar's coming!"
	unique_rename = 1
	unique_reskin = 1

/obj/item/weapon/gun/ballistic/revolver/doublebarrel/New()
	..()
	options["Default"] = "dshotgun"
	options["Dark Red Finish"] = "dshotgun-d"
	options["Ash"] = "dshotgun-f"
	options["Faded Grey"] = "dshotgun-g"
	options["Maple"] = "dshotgun-l"
	options["Rosewood"] = "dshotgun-p"
	options["Cancel"] = null

/obj/item/weapon/gun/ballistic/revolver/doublebarrel/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/ammo_box) || istype(A, /obj/item/ammo_casing))
		chamber_round()
	if(istype(A, /obj/item/weapon/melee/energy))
		var/obj/item/weapon/melee/energy/W = A
		if(W.active)
			sawoff(user)
	if(istype(A, /obj/item/weapon/circular_saw) || istype(A, /obj/item/weapon/gun/energy/plasmacutter))
		sawoff(user)

/obj/item/weapon/gun/ballistic/revolver/doublebarrel/attack_self(mob/living/user)
	var/num_unloaded = 0
	while (get_ammo() > 0)
		var/obj/item/ammo_casing/CB
		CB = magazine.get_round(0)
		chambered = null
		CB.forceMove(get_turf(src.loc))
		CB.update_icon()
		num_unloaded++
	if (num_unloaded)
		to_chat(user, "<span class='notice'>You break open \the [src] and unload [num_unloaded] shell\s.</span>")
	else
		to_chat(user, "<span class='warning'>[src] is empty!</span>")

// IMPROVISED SHOTGUN //

/obj/item/weapon/gun/ballistic/revolver/doublebarrel/improvised
	name = "improvised shotgun"
	desc = "Essentially a tube that aims shotgun shells."
	icon_state = "ishotgun"
	item_state = "shotgun"
	w_class = WEIGHT_CLASS_BULKY
	force = 10
	slot_flags = null
	mag_type = /obj/item/ammo_box/magazine/internal/shot/improvised
	sawn_desc = "I'm just here for the gasoline."
	unique_rename = 0
	unique_reskin = 0
	var/slung = 0

/obj/item/weapon/gun/ballistic/revolver/doublebarrel/improvised/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/stack/cable_coil) && !sawn_state)
		var/obj/item/stack/cable_coil/C = A
		if(C.use(10))
			slot_flags = SLOT_BACK
			to_chat(user, "<span class='notice'>You tie the lengths of cable to the shotgun, making a sling.</span>")
			slung = 1
			update_icon()
		else
			to_chat(user, "<span class='warning'>You need at least ten lengths of cable if you want to make a sling!</span>")

/obj/item/weapon/gun/ballistic/revolver/doublebarrel/improvised/update_icon()
	..()
	if(slung)
		icon_state += "sling"

/obj/item/weapon/gun/ballistic/revolver/doublebarrel/improvised/sawoff(mob/user)
	. = ..()
	if(. && slung) //sawing off the gun removes the sling
		new /obj/item/stack/cable_coil(get_turf(src), 10)
		slung = 0
		update_icon()
