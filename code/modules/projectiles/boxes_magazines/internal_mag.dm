////////////////INTERNAL MAGAZINES//////////////////////

/obj/item/ammo_box/magazine/internal
	desc = "Oh god, this shouldn't be here"

//internals magazines are accessible, so replace spent ammo if full when trying to put a live one in
/obj/item/ammo_box/magazine/internal/give_round(obj/item/ammo_casing/R)
	return ..(R,1)



// Revolver internal mags
/obj/item/ammo_box/magazine/internal/cylinder
	name = "revolver cylinder"
	ammo_type = /obj/item/ammo_casing/a357
	caliber = "357"
	max_ammo = 7

/obj/item/ammo_box/magazine/internal/cylinder/ammo_count(countempties = 1)
	var/boolets = 0
	for(var/obj/item/ammo_casing/bullet in stored_ammo)
		if(bullet && (bullet.BB || countempties))
			boolets++

	return boolets

/obj/item/ammo_box/magazine/internal/cylinder/get_round(keep = 0)
	rotate()

	var/b = stored_ammo[1]
	if(!keep)
		stored_ammo[1] = null

	return b

/obj/item/ammo_box/magazine/internal/cylinder/proc/rotate()
	var/b = stored_ammo[1]
	stored_ammo.Cut(1,2)
	stored_ammo.Insert(0, b)

/obj/item/ammo_box/magazine/internal/cylinder/proc/spin()
	for(var/i in 1 to rand(0, max_ammo*2))
		rotate()


/obj/item/ammo_box/magazine/internal/cylinder/give_round(obj/item/ammo_casing/R, replace_spent = 0)
	if(!R || (caliber && R.caliber != caliber) || (!caliber && R.type != ammo_type))
		return 0

	for(var/i in 1 to stored_ammo.len)
		var/obj/item/ammo_casing/bullet = stored_ammo[i]
		if(!bullet || !bullet.BB) // found a spent ammo
			stored_ammo[i] = R
			R.forceMove(src)

			if(bullet)
				bullet.forceMove(get_turf(src.loc))
			return 1

	return 0

/obj/item/ammo_box/magazine/internal/cylinder/rev38
	name = ".38 revolver cylinder"
	ammo_type = /obj/item/ammo_casing/c38
	caliber = "38"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/model36
	name = "Smith & Wesson Model 36 cylinder"
	ammo_type = /obj/item/ammo_casing/c38
	caliber = "38"
	max_ammo = 5

/obj/item/ammo_box/magazine/internal/cylinder/model66
	name = "Smith & Wesson Model 66 revolver cylinder"
	ammo_type = /obj/item/ammo_casing/a357
	caliber = "357"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/newservice
	name = "Colt New Service revolver cylinder"
	ammo_type = /obj/item/ammo_casing/a357
	caliber = "357"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/derringer
	name = "Cobra Derringer barrel"
	ammo_type = /obj/item/ammo_casing/a357
	caliber = "357"
	max_ammo = 2

/obj/item/ammo_box/magazine/internal/cylinder/python
	name = "Colt Python revolver cylinder"
	ammo_type = /obj/item/ammo_casing/a357
	caliber = "357"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/anaconda
	name = "Colt Anaconda revolver cylinder"
	ammo_type = /obj/item/ammo_casing/m44
	caliber = "44mm"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/sp101
	name = "Ruger SP101 revolver cylinder"
	ammo_type = /obj/item/ammo_casing/a357
	caliber = "357"
	max_ammo = 5

/obj/item/ammo_box/magazine/internal/cylinder/model460
	name = "Smith & Wesson Model 460 ES revolver cylinder"
	ammo_type = /obj/item/ammo_casing/a460
	caliber = "460"
	max_ammo = 5

/obj/item/ammo_box/magazine/internal/cylinder/model1917
	name = "Smith & Wesson Model 1917 revolver cylinder"
	ammo_type = /obj/item/ammo_casing/c45
	caliber = ".45"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/webley
	name = "Webley Mk IV revolver cylinder"
	ammo_type = /obj/item/ammo_casing/a455
	caliber = "455"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/bulldog
	name = "Charter Arms Bulldog revolver cylinder"
	ammo_type = /obj/item/ammo_casing/a44spl
	caliber = "44spl"
	max_ammo = 5

/obj/item/ammo_box/magazine/internal/cylinder/grenademulti
	name = "grenade launcher internal magazine"
	ammo_type = /obj/item/ammo_casing/a40mm
	caliber = "40mm"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/rev762
	name = "nagant revolver cylinder"
	ammo_type = /obj/item/ammo_casing/n762
	caliber = "n762"
	max_ammo = 7

/obj/item/ammo_box/magazine/internal/cylinder/thatgun
	name = "That Gun's cylinder"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = "a556"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/magnum
	name = "Magnum revolver cylinder"
	ammo_type = /obj/item/ammo_casing/a500
	caliber = "500"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/model500
	name = "Smith & Wesson model 500 revolver cylinder"
	ammo_type = /obj/item/ammo_casing/a500
	caliber = "500"
	max_ammo = 5

