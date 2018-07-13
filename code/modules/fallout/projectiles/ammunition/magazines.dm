//Fallout 13 firearms ammo directory

/obj/item/ammo_box/magazine/m10mm
	name = "pistol magazine (10mm)"
	icon_state = "9x19p"
	origin_tech = "combat=2"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = "10mm"
	max_ammo = 8
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m10mm_adv
	name = "pistol magazine (10mm) advanced"
	icon_state = "9x19p"
	origin_tech = "combat=3"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = "10mm"
	max_ammo = 12
	multiple_sprites = 2

/obj/item/ammo_box/magazine/browning
	name = "pistol magazine (9mm)"
	icon_state = "browningmag"
	origin_tech = "combat=3"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 13
	multiple_sprites = 2

/obj/item/ammo_box/magazine/luger
	name = "pistol magazine (9mm)"
	icon_state = "lugermag"
	origin_tech = "combat=3"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 8
	multiple_sprites = 2

/obj/item/ammo_box/magazine/silverghostmag
	name = "pistol magazine (9mm)"
	icon_state = "silverghostmag"
	origin_tech = "combat=3"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 25
	multiple_sprites = 2

/obj/item/ammo_box/magazine/killersevenmag
	name = "pistol magazine (.460 S&W Magnum)"
	icon_state = "killersevenmag"
	origin_tech = "combat=3"
	ammo_type = /obj/item/ammo_casing/a460
	caliber = "460"
	max_ammo = 7
	multiple_sprites = 2

/obj/item/ammo_box/magazine/vp70
	name = "pistol magazine (9mm)"
	icon_state = "vp70mag"
	origin_tech = "combat=3"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 18
	multiple_sprites = 2

/obj/item/ammo_box/magazine/mauser
	name = "pistol magazine (9mm)"
	icon_state = "mausermag"
	origin_tech = "combat=3"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 10
	multiple_sprites = 2

/obj/item/ammo_box/magazine/ninepistol
	name = "pistol magazine (9mm)"
	icon_state = "ninemag"
	origin_tech = "combat=3"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 15
	multiple_sprites = 2

/obj/item/ammo_box/magazine/norinco
	name = "pistol magazine (9mm)"
	icon_state = "norincomag"
	origin_tech = "combat=3"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 8
	multiple_sprites = 2

/obj/item/ammo_box/magazine/glock
	name = "pistol magazine (.45)"
	icon_state = "browningmag"
	origin_tech = "combat=3"
	ammo_type = /obj/item/ammo_casing/c45
	caliber = ".45"
	max_ammo = 13
	multiple_sprites = 2

/obj/item/ammo_box/magazine/springfield
	name = "pistol magazine (.45)"
	icon_state = "browningmag"
	origin_tech = "combat=3"
	ammo_type = /obj/item/ammo_casing/c45
	caliber = ".45"
	max_ammo = 13
	multiple_sprites = 2

/obj/item/ammo_box/magazine/mp443
	name = "pistol magazine (9mm)"
	icon_state = "mp443mag"
	origin_tech = "combat=3"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 18
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m10mm_auto
	name = "smg magazine (10mm)"
	icon_state = "smg9mm"
	origin_tech = "combat=3"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = "10mm"
	max_ammo = 42
	multiple_sprites = 2

/obj/item/ammo_box/magazine/smg9mm
	name = "smg magazine (9mm)"
	icon_state = "smg9mm"
	origin_tech = "combat=3"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 30
	multiple_sprites = 2

/obj/item/ammo_box/magazine/internal/cylinder/m44
	name = ".44 Magnum ammunition"
	icon_state = "magnumammo"
	ammo_type = /obj/item/ammo_casing/m44
	caliber = "44mm"
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_casing/m44
	desc = "A .44 Remington Magnum bullet casing."
	caliber = "44mm"
	projectile_type = /obj/item/projectile/bullet
	randomspread = 1
	variance = 3

