//Fallout 13 ballistic firearms directory

/obj/item/weapon/gun/ballistic/automatic/pistol/n99
	name = "10mm pistol"
	desc = "The N99 self-loading pistol is known for its ability to survive in the harshest of conditions.<br>This great weapon is able to be reliably restored to working condition, even after extended exposure to hard elements without maintenance."
	icon_state = "n99"
	item_state = "n99"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/m10mm_adv
	fire_sound = "10mmfire"
	can_suppress = 1
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/pistol/n99/update_icon()
	..()
	icon_state = "[initial(icon_state)][magazine && magazine.max_ammo == 12 ? "-[magazine.max_ammo]" : ""][chambered ? "" : "-e"][suppressed ? "-suppressed" : ""]"
	return

/obj/item/weapon/gun/ballistic/automatic/pistol/mp443
	name = "MP443 pistol"
	desc = "The MP443, a pistol of Russian origin with quite a high magazine capacity. Good luck finding more ammo."
	icon_state = "mp443"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "mp443"
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/mp443
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/pistol/browning
	name = "9mm pistol"
	desc = "A Browning Hi-Power reproduction crafted by M&A Guns Manufacturers, fairly common throughout the wasteland. Chambered in 9x19mm."
	icon_state = "pistol9mm"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "pistol9mm"
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/browning
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/pistol/luger
	name = "chinese pistol"
	desc = "A classic .30 caliber (nine milimeter) Luger P08 chinese clone from WW2 surplus. This thing is older than the people shooting it."
	icon_state = "luger"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "luger"
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/luger
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/pistol/p38
	name = "Walther P38"
	desc = "The Walther P38 is a semi-automatic pistol that was developed by Walther arms as the service pistol of the Wehrmacht at the beginning of World War II. It was intended to replace the costly Luger P08, the production of which was scheduled to end in 1942. This particular pistol was the first locked-breech design to use an SA/DA trigger mechanism. The gun seems to have 100% of it's original factory blue finish and is fitted with sleek maple wood grips, making it likely this is a personal weapon. Chambered in 9x19mm."
	icon_state = "p38"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "p38"
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/luger
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/pistol/p38snub
	name = "Walther P38K"
	desc = "The Walther P38 is a semi-automatic pistol that was developed by Walther arms as the service pistol of the Wehrmacht at the beginning of World War II. It was intended to replace the costly Luger P08, the production of which was scheduled to end in 1942. This particular pistol was the first locked-breech design to use an SA/DA trigger mechanism. The gun looks to be a reproduction of the P38K model, a smaller and generally more concealable gun using the same magazines as the full sized P38. It features a parkerized finish and is fitted with classy mahogany wood grips. Chambered in 9x19mm."
	icon_state = "p38snub"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "p38snub"
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/luger
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_SMALL

/obj/item/weapon/gun/ballistic/automatic/pistol/lugerzim
	name = "Lange Pistole 08"
	desc = "The adoption of the Lange Pistole 08 or LP 08, aka the ''Artillery Luger'', was authorized by the German military on the 2nd of July 1913. This particular variation sports an 8-inch barrel, custom blue finish, and classy ivory grips with floral engraving. Bits of golden adornment such as on the extractor, frame screw and trigger suggest this firearm is worth quite a bit of pocket change."
	icon_state = "zimgun"
	icon = 'icons/fallout/objects/guns/zimgun.dmi'
	item_state = "zimgun"
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/luger
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/pistol/silverghostscope
	name = "Silver Ghost"
	desc = "A completely custom built handgun that appears to have taken it's design influence from various Smith & Wesson and H&K pistols alike. It's slide, barrel and hammer all seem to be forged from stainless steel whereas the frame is a mixture of polymer and aircraft alloy for a more than sturdy construction. The grip panels are a mixture of hard composite and treated oak wood, bearing a handsome brass medallion in the center. It comes with a standard double stack magazine capable of holding twenty five rounds, and seems to have a custom laser sight mounted on the picatinny rail to improve long distance shooting. Chambered in 9x19mm."
	icon_state = "silverghostscope"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "silverghostscope"
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/silverghostmag
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0
	zoomable = TRUE
	zoom_amt = 16
	scopetype = /obj/screen/fullscreen/scope/long
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/pistol/silverghost
	name = "Silver Ghost"
	desc = "A completely custom built handgun that appears to have taken it's design influence from various Smith & Wesson and H&K pistols alike. It's slide, barrel and hammer all seem to be forged from stainless steel whereas the frame is a mixture of polymer and aircraft alloy for a more than sturdy construction. The grip panels are a mixture of hard composite and treated oak wood, bearing a handsome brass medallion in the center. It comes with a standard double stack magazine capable of holding twenty five rounds. Chambered in 9x19mm."
	icon_state = "silverghost"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "silverghost"
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/silverghostmag
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/pistol/killerseven
	name = "Killer Seven"
	desc = "An offshoot reproduction of the LAR Grizzly semi-automatic pistol (itself based on the 1911), unique in the fact that unlike other large bore handguns it doesn't rely on a gas operated system to cycle cartridges and utilizes heavy springs and solid steel construction to handle the massive cartridge it fires with minimal recoil. There seems to be a large scope mounted to the slide, granting the shooter a much longer sight radius. Chambered in .460 S&W Magnum."
	icon_state = "killerseven"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "killerseven"
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/killersevenmag
	fire_sound = 'sound/f13weapons/rolandgunshot.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0
	zoomable = TRUE
	zoom_amt = 16
	scopetype = /obj/screen/fullscreen/scope/long
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/pistol/mauser
	name = "C96"
	desc = "What looks to be a WW2-era Mauser C96 broom handle pistol. It seems to be modified to have it's internal magazine exchanged with a more modern ten round box magazine."
	icon_state = "mauser"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "mauser"
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/mauser
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/pistol/hkp
	name = "H&K P30"
	desc = "A very modern Heckler & Koch P30 pistol, complete with a compensator to take revenge upon the men that stole your car and killed your dog. Uhh, wrong universe"
	icon_state = "hkp"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "hkp"
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/ninepistol
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/pistol/vp70
	name = "H&K VP70"
	desc = "The Heckler & Koch VP70 was the first mass produced semi-automatic pistol built on a polymer frame, predating Glock by twelve years. Translated from German, VP stands for Volkspistole or literally ''People's Pistol''. This particular model appears to be the VP70Z variant, indicating it is incapable of firing in three-round burst like the VP70M model when fitted with a stock. Has a magazine capacity of eighteen rounds and is chambered in 9x19mm."
	icon_state = "vp70"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "vp70"
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/vp70
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/vp70stock
	name = "H&K VP70"
	desc = "The Heckler & Koch VP70 was the first mass produced semi-automatic pistol built on a polymer frame, predating Glock by twelve years. Translated from German, VP stands for Volkspistole or literally ''People's Pistol''. This particular model appears to be the VP70M variant, indicating it is capable of firing in three-round burst unlike the VP70Z model when fitted with a stock. Has a magazine capacity of eighteen rounds and is chambered in 9x19mm."
	icon_state = "vp70stock"
	item_state = "vp70stock"
	icon = 'icons/fallout/objects/guns/vp70stock.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/vp70
	fire_sound = "sound/weapons/smithfire.ogg"
	can_suppress = 0
	burst_size = 3
	casing_ejector = 1
	slot_flags = SLOT_BACK
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/pistol/beretta
	name = "Beretta 92F"
	desc = "A dated Beretta 92F nine milimeter handgun. Yippee ki-yay, motherfucker"
	icon_state = "beretta"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "beretta"
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/ninepistol
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/pistol/samuraiedge
	name = "Custom Beretta 92F"
	desc = "A dated Beretta 92F nine milimeter handgun, with the added twist that it's slide and body have been given a royal blue finish as opposed to flat black, and the standard barrel has been replaced with one made entirely from stainless steel; as has the trigger. The factory plastic grip panels have been removed in favor of mahogany wood ones with composite inserts in the center, where a handsome brass medallion sits."
	icon_state = "samuraiedge"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "samuraiedge"
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/ninepistol
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/pistol/model1934
	name = "Beretta Model 1934"
	desc = "The Beretta Model 1934 is a compact, semi-automatic pistol which was issued as a standard service firearm to the Italian armed forces beginning in 1934. It is chambered for the 9mm Corto, more commonly known as the .380 ACP. Small enough to fit into your shoes or pockets."
	icon_state = "model1934"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "model1934"
	w_class = WEIGHT_CLASS_SMALL
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/c380
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0

