//Fallout 13 Neutral faction aka Wastelanders roles

/datum/job/settler
	title = "Settler"
	flag = SETTLER
	department_flag = WASTELAND
	desc = "A true child of the wasteland.<br>In badlands you are born, in badlands lays your grave."
	faction = "none"
	status = "none"
	total_positions = -1
	spawn_positions = -1
	supervisors = "none"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/settler

	allowed_packs = list("starter", "cigarettes", "team_fortress", "wardrobe", "vault13", "starwars", "bard", "khan", "super_ten", "punk", "off", "madmax", "doom","adminpack", "holsters", "terminator", "residentevil", "sierramadre", "karate")

/datum/outfit/job/settler
	name = "Settler"
	backpack = null
	satchel = null
	uniform = /obj/item/clothing/under/f13/settler
	shoes = /obj/item/clothing/shoes/f13/rag

//Purist

/*

/datum/job/puristlearner
	title = "Purist Learner"
	department_flag = MEDSCI
	desc = "As the unofficial protectors of the wasteland, the Purists exist solely to help the innocent and achieve this goal with minimal casualties. You are not law enforcement and should choose your conflicts wisely, but when the need arises your laser sword should be used strictly for defensive purposes rather than offensive if it can be helped. Your one constant weapon is the experimental ''Psyker'' injection you've been granted by the order, the telekinetic abilities of which will aid you in your travels. Using guns or protective armor is strictly forbidden by those who follow your code"
	faction = "none"
	status = "none"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Purist Masters"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/purist
	whitelist_on = 1

	allowed_packs = list("purist")

/datum/outfit/job/purist
	name = "Purist Learner"
	uniform = /obj/item/clothing/under/puristunder
	shoes = /obj/item/clothing/shoes/puristboots
	suit = /obj/item/clothing/suit/hooded/puristrobes
	belt = /obj/item/weapon/melee/energy/sword/saber/blue
	suit_store = /obj/item/weapon/dnainjector/telemut/darkbundle
	l_pocket = /obj/item/device/radio
	r_pocket = /obj/item/device/flashlight/seclite


//Purist Master

/datum/job/puristmaster
	title = "Purist Master"
	department_flag = MEDSCI
	desc = "Your responsibility lies with guiding the younger Purist learners on a righteous path. As the unofficial protectors of the wasteland, the Purists exist solely to help the innocent and achieve this goal with minimal casualties. You are not law enforcement and should choose your conflicts wisely, but when the need arises your laser sword should be used strictly for defensive purposes rather than offensive if it can be helped. Your one constant weapon is the experimental ''Psyker'' injection you've been granted by the order, the telekinetic abilities of which will aid you in your travels. Using guns or protective armor is strictly forbidden by those who follow your code"
	faction = "none"
	status = "none"
	total_positions = 1
	spawn_positions = 1
	supervisors = "none"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/puristmaster
	whitelist_on = 1

	allowed_packs = list("purist")

/datum/outfit/job/puristmaster
	name = "Purist Master"
	uniform = /obj/item/clothing/under/puristunder
	shoes = /obj/item/clothing/shoes/puristboots
	suit = /obj/item/clothing/suit/hooded/puristrobes
	belt = /obj/item/weapon/melee/energy/sword/saber/green
	suit_store = /obj/item/weapon/dnainjector/telemut/darkbundle
	l_pocket = /obj/item/device/radio
	r_pocket = /obj/item/device/flashlight/seclite


//Extremist

/datum/job/extremistapprentice
	title = "Extremist Apprentice"
	department_flag = MEDSCI
	desc = "Having been vilified by the wasteland for their otherworldly abilities, the Extremists main goal typically varies based on personal interest, but they remain loyal to their own at all costs. You do not refrain from killing at all, but choosing your battles based on their honor rather than mindless slaughter is your creed. Apart from your laser sword, your one constant weapon is the experimental ''Psyker'' injection you've been granted by the order, the telekinetic abilities of which will aid you in your travels. Using guns or protective armor isn't exactly forbidden, but highly frowned upon by those who follow your code"
	faction = "none"
	status = "none"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Extremist Lords"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/extremist
	whitelist_on = 1

	allowed_packs = list("extremist")

/datum/outfit/job/extremist
	name = "Extremist Apprentice"
	uniform = /obj/item/clothing/under/extremistunder
	shoes = /obj/item/clothing/shoes/extremistboots
	suit = /obj/item/clothing/suit/hooded/extremistrobes
	belt = /obj/item/weapon/melee/energy/sword/saber/red
	suit_store = /obj/item/weapon/dnainjector/telemut/darkbundle
	l_pocket = /obj/item/device/radio
	r_pocket = /obj/item/device/flashlight/seclite


//Extremist Lord

/datum/job/extremistlord
	title = "Extremist Lord"
	department_flag = MEDSCI
	desc = "Your responsibility lies with organizing the Extremists into a powerful militant force to achieve your goals. Having been vilified by the wasteland for their otherworldly abilities, the Extremists main goal typically varies based on personal interest, but they remain loyal to their own at all costs. You do not refrain from killing at all, but choosing your battles based on their honor rather than mindless slaughter is your creed. Apart from your laser sword, your one constant weapon is the experimental ''Psyker'' injection you've been granted by the order, the telekinetic abilities of which will aid you in your travels. Using guns or protective armor isn't exactly forbidden, but highly frowned upon by those who follow your code"
	faction = "none"
	status = "none"
	total_positions = 1
	spawn_positions = 1
	supervisors = "none"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/extremist
	whitelist_on = 1

	allowed_packs = list("extremist")

/datum/outfit/job/extremistlord
	name = "Extremist Lord"
	uniform = /obj/item/clothing/under/extremistunder
	shoes = /obj/item/clothing/shoes/extremistboots
	suit = /obj/item/clothing/suit/hooded/extremistrobes
	belt = /obj/item/weapon/melee/energy/sword/saber/red
	suit_store = /obj/item/weapon/dnainjector/telemut/darkbundle
	l_pocket = /obj/item/device/radio
	r_pocket = /obj/item/device/flashlight/seclite
*/