/obj/item/ammo_box/m44
	name = "speed loader (.44 Magnum)"
	desc = "Designed to quickly reload revolvers."
	icon_state = "magnumammo"
	ammo_type = /obj/item/ammo_casing/m44
	max_ammo = 6
	self_weight = 0.2
	multiple_sprites = 1

/obj/item/ammo_box/magazine/internal/shot/m308
	name = "rifle .308 magazine"
	ammo_type = /obj/item/ammo_casing/m308
	caliber = "308mm"
	max_ammo = 7

/obj/item/ammo_box/magazine/internal/shot/garand
	name = "en-bloc clip"
	desc = "A metallic clip designed to hold cartridges of ammunition before they're inserted into a rifle with an internal magazine."
	ammo_type = /obj/item/ammo_casing/m308
	icon_state = "enbloc"
	caliber = "308mm"
	max_ammo = 8
	multiple_sprites = 1

/obj/item/ammo_box/magazine/internal/shot/medicine
	name = "rifle .44 magazine"
	ammo_type = /obj/item/ammo_casing/m44
	caliber = "44mm"
	max_ammo = 8

/obj/item/ammo_box/magazine/internal/shot/henry
	name = "rifle .44 magazine"
	ammo_type = /obj/item/ammo_casing/m44
	caliber = "44mm"
	max_ammo = 10

/obj/item/ammo_box/magazine/internal/shot/henrytwo
	name = "rifle .357 magazine"
	ammo_type = /obj/item/ammo_casing/a357
	caliber = "357"
	max_ammo = 10

/obj/item/ammo_box/magazine/internal/shot/doublerifle
	name = "rifle .460 magazine"
	ammo_type = /obj/item/ammo_casing/a460
	caliber = "460"
	max_ammo = 2

/obj/item/ammo_box/magazine/internal/shot/doublerifleu
	name = "rifle .338 magazine"
	ammo_type = /obj/item/ammo_casing/a338
	caliber = "338"
	max_ammo = 2

/obj/item/ammo_box/magazine/internal/shot/winchester30
	name = "rifle .30-30 magazine"
	ammo_type = /obj/item/ammo_casing/a30winchester
	caliber = "30"
	max_ammo = 15

/obj/item/ammo_box/magazine/m308
	name = ".308 rifle magazine"
	ammo_type = /obj/item/ammo_casing/m308
	caliber = "308mm"
	icon_state = "75"
	max_ammo = 24
	multiple_sprites = 2

/obj/item/ammo_casing/m308
	desc = "A .308 bullet casing."
	caliber = "308mm"
	icon_state = "762-casing"
	projectile_type = /obj/item/projectile/bullet/midbullet3/ap
	randomspread = 1
	variance = 2

/obj/item/ammo_box/m308
	name = "ammo box (.308)"
	icon_state = "9mmbox"
	origin_tech = "combat=2"
	ammo_type = /obj/item/ammo_casing/m308
	max_ammo = 50

/obj/item/ammo_box/magazine/internal/shot/pipe
	name = "pipe gun magazine"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	max_ammo = 1

/obj/item/ammo_box/magazine/internal/shot/terminator
	name = "lever action shotgun magazine"
	ammo_type = /obj/item/ammo_casing/shotgun/decimator
	max_ammo = 5

/obj/item/ammo_box/magazine/internal/shot/lethal/trail
	max_ammo = 8

/obj/item/ammo_box/magazine/m223
	name = "bozar .223 magazine"
	ammo_type = /obj/item/ammo_casing/m223
	caliber = "223mm"
	icon_state = "75"
	max_ammo = 30
	multiple_sprites = 2

/obj/item/ammo_casing/m223
	desc = "A .223 bullet casing."
	caliber = "223mm"
	icon_state = "762-casing"
	projectile_type = /obj/item/projectile/bullet
	randomspread = 1
	variance = 3

/obj/item/ammo_box/m223
	name = "ammo box (.223)"
	icon_state = "9mmbox"
	origin_tech = "combat=2"
	ammo_type = /obj/item/ammo_casing/m223
	max_ammo = 50