/obj/item/weapon/gun/ballistic/automatic/pistol/model1908
	name = "Colt Model 1908"
	desc = "The Colt Model 1908 Pocket Hammerless is a .380 ACP caliber, self-loading, semi-automatic pistol designed by John Browning and built by Colt Patent Firearms Manufacturing Company of Hartford, Connecticut. Small enough to fit into your shoes or pockets."
	icon_state = "model1908"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "model1908"
	w_class = WEIGHT_CLASS_SMALL
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/c380
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0

/obj/item/weapon/gun/ballistic/automatic/pistol/glock42
	name = "Glock 42"
	desc = "The Glock pistol, sometimes referred to by the manufacturer as a Glock ''Safe Action'' pistol and colloquially as a Glock, is a series of polymer-framed, short recoil-operated, locked-breech semi-automatic pistols designed and produced by Glock Ges.m.b.H., located in Deutsch-Wagram, Austria. This particular model, the Glock 42, was introduced in 2014. The single-stack magazine is unique to this model, with a capacity of six rounds. It is Glock's smallest model ever made and was manufactured in the USA. Small enough to fit into your shoes or pockets."
	icon_state = "glock42"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "glock42"
	w_class = WEIGHT_CLASS_SMALL
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/c380small
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0

/obj/item/weapon/gun/ballistic/automatic/pistol/ppk
	name = "Walther PPK"
	desc = "The Walther PPK was a smaller version of the Walther PP with a shorter grip, barrel and frame, and reduced magazine capacity. A new two-piece wrap-around grip panel construction was used to conceal the exposed back strap. The smaller size made it more concealable than the original PP and hence better suited to plainclothes or undercover work for law enforcement. It was chambered in .380 ACP and released in 1930. Small enough to fit into your shoes or pockets."
	icon_state = "ppk"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "ppk"
	w_class = WEIGHT_CLASS_SMALL
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/c380small
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0

/obj/item/weapon/gun/ballistic/automatic/pistol/taurus
	name = "Taurus PT-92"
	desc = "A cheap and expendable knock-off of the Beretta 92FS manufactured by cheap and expendable people."
	icon_state = "taurus"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "taurus"
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/ninepistol
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/pistol/norinco
	name = "Norinco M213"
	desc = "A chinese knock-off of the classic Tokarev pistol, with the twist being that it's chambered for the common 9x19mm cartridge."
	icon_state = "norinco"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "norinco"
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/norinco
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/pistol/sm1912
	name = "Steyr Model 1912"
	desc = "The Steyr M1912, also known as the Steyr-Hahn, is a semi-automatic pistol developed in 1911 by the Austrian firm Steyr Mannlicher and designed by Karel Krnka, based on the mechanism of the Roth–Steyr M1907. The M1912 was originally chambered for the 9mm Steyr round, but after the annexation of Austria by Germany in 1938 the M1912 was taken into Wehrmacht service and about 60,000 were rechambered in 9mm Parabellum and remained in service until the end of the war. This seems to be one of those models, dipshit"
	icon_state = "sm1912"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "sm1912"
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/steyrmag
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 4
	fire_delay = 0
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/pistol/glock
	name = "Glock 21"
	desc = "An austrian made Glock 21 semi-automatic pistol chambered in .45 ACP."
	icon_state = "glock"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "glock"
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/glock
	fire_sound = 'sound/f13weapons/coltfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/pistol/springfield
	name = "Springfield Armory XD"
	desc = "A modern polymer framed semi-automatic pistol chambered in .45 ACP, noteworthy for it's reliability and Croatian origin."
	icon_state = "springfield"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "springfield"
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/springfield
	fire_sound = 'sound/f13weapons/coltfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/pistol/maria
	name = "Maria"
	desc = "A heavily customized Browning Hi-Power reproduction crafted by M&A Guns Manufacturers, special not only for it's nickel plating and gold trigger; but pearl grips depicting Our Lady of Guadalupe, a well known Catholic figure and a representation of the biblical Woman of the Apocalypse. Chambered in 9x19mm."
	icon_state = "maria"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "maria"
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/browning
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/pistol/stoker9mm
	name = "Browning Hi-Power"
	desc = "A classic Browning Hi-Power pistol chambered in 9x19mm, easily distinguished from the M&A reproduction by it's solid hammer and lack of stainless parts. It appears to have been fitted with custom stag horn grips, indicating it may be a long-time personal weapon."
	icon_state = "stoker9mm"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "stoker9mm"
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/browning
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/pistol/model1910
	name = "FN Model 1910"
	desc = "The Fabrique Nationale model 1910 was produced from the titular year all the way into the late 80's. This one is chambered in .32 ACP and has a significant amount of wear - as if it's been in a freezer for decades."
	icon_state = "model1910"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "model1910"
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/c32
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_SMALL