//Adventurer

/datum/job/adventurer
	title = "Adventurer"
	desc = "An offspring of wasteland wanderers.<br>Your life is a journey, and you are free to choose what kind of a journey it will be."
	flag = ADVENTURER
	department_flag = WASTELAND
	faction = "none" //desert faction shall disable appearing as scavenger after readying
	status = "none"
	total_positions = -1
	spawn_positions = -1 //does not matter for late join
	supervisors = "nobody"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/adventurer

	allowed_packs = list("starter", "cigarettes", "team_fortress", "wardrobe", "vault13", "bard", "khan", "super_ten", "starwars", "punk", "off", "madmax", "doom","adminpack", "holsters", "terminator", "residentevil", "sierramadre", "karate")

	required_items = list(
	/obj/item/clothing/shoes/f13/brownie,
	/obj/item/clothing/gloves/f13/leather,
	/obj/item/clothing/under/f13/female/mercadv,
	/obj/item/clothing/under/f13/merccharm,
	/obj/item/clothing/under/f13/female/merccharm,
	/obj/item/clothing/under/f13/doctor,
	/obj/item/clothing/under/f13/female/doctor,
	/obj/item/clothing/suit/armor/f13/kit,
	/obj/item/clothing/glasses/sunglasses,
	/obj/item/clothing/glasses/eyepatch
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/pants/f13/cloth,
	/obj/item/clothing/under/pants/f13/caravan,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/suit/f13/mantle_liz
	)

/datum/outfit/job/adventurer
	name = "Adventurer"
	backpack = null
	satchel = null
	uniform = /obj/item/clothing/under/f13/mercadv
	shoes = /obj/item/clothing/shoes/f13/tan

//Mercenary

/datum/job/mercenary
	title = "Mercenary"
	desc = "A spawn of guns and bullets.<br>You know that peace is not always applicable.<br>Why waste time on diplomacy when you can shoot things and earn yourself a fortune?"
	flag = MERCENARY
	department_flag = MEDSCI
	faction = "none"
	status = "none"
	total_positions = 10
	spawn_positions = 10
	supervisors = "nobody"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/mercenary

	allowed_packs = list("starter", "cigarettes", "team_fortress", "wardrobe", "vault13", "bard", "khan", "super_ten", "punk", "starwars", "off", "madmax", "doom","adminpack", "holsters", "terminator", "residentevil", "sierramadre", "karate")

	required_items = list(
	/obj/item/clothing/shoes/f13/tan,
	/obj/item/clothing/gloves/f13/leather,
	/obj/item/clothing/gloves/f13/military,
	/obj/item/clothing/under/f13/mercadv,
	/obj/item/clothing/under/f13/female/mercadv,
	/obj/item/clothing/under/f13/female/merccharm,
	/obj/item/clothing/under/f13/doctor,
	/obj/item/clothing/under/f13/female/doctor,
	/obj/item/clothing/under/f13/bodyguard,
	/obj/item/clothing/suit/f13/duster,
	/obj/item/clothing/suit/armor/f13/kit,
	/obj/item/clothing/suit/armor/f13/leatherarmor,
	/obj/item/clothing/suit/armor/f13/metalarmor,
	/obj/item/clothing/suit/armor/f13/bmetalarmor,
	/obj/item/clothing/head/soft/f13/utility/navy,
	/obj/item/clothing/head/helmet/f13/tribal,
	/obj/item/clothing/head/helmet/f13/eyebot,
	/obj/item/clothing/head/helmet/f13/marine,
	/obj/item/clothing/glasses/eyepatch,
	/obj/item/clothing/glasses/sunglasses,
	/obj/item/weapon/kitchen/knife/combat,
	/obj/item/weapon/lighter/detonator
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/pants/f13/cloth,
	/obj/item/clothing/under/pants/f13/caravan,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/suit/f13/mantle_liz
	)

/datum/outfit/job/mercenary
	name = "Mercenary"
	backpack = null
	satchel = null
	uniform = /obj/item/clothing/under/f13/merccharm
	shoes = /obj/item/clothing/shoes/f13/military
	suit = /obj/item/clothing/suit/f13/veteran
	head = null
	belt = /obj/item/weapon/storage/belt/military/army
	weapon = /obj/item/weapon/gun/ballistic/shotgun/pipe
	belt_contents = list(/obj/item/ammo_casing/shotgun/rubbershot = 5, \
		/obj/item/weapon/reagent_containers/pill/patch/healingpowder = 2, \
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival = 1, \
		/obj/item/device/radio = 1, \
		/obj/item/device/flashlight/torch/flare/green = 1)