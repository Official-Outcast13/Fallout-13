//I'm warning you - this code section is under construction. Ceiling, walls, and floor are unstable.

/datum/job/overseer
	title = "Overseer"
	flag = OVERSEER
	department_head = list("Overseer")
	department_flag = ENGSEC
	faction = "vault"
	status = "Overseer"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Vault-tec"
	selection_color = "#005A20"


	outfit = /datum/outfit/job/overseer

	access = list(12, 20, 63)			//See get_access()
	minimal_access = list() 	//See get_access()


/datum/outfit/job/overseer
	name = "Overseer"

	id = /obj/item/weapon/card/id/vault
	belt = /obj/item/device/pda/captain
	glasses = /obj/item/clothing/glasses/sunglasses
//	ears = /obj/item/device/radio/headset/headset_vlt
	//gloves = /obj/item/clothing/gloves/color/captain
	uniform = /obj/item/clothing/under/f13/vault/v113
	//suit = /obj/item/clothing/suit/armor/vest/capcarapace
	shoes = /obj/item/clothing/shoes/jackboots
	//head = /obj/item/clothing/head/caphat
	back = /obj/item/weapon/storage/backpack/
	backpack_contents = list(/obj/item/weapon/melee/classic_baton/telescopic = 1)
	r_pocket = /obj/item/device/radio

	//satchel = /obj/item/weapon/storage/backpack/satchel_cap

/datum/job/vlt_engineer
	title = "Vault Engineer"
	flag = VAULTENGINEER
	department_head = list("Overseer")
	department_flag = ENGSEC
	faction = "vault"
	status = "vaultmember"
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Overseer"
	selection_color = "#005A20"

	outfit = /datum/outfit/job/vlt_engineer

	access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
									access_external_airlocks, access_construction, access_atmospherics, access_tcomsat)
	minimal_access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
									access_external_airlocks, access_construction, access_tcomsat)

/datum/outfit/job/vlt_engineer
	name = "Vault Engineer"

	uniform = /obj/item/clothing/under/bespinsuit
	shoes = /obj/item/clothing/shoes/bespinboots
	suit = /obj/item/clothing/suit/bespinjacket
	back = /obj/item/weapon/storage/backpack/industrial
	box = /obj/item/weapon/storage/box/engineer
	id = /obj/item/weapon/card/id/vault
	pda_slot = slot_l_store
	belt = /obj/item/device/pda/engineering
	r_pocket = /obj/item/device/radio

/datum/job/vlt_doctor
	title = "Vault Medical Doctor"
	flag = VAULTDOCTOR
	department_head = list("Overseer")
	department_flag = ENGSEC
	faction = "vault"
	status = "vaultmember"
	total_positions = 4
	spawn_positions = 4
	supervisors = "the chief medical officer"
	selection_color = "#005A20"

	outfit = /datum/outfit/job/vlt_doctor

	access = list(12)
	minimal_access = list(access_medical, access_morgue, access_surgery)

/datum/outfit/job/vlt_doctor
	name = "Vault Medical Doctor"

	belt = /obj/item/device/pda/medical
	id = /obj/item/weapon/card/id/vault
//	ears = /obj/item/device/radio/headset/headset_vlt
	uniform = /obj/item/clothing/under/f13/vault/v113
	shoes = /obj/item/clothing/shoes/jackboots
	suit =  /obj/item/clothing/suit/toggle/labcoat
	l_hand = /obj/item/weapon/storage/firstaid/regular
	suit_store = /obj/item/device/flashlight/pen
	r_pocket = /obj/item/device/radio
	back = /obj/item/weapon/storage/backpack/medic
	satchel = /obj/item/weapon/storage/backpack/satchel

/* /datum/job/scientist
	name = "Scientist"
	flag = SCIENTIST
	department_head = list("Research Director")
	department_flag = MEDSCI
	faction = "Vault"
	status = "Member"
	total_positions = 8
	spawn_positions = 8
	supervisors = "the research director"
	selection_color = "#005A20"

	outfit = /datum/outfit/job/vlt_scientist

	access = list(access_robotics, access_tox, access_tox_storage, access_research, access_xenobiology, access_mineral_storeroom, access_tech_storage, access_genetics, access_maint_tunnels)
	minimal_access = list(access_tox, access_tox_storage, access_research, access_xenobiology, access_mineral_storeroom)

	 datum/outfit/job/vlt_scientist
	name = "Scientist"

	gloves = /obj/item/clothing/gloves/pda/toxins
	ears = /obj/item/device/radio/headset/headset_vlt
	uniform = /obj/item/clothing/under/f13/vault/v13
	shoes = /obj/item/clothing/shoes/laceup
	suit = /obj/item/clothing/suit/toggle/labcoat/science
*/

/datum/job/vlt_officer
	title = "Vault Security Officer"
	flag = VAULTOFFICER
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "vault"
	status = "vaultmember"
	total_positions = 6 //Handled in /datum/controller/occupations/proc/setup_officer_positions()
	spawn_positions = 6 //Handled in /datum/controller/occupations/proc/setup_officer_positions()
	supervisors = "the head of security, and the head of your assigned department (if applicable)"
	selection_color = "#005A20"


	outfit = /datum/outfit/job/vlt_security

	access = list(12, 63)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_court, access_weapons) //But see /datum/job/warden/get_access()


/datum/outfit/job/vlt_security
	name = "Security Officer"

	id = /obj/item/weapon/card/id/vault
	belt = /obj/item/device/pda/security
	uniform = /obj/item/clothing/under/f13/vault/v113
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/helmet/sec
	suit = /obj/item/clothing/suit/armor/bulletproof
	shoes = /obj/item/clothing/shoes/jackboots
	r_pocket = /obj/item/device/radio
	l_pocket = /obj/item/device/assembly/flash/handheld
	backpack_contents = list(/obj/item/weapon/melee/classic_baton/telescopic=1,\
		/obj/item/weapon/restraints/handcuffs=1)
	back = /obj/item/weapon/storage/backpack/security
	box = /obj/item/weapon/storage/box/security

	var/department = null
	var/tie = null
	var/list/dep_access = null
	var/destination = null
	var/spawn_point = null

/datum/job/dweller
	title = "Vault Dweller"
	flag = VAULTDWELLER
	department_flag = ENGSEC
	faction = "vault"
	status = "vaultmember"
	total_positions = -1
	spawn_positions = -1
	supervisors = "overseer"
	selection_color = "#005A20"
	access = list(access_maint_tunnels)
	minimal_access = list()
	outfit = /datum/outfit/job/dweller

	access = list(12)



/datum/outfit/job/dweller
	name = "Vault Dweller"

	uniform = /obj/item/clothing/under/f13/vault/v113
	belt = /obj/item/device/pda
	id = /obj/item/weapon/card/id/vault
	r_pocket = /obj/item/device/radio
	back = /obj/item/weapon/storage/backpack/
	shoes = /obj/item/clothing/shoes/jackboots