/obj/item/weapon/gun/ballistic/automatic/pistol/model639
	name = "Smith & Wesson Model 639"
	desc = "The Smith & Wesson Model 639 is a traditional double action semi-automatic pistol first produced in 1981, chambered in 9x19mm with a magazine capacity of eight rounds. The gun is made of stainless steel and has the original factory wooden grips on it."
	icon_state = "model639"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "model639"
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/smith
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/pistol/model6906
	name = "Smith & Wesson Model 6906"
	desc = "The Smith & Wesson Model 6906 is a traditional double action semi-automatic pistol first produced in 1989, chambered in 9x19mm with a magazine capacity of twelve rounds. The gun is made of stainless steel and has the original factory synthetic grips on it. Small enough to fit into your shoes or pockets."
	icon_state = "model6906"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "model6906"
	w_class = WEIGHT_CLASS_SMALL
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/smithmagsmall
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0

/obj/item/weapon/gun/ballistic/automatic/pistol/briner639
	name = "Smith & Wesson Model 639"
	desc = "The Smith & Wesson Model 639 is a traditional double action semi-automatic pistol first produced in 1981, chambered in 9x19mm with a magazine capacity of eight rounds. This particular gun seems to be a long time personal weapon, judging by the non-standard mother of pearl grips fitted onto it. The finish is worn, albeit cared for well over the years"
	icon_state = "briner639"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "briner639"
	w_class = 2
	force = 13
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/smith
	fire_sound = 'sound/weapons/smithfire.ogg'
	can_suppress = 0
	burst_size = 1
	fire_delay = 0
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/revolver/magnum
	name = ".44 Magnum Revolver"
	icon_state = "44magnum"
	desc = "What seems to be a cheap NCR made knock-off of a Smith & Wesson Model 29, chambered in .44 Remington Magnum. Quite a common firearm to be found in the wastes."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "44magnum"
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/m44
	can_suppress = 0
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'
	burst_size = 1
	casing_ejector = 0
	zoomable = TRUE
	zoom_amt = 7
	w_class = WEIGHT_CLASS_NORMAL
	self_weight = 0.85
	recoil = 2
	scopetype = /obj/screen/fullscreen/scope/short

/obj/item/weapon/gun/ballistic/revolver/mysterious
	name = "Mysterious Magnum"
	icon_state = "mysteriousmagnum"
	desc = "You're not quite sure why, but you feel like a desperado when holding this .44 Magnum revolver. Stylish pearl grips are a must!"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "mysteriousmagnum"
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/m44
	can_suppress = 0
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'
	burst_size = 1
	casing_ejector = 0
	zoomable = TRUE
	zoom_amt = 7
	w_class = WEIGHT_CLASS_NORMAL
	self_weight = 0.85
	recoil = 2
	scopetype = /obj/screen/fullscreen/scope/short

/obj/item/weapon/gun/ballistic/revolver/ruger
	name = "Ruger Blackhawk"
	icon_state = "ruger"
	desc = "A stainless steel Ruger Blackhawk single-action revolver chambered in .44 Remington Magnum. It looks like a rather uncommon gun for the wasteland"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "ruger"
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/m44
	can_suppress = 0
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'
	burst_size = 1
	casing_ejector = 0
	zoomable = TRUE
	zoom_amt = 7
	w_class = WEIGHT_CLASS_NORMAL
	self_weight = 0.85
	recoil = 2
	scopetype = /obj/screen/fullscreen/scope/short

/obj/item/weapon/gun/ballistic/automatic/pistol/redeagle
	name = "Desert Eagle"
	desc = "A nickel plated Desert Eagle Mark XIX semi-automatic pistol, bearing heavily modified wooden grips. Judging by the strange serial number and limited quantity, it can be assumed these were custom made for a private law enforcement agency."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "redeagle"
	item_state = "redeagle"
	w_class = WEIGHT_CLASS_NORMAL
	force = 14
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'
	mag_type = /obj/item/ammo_box/magazine/m440
	can_suppress = 0
	recoil = 3

/obj/item/weapon/gun/ballistic/automatic/pistol/gatdeagle
	name = "Desert Eagle"
	desc = "A black nitride Desert Eagle Mark XIX semi-automatic pistol, bearing heavily modified synthetic purple grips adorned with a solid gold Fleur-de-lis symbol and a magazine loaded with a special sort of hemorrhaging ammunition. Not only is it chambered in the uncommon .440 Cor-Bon cartridge, but it just seems too large and impractical to use in a real fight. You can never have too many guns."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "gatdeagle"
	item_state = "gatdeagle"
	w_class = WEIGHT_CLASS_NORMAL
	force = 14
	fire_sound = 'sound/weapons/dirtyharrygunshot.ogg'
	mag_type = /obj/item/ammo_box/magazine/m440/bleed
	can_suppress = 0
	recoil = 1

/obj/item/weapon/gun/ballistic/automatic/pistol/redeagletwo
	name = "Desert Eagle"
	desc = "A Desert Eagle Mark XIX semi-automatic pistol fitted with an uncommon 10-inch barrel, bearing heavily modified wooden grips. The entire upper half of the weapon (slide & barrel) seems to have been blued, whereas the frame, controls and hammer appear to be plated with a sleek brushed gold finish. Judging by the strange serial number and limited quantity, it can be assumed these were custom made for a private law enforcement agency. With the drastic modifications made to this model, it's an educated guess they were made for police lieutenants and other high ranking law enforcement officers with a ceremonial purpose in mind."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "redeagletwo"
	item_state = "redeagletwo"
	w_class = WEIGHT_CLASS_NORMAL
	force = 14
	zoomable = TRUE
	zoom_amt = 16
	scopetype = /obj/screen/fullscreen/scope/long
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'
	mag_type = /obj/item/ammo_box/magazine/m440
	can_suppress = 0
	recoil = 1

/obj/item/weapon/gun/ballistic/automatic/pistol/automag
	name = "AMC Automag Model 180"
	desc = "The AMC AutoMag Model 180 is a large caliber semi-automatic pistol designed between 1966 and 1971 by the Auto Mag Corporation to make a semi-automatic pistol chambered in .44 Remington Magnum, and this particular gun seems to have been fitted with sleek wooden grips."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "automag"
	item_state = "automag"
	force = 14
	zoomable = TRUE
	zoom_amt = 16
	scopetype = /obj/screen/fullscreen/scope/long
	fire_sound = 'sound/weapons/dirtyharrygunshot.ogg'
	mag_type = /obj/item/ammo_box/magazine/automag
	can_suppress = 0
	recoil = 1