/obj/item/ammo_box/magazine/internal/cylinder/excalibur
	name = "Excalibur revolver cylinder"
	ammo_type = /obj/item/ammo_casing/a45colt
	caliber = "45"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/sandalwood
	name = "Sandalwood-gripped revolver cylinder"
	ammo_type = /obj/item/ammo_casing/a45colt
	caliber = "45"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/navy
	name = "Colt 1851 Navy cylinder"
	ammo_type = /obj/item/ammo_casing/c38
	caliber = "38"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/walker
	name = "Colt Walker cylinder"
	ammo_type = /obj/item/ammo_casing/m44
	caliber = "44mm"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/coltsaa
	name = "Colt Model 1873 cylinder"
	ammo_type = /obj/item/ammo_casing/a357
	caliber = "357"
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/cylinder/luke
	name = "Magnum revolver cylinder"
	ammo_type = /obj/item/ammo_casing/a500
	caliber = "500"
	max_ammo = 5


// Shotgun internal mags
/obj/item/ammo_box/magazine/internal/shot
	name = "shotgun internal magazine"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	caliber = "shotgun"
	max_ammo = 4
	multiload = 0

/obj/item/ammo_box/magazine/internal/shot/ammo_count(countempties = 1)
	if (!countempties)
		var/boolets = 0
		for(var/obj/item/ammo_casing/bullet in stored_ammo)
			if(bullet.BB)
				boolets++
		return boolets
	else
		return ..()


/obj/item/ammo_box/magazine/internal/shot/tube
	name = "dual feed shotgun internal tube"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	max_ammo = 4

/obj/item/ammo_box/magazine/internal/shot/lethal
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot

/obj/item/ammo_box/magazine/internal/shot/com
	name = "combat shotgun internal magazine"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/shot/dual
	name = "double-barrel shotgun internal magazine"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	max_ammo = 2

/obj/item/ammo_box/magazine/internal/trenchgun
	name = "Winchester Model 1897 internal magazine"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	max_ammo = 5

/obj/item/ammo_box/magazine/internal/shot/madmax
	name = "double-barrel shotgun internal magazine"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	max_ammo = 2

/obj/item/ammo_box/magazine/internal/shot/improvised
	name = "improvised shotgun internal magazine"
	ammo_type = /obj/item/ammo_casing/shotgun/improvised
	max_ammo = 1

/obj/item/ammo_box/magazine/internal/shot/riot
	name = "riot shotgun internal magazine"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	max_ammo = 6




/obj/item/ammo_box/magazine/internal/grenadelauncher
	name = "grenade launcher internal magazine"
	ammo_type = /obj/item/ammo_casing/a40mm
	caliber = "40mm"
	max_ammo = 1

/obj/item/ammo_box/magazine/internal/rocketlauncher
	name = "grenade launcher internal magazine"
	ammo_type = /obj/item/ammo_casing/caseless/a84mm
	caliber = "84mm"
	max_ammo = 1

/obj/item/ammo_box/magazine/internal/speargun
	name = "speargun internal magazine"
	ammo_type = /obj/item/ammo_casing/caseless/magspear
	caliber = "speargun"
	max_ammo = 1

/obj/item/ammo_box/magazine/internal/cylinder/rus357
	name = "russian revolver cylinder"
	ammo_type = /obj/item/ammo_casing/a357
	caliber = "357"
	max_ammo = 6
	multiload = 0

/obj/item/ammo_box/magazine/internal/rus357/New()
	stored_ammo += new ammo_type(src)
	..()

/obj/item/ammo_box/magazine/internal/boltaction
	name = "bolt action rifle internal magazine"
	desc = "Oh god, this shouldn't be here"
	ammo_type = /obj/item/ammo_casing/a762
	caliber = "a762"
	max_ammo = 5
	multiload = 1

/obj/item/ammo_box/magazine/internal/boltaction/enchanted
	max_ammo = 1
	ammo_type = /obj/item/ammo_casing/a762/enchanted

/obj/item/ammo_box/magazine/internal/boltaction/enchanted/arcane_barrage
	ammo_type = /obj/item/ammo_casing/magic/arcane_barrage

/obj/item/ammo_box/magazine/internal/shot/toy
	ammo_type = /obj/item/ammo_casing/caseless/foam_dart
	caliber = "foam_force"
	max_ammo = 4

/obj/item/ammo_box/magazine/internal/shot/toy/crossbow
	max_ammo = 5

/obj/item/ammo_box/magazine/internal/minigun
	name = "gatling gun fusion core"
	ammo_type = /obj/item/ammo_casing/caseless/laser/gatling
	caliber = "gatling"
	max_ammo = 1
/obj/item/ammo_box/magazine/internal/minigun/get_round(keep = 0)
	return stored_ammo[1]


/obj/item/ammo_box/magazine/internal/bow
	name = "bow internal magazine"
	ammo_type = /obj/item/ammo_casing/caseless/arrow
	caliber = "arrow"
	max_ammo = 1