/obj/item/weapon/gun/ballistic/automatic/pistol/longslide
	name = "AMT Longslide"
	icon_state = "longslide"
	desc = "A very massive, almost unwieldable bigger brother to the Colt Model 1911A1. Still chambers .45 ACP ammunition."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "longslide"
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/m45
	can_suppress = 0
	fire_sound = 'sound/f13weapons/coltfire.ogg'
	burst_size = 1
	zoomable = TRUE
	zoom_amt = 14
	w_class = WEIGHT_CLASS_NORMAL
	self_weight = 0.85
	recoil = 2
	scopetype = /obj/screen/fullscreen/scope/long

/obj/item/weapon/gun/ballistic/automatic/pistol/coltclone
	name = "Colt M1911A1"
	icon_state = "clonepistol"
	desc = "A classic Vietnam-era Colt Model 1911A1 G.I pistol, complete with ring hammer and rosewood grips for added style over more modern models."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "clonepistol"
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/m45
	can_suppress = 0
	fire_sound = 'sound/f13weapons/coltfire.ogg'
	burst_size = 1
	zoomable = TRUE
	w_class = WEIGHT_CLASS_NORMAL
	self_weight = 0.85

/obj/item/weapon/gun/ballistic/automatic/pistol/mike1911
	name = "Colt Gold Cup"
	icon_state = "mike1911"
	desc = "An enhanced Colt Model 1911A1 pistol built for sport shooting, complete with ring hammer and vibrant red checkered wooden grips for added style over more modern models."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "mike1911"
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/m45
	can_suppress = 0
	fire_sound = 'sound/f13weapons/coltfire.ogg'
	burst_size = 1
	zoomable = TRUE
	w_class = WEIGHT_CLASS_NORMAL
	self_weight = 0.85

/obj/item/weapon/gun/ballistic/automatic/pistol/ncr1911
	name = "M1911 Custom"
	icon_state = "ncr1911"
	desc = "A reinforced Colt 1911 built to withstand the conditions of intense combat. This one appears to have wooden grips shaped to the form of someones hand and appears very worn."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "mike1911"
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/m45
	can_suppress = 0
	fire_sound = 'sound/f13weapons/coltfire.ogg'
	burst_size = 1
	zoomable = FALSE
	w_class = WEIGHT_CLASS_NORMAL
	self_weight = 0.85

/obj/item/weapon/gun/ballistic/automatic/pistol/shiningdarkness
	name = "A Light Shining in Darkness"
	icon_state = "shiningdarkness"
	desc = "A compact Colt Officer's ACP variant of the Model 1911A1 with significant wear to it's finish, baring most of the steel. It seems to have synthetic rattlesnake-textured grips, and it's slide bears greek engraving on either side which roughly translates to 'And the light shineth in darkness and the darkness comprehended it not.' Small enough to fit into your shoes or pockets."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "shiningdarkness"
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/m45
	can_suppress = 0
	fire_sound = 'sound/f13weapons/coltfire.ogg'
	burst_size = 1
	w_class = WEIGHT_CLASS_SMALL
	self_weight = 0.85

/obj/item/weapon/gun/ballistic/automatic/pistol/briner1911
	name = "Colt Officer's ACP"
	icon_state = "officer"
	desc = "A compact variant of the full-sized Model 1911A1, this firearm is unique in the fact it's been given a royal blue finish and fitted with ivory grips, hinting that it may be someone's personal weapon. Small enough to fit into your shoes or pockets."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "officer"
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/m45
	can_suppress = 0
	fire_sound = 'sound/f13weapons/coltfire.ogg'
	burst_size = 1
	w_class = WEIGHT_CLASS_SMALL
	self_weight = 0.85

/obj/item/weapon/gun/ballistic/automatic/pistol/coltofficer
	name = "Colt Officer's ACP"
	icon_state = "officerstainless"
	desc = "A compact variant of the full-sized Model 1911A1, made from brushed stainless steel and fitted with mahogany grips. Small enough to fit into your shoes or pockets."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "officerstainless"
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/m45
	can_suppress = 0
	fire_sound = 'sound/f13weapons/coltfire.ogg'
	burst_size = 1
	w_class = WEIGHT_CLASS_SMALL
	self_weight = 0.85

/obj/item/weapon/gun/ballistic/automatic/pistol/kf1911
    name = "Custom Colt M1911A1"
    icon_state = "kf1911"
    desc = "A classic Vietnam-era Colt Model 1911A1 G.I pistol, with the exception that it features nickel plating ivory grips and is heavily engraved. It also appears to sport 24 karat gold decorations."
    icon = 'icons/fallout/objects/guns/ballistic.dmi'
    item_state = "kf1911"
    origin_tech = "combat=2;materials=2"
    mag_type = /obj/item/ammo_box/magazine/m45
    can_suppress = 0
    fire_sound = 'sound/f13weapons/coltfire.ogg'
    burst_size = 1
    zoomable = TRUE
    w_class = WEIGHT_CLASS_NORMAL
    self_weight = 0.85

/obj/item/weapon/gun/ballistic/automatic/pistol/p220
	name = "SIG Sauer P220"
	icon_state = "p220"
	desc = "The SIG Sauer P220 is a semi-automatic pistol designed in 1975 by the SIG Arms AG division of Schweizerische Industrie Gesellschaft (now SIG Holding AG), and produced by J. P. Sauer & Sohn  in Eckernförde. Chambered in .45 ACP."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "p220"
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/m45
	can_suppress = 0
	fire_sound = 'sound/f13weapons/coltfire.ogg'
	burst_size = 1
	zoomable = TRUE
	w_class = WEIGHT_CLASS_NORMAL
	self_weight = 0.85

/obj/item/weapon/gun/ballistic/automatic/pistol/p226olive
	name = "SIG Sauer P226"
	icon_state = "p226olive"
	desc = "The SIG Sauer P226 is a full sized semi-automatic pistol designed by SIG Sauer in 1980 and produced in 1983. It is essentially the same basic design of the SIG Sauer P220, but developed to use higher capacity double stack magazines in place of the single stack magazines of the P220. This particular model sports a light olive drab frame alongside a parkerized slide and barrel to protect against corrosion. Chambered in 9x19mm."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "p226olive"
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/ninepistol
	can_suppress = 0
	fire_sound = 'sound/weapons/smithfire.ogg'
	burst_size = 1
	zoomable = TRUE
	w_class = WEIGHT_CLASS_NORMAL
	self_weight = 0.85

/obj/item/weapon/gun/ballistic/automatic/pistol/p226
	name = "SIG Sauer P226"
	icon_state = "p226"
	desc = "The SIG Sauer P226 is a full sized semi-automatic pistol designed by SIG Sauer in 1980 and produced in 1983. It is essentially the same basic design of the SIG Sauer P220, but developed to use higher capacity double stack magazines in place of the single stack magazines of the P220. Chambered in 9x19mm."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "p226"
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/ninepistol
	can_suppress = 0
	fire_sound = 'sound/weapons/smithfire.ogg'
	burst_size = 1
	zoomable = TRUE
	w_class = WEIGHT_CLASS_NORMAL
	self_weight = 0.85

/obj/item/weapon/gun/ballistic/automatic/pistol/churchp226
	name = "SIG Sauer P226"
	icon_state = "churchp226"
	desc = "The SIG Sauer P226 is a full sized semi-automatic pistol designed by SIG Sauer in 1980 and produced in 1983. It is essentially the same basic design of the SIG Sauer P220, but developed to use higher capacity double stack magazines in place of the single stack magazines of the P220. This model is more or less identical to the standard factory variant apart from the solid ivory grips and latin engraving on the slide that roughly translates to '' Deus in manibus'' or ''My life is in god's hands '' in english. Chambered in 9x19mm."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "churchp226"
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/ninepistol
	can_suppress = 0
	fire_sound = 'sound/weapons/smithfire.ogg'
	burst_size = 1
	zoomable = TRUE
	w_class = WEIGHT_CLASS_NORMAL
	self_weight = 0.85

/obj/item/weapon/gun/ballistic/automatic/pistol/grader
	name = "Grader Model 2045"
	icon_state = "grader"
	desc = "A unique off-brand Model 1911A1 that has the unique feature of being chambered with one hand, thanks to the cocking lever acting as a trigger guard. Chambers .45 ACP ammunition."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "grader"
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/m45
	can_suppress = 0
	fire_sound = 'sound/f13weapons/coltfire.ogg'
	burst_size = 1
	zoomable = TRUE
	zoom_amt = 14
	w_class = WEIGHT_CLASS_NORMAL
	self_weight = 0.85
	recoil = 2
	scopetype = /obj/screen/fullscreen/scope/long

/obj/item/weapon/gun/ballistic/revolver/sequoia
	name = "Ranger Sequoia"
	icon_state = "sequoia"
	desc = "The Ranger Sequoia is a popular model of double action revolver in the wasteland, albeit with expensive decorations compared to other guns. Chambered in .44 Magnum"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "sequoia"
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/m44
	can_suppress = 0
	fire_sound = 'sound/weapons/dirtyharrygunshot.ogg'
	burst_size = 1
	casing_ejector = 0
	zoomable = TRUE
	zoom_amt = 14
	w_class = WEIGHT_CLASS_NORMAL
	self_weight = 0.85
	recoil = 2
	scopetype = /obj/screen/fullscreen/scope/short

/obj/item/weapon/gun/ballistic/revolver/liquidsequoia
	name = "Ranger Sequoia"
	icon_state = "liquidsequoia"
	desc = "The Ranger Sequoia is a popular model of double action revolver in the wasteland, albeit with expensive decorations compared to other guns. This one appears quite different from the standard model in the fact that it's stainless steel rather than blued, and may have a twin judging by the strange serial number."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	item_state = "liquidsequoia"
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/m44
	can_suppress = 0
	fire_sound = 'sound/weapons/dirtyharrygunshot.ogg'
	burst_size = 1
	casing_ejector = 0
	zoomable = TRUE
	zoom_amt = 14
	w_class = WEIGHT_CLASS_NORMAL
	self_weight = 0.85
	recoil = 2
	scopetype = /obj/screen/fullscreen/scope/short

/obj/item/weapon/gun/ballistic/automatic/rifle
	name = "308. battle rifle"
	icon_state = "rifle-automatic"
	item_state = "rifle308"
	wielded_icon = "rifle308-wielded"
	desc = "A semi-automatic battle rifle manufactured as a prototype in the West. Chambered in 308. rounds."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/m308
	can_suppress = 1
	casing_ejector = 1
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_NORMAL
	mag_load_sound = 'sound/effects/wep_magazines/ar_load.ogg'
	mag_unload_sound = 'sound/effects/wep_magazines/ar_unload.ogg'
	chamber_sound = 'sound/effects/wep_magazines/ar_chamber.ogg'
	recoil = 2

/obj/item/weapon/gun/ballistic/automatic/garand
	name = "M1 Garand"
	icon_state = "garand"
	item_state = "garand"
	desc = "The M1 Garand is a semi-automatic rifle that was the standard U.S. service rifle during World War II and the Korean War and also saw limited service during the Vietnam War. This particular model features a post-war conversion that allows it to fire more readily available .308 Winchester ammunition."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/garand
	can_suppress = 0
	casing_ejector = 1
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = SLOT_BACK
	mag_load_sound = 'sound/effects/wep_magazines/ar_load.ogg'
	mag_unload_sound = 'sound/effects/wep_magazines/ar_unload.ogg'
	chamber_sound = 'sound/effects/wep_magazines/ar_chamber.ogg'
	recoil = 2
	wielded_icon = "garand-wielded"
	burst_size = 0

/obj/item/weapon/gun/ballistic/automatic/thismachine
	name = "This Machine"
	icon_state = "thismachine"
	item_state = "thismachine"
	desc = "A unique variant of the standard M1 Garand rifle, bearing primitively carved text on either side of the receiver that reads ''WELL THIS MACHINE KILLS COMMIES''. Chambers .308 Winchester ammunition."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/garand
	can_suppress = 0
	casing_ejector = 1
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = SLOT_BACK
	mag_load_sound = 'sound/effects/wep_magazines/ar_load.ogg'
	mag_unload_sound = 'sound/effects/wep_magazines/ar_unload.ogg'
	chamber_sound = 'sound/effects/wep_magazines/ar_chamber.ogg'
	recoil = 2
	wielded_icon = "thismachine-wielded"
	burst_size = 0

/obj/item/weapon/gun/ballistic/automatic/fnfal
	name = "FN FAL"
	icon_state = "fnfal"
	item_state = "fnfal"
	desc = "The FN FAL is a battle rifle designed by Belgian small arms designers Dieudonné Saive and Ernest Vervier and manufactured by FN Herstal. During the Cold War the FAL was adopted by many countries of the North Atlantic Treaty Organization (NATO), with the notable exception of the United States. It is one of the most widely used rifles in history, having been used by more than 90 countries. This particular model sports wooden furniture and an aftermarket conversion that allows it to fire more readily available .308 Winchester ammunition, which is very similar in size to the 7.62×51mm NATO it was originally chambered in."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/falmag
	can_suppress = 0
	casing_ejector = 1
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = SLOT_BACK
	mag_load_sound = 'sound/effects/wep_magazines/ar_load.ogg'
	mag_unload_sound = 'sound/effects/wep_magazines/ar_unload.ogg'
	chamber_sound = 'sound/effects/wep_magazines/ar_chamber.ogg'
	recoil = 2
	wielded_icon = "fnfal-wielded"
	burst_size = 0

/obj/item/weapon/gun/ballistic/shotgun/rifle
	name = "Hunting Rifle"
	desc = "A pre-War bolt-action hunting rifle."
	icon_state = "rifle"
	item_state = "rifle"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/m308
	can_suppress = 1
	casing_ejector = 0
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_NORMAL
	pumpsound = 'sound/weapons/boltpump.ogg'
	mag_load_sound = 'sound/effects/wep_magazines/rifle_load.ogg'
	recoil = 2
	wielded_icon = "rifle-wielded"

/obj/item/weapon/gun/ballistic/shotgun/patience
	name = "Paciencia"
	desc = "Similar to other bolt-action hunting rifles in the fact it chambers .308 rounds, this weapon appears to be in much better condition than your average rifle and is unique not only for it's state of upkeep, but the mexican flag tied tightly around the stock for use as a makeshift cheek rest."
	icon_state = "patience"
	item_state = "patience"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/m308
	can_suppress = 0
	casing_ejector = 0
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_NORMAL
	zoomable = TRUE
	zoom_amt = 40
	scopetype = /obj/screen/fullscreen/scope/medium
	pumpsound = 'sound/weapons/boltpump.ogg'
	mag_load_sound = 'sound/effects/wep_magazines/rifle_load.ogg'
	recoil = 2
	wielded_icon = "patience-wielded"

/obj/item/weapon/gun/ballistic/shotgun/rifle/scope
	icon_state = "rifle-scope"
	item_state = "rifle"
	can_suppress = 1
	zoomable = TRUE
	zoom_amt = 30
	w_class = WEIGHT_CLASS_NORMAL
	scopetype = /obj/screen/fullscreen/scope/medium
	wielded_icon = "rifle-wielded"

/obj/item/weapon/gun/ballistic/automatic/assault_rifle
	name = "Service Rifle"
	desc = "A rifle manufactured in mass to support the NCR's war effort. Chambered in 5.56 with a magazine capacity of 20 rounds."
	icon_state = "assault-rifle"
	item_state = "assault"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/m556
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'
	can_suppress = 0
	casing_ejector = 1
	weapon_weight = WEAPON_MEDIUM
	slot_flags = SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	mag_load_sound = 'sound/effects/wep_magazines/ar_load.ogg'
	mag_unload_sound = 'sound/effects/wep_magazines/ar_unload.ogg'
	chamber_sound = 'sound/effects/wep_magazines/ar_chamber.ogg'
	wielded_icon = "assault-wielded"//Two handing

/obj/item/weapon/gun/ballistic/automatic/allamerican
	name = "All American"
	desc = "Now you can show your true patriotism by murdering your fellow survivors with this camouflage assault rifle, complete with a short range scope! Cheetos not included, fatass."
	icon_state = "allamerican"
	item_state = "assault"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/m556
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'
	can_suppress = 0
	casing_ejector = 1
	weapon_weight = WEAPON_MEDIUM
	slot_flags = SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	mag_load_sound = 'sound/effects/wep_magazines/ar_load.ogg'
	mag_unload_sound = 'sound/effects/wep_magazines/ar_unload.ogg'
	chamber_sound = 'sound/effects/wep_magazines/ar_chamber.ogg'
	wielded_icon = "assault-wielded"//Two handing
	zoomable = TRUE
	zoom_amt = 25
	scopetype = /obj/screen/fullscreen/scope/medium

/obj/item/weapon/gun/ballistic/automatic/smg10mm
	name = "10mm submachine gun"
	desc = "An H&K MP9 submachine gun (10mm caliber variant). An average submachine gun which can operate in both single and automatic fire modes."
	icon_state = "smg10mm"
	item_state = "smg10mm"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/m10mm_auto
	fire_sound = "10mmfire"
	can_suppress = 0
	burst_size = 3
	casing_ejector = 1
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/automatic/smg9mm
	name = "9mm submachine gun"
	desc = "An M3 Grease Gun scaled down significantly so it can be held one-handed, and rechambered for 9x19mm. Can operate in both single and automatic fire modes."
	icon_state = "smg9mm"
	item_state = "smg9mm"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=3;materials=2"
	mag_type = /obj/item/ammo_box/magazine/smg9mm
	fire_sound = "sound/weapons/smithfire.ogg"
	can_suppress = 0
	burst_size = 3
	casing_ejector = 1
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/shotgun/pipe
	name = "pipe gun"
	desc = "A makeshift shotgun that can hold a single shell."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "pipe-gun"
	item_state = "shotgun"
	origin_tech = "combat=1;materials=1"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/pipe
	casing_ejector = 1
	weapon_weight = WEAPON_LIGHT
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/weapon/gun/ballistic/shotgun/maverick
	name = "Maverick 88"
	desc = "The Mossberg Maverick 88 pump-action shotgun, featuring a shortened barrel and 'cruiser' style pistol grip for a more practical approach. Chambered in 12 gauge shells."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "maverick"
	item_state = "maverick"
	origin_tech = "combat=1;materials=1"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/lethal/trail
	casing_ejector = 1
	weapon_weight = WEAPON_LIGHT
	w_class = WEIGHT_CLASS_NORMAL
	wielded_icon = "maverick-wielded"

/obj/item/weapon/gun/ballistic/revolver/coachgun
	name = "coach gun"
	desc = "A worn 18th century side-by-side coach shotgun, with the twist that it has somehow been given a modern day pump-action system and rechambered in 12 gauge shells for blasting wasteland scum. Space redneck approved!"
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "coachgun"
	item_state = "coachgun"
	origin_tech = "combat=1;materials=1"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/madmax
	casing_ejector = 0
	weapon_weight = WEAPON_LIGHT
	w_class = WEIGHT_CLASS_NORMAL
	wielded_icon = "coachgun-wielded"

/obj/item/weapon/gun/ballistic/automatic/carbine
	name = "Colt Model 733"
	desc = "A lightweight assault rifle originating from the M16-family of carbine patterned weapons, chambered in 5.56mm and holding a whopping thirty rounds in it's magazine."
	icon_state = "carbine"
	item_state = "carbine"
	slot_flags = SLOT_BACK
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=6;engineering=4"
	mag_type = /obj/item/ammo_box/magazine/carbine
	fire_sound = 'sound/weapons/Gunshot_smg.ogg'
	can_suppress = 0
	burst_size = 5
	fire_delay = 1
	wielded_icon = "carbine-wielded"

/obj/item/weapon/gun/ballistic/automatic/ak74
	name = "AK-74"
	desc = "The AK-74 is an assault rifle developed in the early 1970s by Russian designer Mikhail Kalashnikov as the replacement for the earlier AKM (itself a refined version of the AK-47). It has been rechambered to take the 5.56mm cartridge, replacing the 7.62×39mm chambering of earlier Kalashnikov-pattern weapons. This one features wooden furniture."
	icon_state = "ak74"
	item_state = "ak74"
	slot_flags = SLOT_BACK
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=6;engineering=4"
	mag_type = /obj/item/ammo_box/magazine/akmag
	fire_sound = 'sound/weapons/Gunshot_smg.ogg'
	can_suppress = 0
	burst_size = 5
	fire_delay = 1
	wielded_icon = "ak74-wielded"

/obj/item/weapon/gun/ballistic/automatic/val
	name = "AS VAL"
	desc = "The AS VAL was a Soviet-designed assault rifle in the old pre-war world. Production began in the first half of the 1980s in the Central Research Institute of Precision Engineering (TSNIITOCHMASH), in the city of Klimovsk, Moscow region. The lead designer of the rifle was Pyotr Serdyukov. It has been rechambered to take the 5.56mm cartridge, and crudely enough seems to take AK-styled magazines as well."
	icon_state = "val"
	item_state = "val"
	slot_flags = SLOT_BACK
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=6;engineering=4"
	mag_type = /obj/item/ammo_box/magazine/akmag
	fire_sound = 'sound/weapons/Gunshot_smg.ogg'
	can_suppress = 0
	burst_size = 5
	fire_delay = 1
	wielded_icon = "val-wielded"

/obj/item/weapon/gun/ballistic/automatic/ak74green
	name = "AK-74"
	desc = "The AK-74 is an assault rifle developed in the early 1970s by Russian designer Mikhail Kalashnikov as the replacement for the earlier AKM (itself a refined version of the AK-47). It has been rechambered to take the 5.56mm cartridge, replacing the 7.62×39mm chambering of earlier Kalashnikov-pattern weapons. This one features OD-green furniture."
	icon_state = "ak74green"
	item_state = "ak74green"
	slot_flags = SLOT_BACK
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=6;engineering=4"
	mag_type = /obj/item/ammo_box/magazine/akmag
	fire_sound = 'sound/weapons/Gunshot_smg.ogg'
	can_suppress = 0
	burst_size = 5
	fire_delay = 1
	wielded_icon = "ak74green-wielded"

/obj/item/weapon/gun/ballistic/automatic/ak74m
	name = "AK-74"
	desc = "The AK-74 is an assault rifle developed in the early 1970s by Russian designer Mikhail Kalashnikov as the replacement for the earlier AKM (itself a refined version of the AK-47). It has been rechambered to take the 5.56mm cartridge, replacing the 7.62×39mm chambering of earlier Kalashnikov-pattern weapons. This one features black synthetic furniture."
	icon_state = "ak74m"
	item_state = "ak74m"
	slot_flags = SLOT_BACK
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=6;engineering=4"
	mag_type = /obj/item/ammo_box/magazine/akmag
	fire_sound = 'sound/weapons/Gunshot_smg.ogg'
	can_suppress = 0
	burst_size = 5
	fire_delay = 1
	wielded_icon = "ak74m-wielded"

/obj/item/weapon/gun/ballistic/automatic/aksu74
	name = "AKS-74U"
	desc = "The shorter, carbine-like cousin of the full sized AK-74. It has been rechambered to take the 5.56mm cartridge, replacing the 7.62×39mm chambering of earlier Kalashnikov-pattern weapons. This one features wooden furniture."
	icon_state = "aksu74"
	item_state = "aksu74"
	slot_flags = SLOT_BACK
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=6;engineering=4"
	mag_type = /obj/item/ammo_box/magazine/aksumag
	fire_sound = 'sound/weapons/Gunshot_smg.ogg'
	can_suppress = 0
	burst_size = 5
	fire_delay = 1
	wielded_icon = "aksu74-wielded"

/obj/item/weapon/gun/ballistic/automatic/aksu74green
	name = "AKS-74U"
	desc = "The shorter, carbine-like cousin of the full sized AK-74. It has been rechambered to take the 5.56mm cartridge, replacing the 7.62×39mm chambering of earlier Kalashnikov-pattern weapons. This one features OD-green furniture."
	icon_state = "aksu74green"
	item_state = "aksu74green"
	slot_flags = SLOT_BACK
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	origin_tech = "combat=6;engineering=4"
	mag_type = /obj/item/ammo_box/magazine/aksumag
	fire_sound = 'sound/weapons/Gunshot_smg.ogg'
	can_suppress = 0
	burst_size = 5
	fire_delay = 1
	wielded_icon = "aksu74green-wielded"

/obj/item/weapon/gun/ballistic/shotgun/trail
	name = "trail carbine"
	desc = "The trail carbine features a good ammunition capacity, a brisk rate of fire, and high accuracy."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "trail-carbine"
	item_state = "shotgun"
	origin_tech = "combat=1;materials=1"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/lethal/trail
	weapon_weight = WEAPON_MEDIUM
	casing_ejector = 1
	w_class = WEIGHT_CLASS_HUGE
	pumpsound = 'sound/f13weapons/repeater_reload.ogg'
	recoil = 2

/obj/item/weapon/gun/ballistic/shotgun/terminator
	name = "Winchester Model 1887"
	desc = "A classic lever action 12 gauge Winchester model 1887, cut down to suit a biker's needs."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "terminator"
	item_state = "terminator"
	origin_tech = "combat=1;materials=1"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/terminator
	weapon_weight = WEAPON_MEDIUM
	casing_ejector = 1
	w_class = WEIGHT_CLASS_NORMAL
	pumpsound = 'sound/f13weapons/repeater_reload.ogg'
	recoil = 2
	wielded_icon = "terminator-wielded"

/obj/item/weapon/gun/ballistic/shotgun/winchesterrifle
	name = "lever-action rifle"
	desc = "This lever action rifle appears to have been based on a Winchester model 1873, but with an amazing magazine capacity and an outlandish supernatural quality to it you can't quite comprehend."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "winchester"
	item_state = "winchester"
	origin_tech = "combat=1;materials=1"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/winchester30
	weapon_weight = WEAPON_MEDIUM
	casing_ejector = 1
	w_class = WEIGHT_CLASS_NORMAL
	pumpsound = 'sound/f13weapons/repeater_reload.ogg'
	recoil = 2
	wielded_icon = "winchester-wielded"

/obj/item/weapon/gun/ballistic/shotgun/dinnerbell
	name = "Dinner Bell"
	desc = "A camouflage pattern pump-action shotgun with superior magazine capacity. Oh, sweet Red Lucy.."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "dinnerbell"
	item_state = "dinnerbell"
	origin_tech = "combat=1;materials=1"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/lethal/trail
	weapon_weight = WEAPON_MEDIUM
	casing_ejector = 1
	w_class = WEIGHT_CLASS_HUGE
	pumpsound = 'sound/f13weapons/repeater_reload.ogg'
	recoil = 2
	wielded_icon = "dinnerbell-wielded"

/obj/item/weapon/gun/ballistic/shotgun/huntingshotgun
	name = "Remington 870"
	desc = "The Remington Model 870 is a pump-action shotgun manufactured by Remington Arms Company, LLC. It was widely used by the public for sport shooting, hunting, and self-defense and used by law enforcement and military organizations worldwide before the war. Chambered in 12 Gauge shells."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "huntingshotgun"
	item_state = "huntingshotgun"
	origin_tech = "combat=1;materials=1"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/lethal/trail
	weapon_weight = WEAPON_MEDIUM
	casing_ejector = 1
	w_class = WEIGHT_CLASS_HUGE
	pumpsound = 'sound/f13weapons/repeater_reload.ogg'
	recoil = 2
	wielded_icon = "huntingshotgun-wielded"

/obj/item/weapon/gun/ballistic/shotgun/medicinestick
	name = "Medicine Stick"
	desc = "A rustic repeating rifle with what appears to be a leather pouch and dream catcher attached to the stock."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "medicine"
	item_state = "medicine"
	origin_tech = "combat=1;materials=1"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/henry
	weapon_weight = WEAPON_LIGHT
	casing_ejector = 1
	w_class = WEIGHT_CLASS_NORMAL
	pumpsound = 'sound/f13weapons/repeater_reload.ogg'
	recoil = 2
	wielded_icon = "medicine-wielded"

/obj/item/weapon/gun/ballistic/shotgun/henry
    name = "Henry Big Boy"
    desc = "A reproduction of many infamous lever action rifles featuring brass hardware and a walnut stock, complete with a ten round magazine tube. Chambered in .44 Remington Magnum"
    icon = 'icons/fallout/objects/guns/ballistic.dmi'
    icon_state = "henry"
    item_state = "henry"
    origin_tech = "combat=1;materials=1"
    mag_type = /obj/item/ammo_box/magazine/internal/shot/henry
    weapon_weight = WEAPON_LIGHT
    casing_ejector = 1
    w_class = WEIGHT_CLASS_NORMAL
    pumpsound = 'sound/f13weapons/repeater_reload.ogg'
    recoil = 2
    wielded_icon = "henry-wielded"

/obj/item/weapon/gun/ballistic/shotgun/henrytwo
    name = "Henry Big Boy"
    desc = "A reproduction of many infamous lever action rifles featuring chromed hardware and a maple stock, complete with a ten round magazine tube. Chambered in .357 Magnum"
    icon = 'icons/fallout/objects/guns/ballistic.dmi'
    icon_state = "henrytwo"
    item_state = "henrytwo"
    origin_tech = "combat=1;materials=1"
    mag_type = /obj/item/ammo_box/magazine/internal/shot/henrytwo
    weapon_weight = WEAPON_LIGHT
    casing_ejector = 1
    w_class = WEIGHT_CLASS_NORMAL
    pumpsound = 'sound/f13weapons/repeater_reload.ogg'
    recoil = 2
    wielded_icon = "henrytwo-wielded"

/obj/item/weapon/gun/ballistic/revolver/doublerifle
	name = "double barreled rifle"
	desc = "A modern reproduction of a Holland & Holland double rifle chambered for the powerful .460 Smith & Wesson Magnum cartridge. The gun itself features blued barrels, gold plated triggers and matching hammers, and an engraved box-lock action. The stock and furniture seem to be crafted from a rich mahogany."
	icon_state = "doublerifle"
	item_state = "doublerifle"
	w_class = WEIGHT_CLASS_BULKY
	force = 20
	flags = CONDUCT
	slot_flags = SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/internal/shot/doublerifle
	wielded_icon = "doublerifle-wielded"

/obj/item/weapon/gun/ballistic/revolver/doublerifle
	name = "ranger's double rifle"
	desc = "A hefty double barrel over-rifle with a almost super natural quality to it. Chambered in 338. Lapua. It appears to have a extremely complicated mechanical optic reticle on it. It appears to have a additional complex mechanical extractor that ejects the casings as they are fired for faster reloading."
	icon_state = "doublerifle"
	item_state = "doublerifle"
	w_class = WEIGHT_CLASS_BULKY
	force = 30
	flags = CONDUCT
	slot_flags = SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/internal/shot/doublerifleu
	wielded_icon = "doublerifle-wielded"
	casing_ejector = 1
	recoil = 2

/obj/item/weapon/gun/ballistic/shotgun/huntsman
	name = "Huntsman"
	desc = "A rustic repeating rifle that appears to have a skeletal stock fixed to it, alongside it's most noteworthy feature; the blade of a machete welded to it's foregrip."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "huntsman"
	item_state = "huntsman"
	origin_tech = "combat=1;materials=1"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/medicine
	weapon_weight = WEAPON_LIGHT
	casing_ejector = 1
	w_class = WEIGHT_CLASS_NORMAL
	pumpsound = 'sound/f13weapons/repeater_reload.ogg'
	recoil = 2
	wielded_icon = "huntsman-wielded"
	force = 200
	sharpness = IS_SHARP
	attack_verb = list("stabbed", "sliced", "cut", "slashed")

/obj/item/weapon/gun/ballistic/automatic/bozar
	name = "MV-5 Bozar"
	desc = "The ultimate refinement of the sniper's art.<br>Although somewhat finicky and prone to jamming if not kept immacuately clean, its accuracy more than makes up for its extra maintenance requirements."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "bozar"
	item_state = "arg" //Looks like bozar
	slot_flags = SLOT_BACK
	origin_tech = "combat=6;engineering=3;"
	mag_type = /obj/item/ammo_box/magazine/m223
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'sound/weapons/Gunshot_smg.ogg'
	can_suppress = 1
	burst_size = 3
	fire_delay = 1
	zoomable = TRUE
	slot_flags = SLOT_BACK
	zoom_amt = 7
	w_class = WEIGHT_CLASS_HUGE
	recoil = 3
	scopetype = /obj/screen/fullscreen/scope/long
