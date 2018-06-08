//Fallout 13 contributor packs directory

/datum/content_pack
	var
		name = "What?"
		id = "shit"
		desc = "Something is wrong! Maybe you already have this content pack?"
		list/items = list()
		list/sorted_items = list()
		list/roles = list()
		list/pets = list()
		price = 99999
	proc
		on_set(client/client)
			return 1
		generate_sorted_list() //
			sorted_items["weapon"] = list()
			sorted_items["misc"] = list()
			sorted_items["head"] = list()
			sorted_items["armor"] = list()
			sorted_items["gloves"] = list()
			sorted_items["shoes"] = list()
			sorted_items["uniform"] = list()
		sort_items()
			for(var/item in items)
				if(get_var_from_type(item, "w_class") < WEIGHT_CLASS_NORMAL)
					sorted_items["misc"] |= item
				sorted_items[slot_name_by_type(item)] |= item
	New()
		. = ..()
		if(!items.len)
			return .
		generate_sorted_list()
		sort_items()


/datum/content_pack/starter
	name = "Starter"
	id = "starter"
	desc = "<b>Available to: All factions!</b><br>Everyone has these vital items, for free!<br><i>Note: All roles have listed weapons and items that go to pocket slots. Although, some roles have certain clothing items disabled by default to preserve the general role stylistics. Settler role has it all.</i>"
	items = list(
		/obj/item/clothing/shoes/f13/rag,
		// Hats
		/obj/item/clothing/head/f13/headscarf,
		/obj/item/clothing/head/f13/pot,
		// Goggles
		/obj/item/clothing/glasses/regular,
		// Uniforms
		/obj/item/clothing/under/pants/f13/ghoul,
		/obj/item/clothing/under/pants/f13/cloth,
		/obj/item/clothing/under/pants/f13/caravan,
		/obj/item/clothing/under/f13/rag,
		/obj/item/clothing/under/f13/tribal,
		/obj/item/clothing/under/f13/female/tribal,
		/obj/item/clothing/under/f13/settler,
		/obj/item/clothing/under/f13/brahmin,
		/obj/item/clothing/under/f13/female/brahmin,
		/obj/item/clothing/under/f13/worn,
		// Suits
		/obj/item/clothing/suit/f13/mantle_liz,
		// Items
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival,
		/obj/item/weapon/dice/d6,
		/obj/item/toy/cards/deck,
		/obj/item/weapon/storage/fancy/cigarettes,
		/obj/item/weapon/storage/fancy/cigarettes/tortoise,
		/obj/item/weapon/storage/box/matches,
		/obj/item/device/flashlight/torch,
		// Weapons
		/obj/item/weapon/pipe,
		/obj/item/weapon/tireiron,
		/obj/item/weapon/pan,
		/obj/item/weapon/kitchen/rollingpin,
		/obj/item/weapon/kitchen/knife,
		/obj/item/weapon/kitchen/knife/butcher,
		/obj/item/weapon/scalpel,
		/obj/item/weapon/shovel,
		/obj/item/weapon/hammer,
		/obj/item/weapon/crowbar,
		/obj/item/weapon/screwdriver,
		/obj/item/weapon/wirecutters,
		/obj/item/weapon/wrench,
		/obj/item/weapon/weldingtool/experimental,
		/obj/item/weapon/restraints/legcuffs/bola
		)
	price = -1

/datum/content_pack/cigarettes
	name = "Cigarettes for Lead Developer"
	id = "cigarettes"
	desc = "<b>Available to: All factions!</b><br>The most simple way to encourage the Lead Developer - Jackerzz aka Maxyo, is to get him a pack of cigarettes.<br>...<br><i>Note: World Health Organization discourages you from smoking. Inhaling any kind of smoke is bad for your health!</i>"
	items = list(
		/obj/item/weapon/storage/fancy/rollingpapers,
		/obj/item/weapon/storage/fancy/cigarettes/cigpack_myron,
		/obj/item/weapon/storage/fancy/cigarettes/cigpack_joy,
		/obj/item/clothing/mask/cigarette,
		/obj/item/clothing/mask/cigarette/rollie,
		/obj/item/clothing/mask/cigarette/cigar,
		/obj/item/clothing/mask/cigarette/cigar/cohiba,
		/obj/item/clothing/mask/cigarette/cigar/havana,
		/obj/item/weapon/lighter
		)
	price = -1

/datum/content_pack/team_fortress
	name = "Hat simulator"
	id = "team_fortress"
	desc = "<b>Available to: Neutral, City and Raider factions only!</b><br>Experience power of Fallout 13 with our accurately developed hat simulation system.<br>This set includes five additional hats!"
	items = list(
		/obj/item/clothing/head/soft/f13/baseball,
		/obj/item/clothing/head/soft/f13/utility,
		/obj/item/clothing/head/f13/cowboy,
		/obj/item/clothing/head/f13/bandit,
		/obj/item/clothing/head/f13/stormchaser,
		/obj/item/clothing/head/f13/gambler
		)
	price = -1

/datum/content_pack/wardrobe
	name = "High fashion"
	id = "wardrobe"
	desc = "<b>Available to: Neutral and City factions only!</b><br>Got tired of your character looking like a homeless junkie?<br>This pack was created specially for you - wasteland fashion collection of year 2255 !<br>This set inludes a pair of worn but sturdy work boots, and seven additional outfits that provide considerable diversity in character creation.<br><i>Note: A dark red wasteland wanderer jacket can be zipped up as well.</i>"
	items = list(
		/obj/item/clothing/shoes/f13/explorer,
		// Uniforms
		/obj/item/clothing/under/f13/relaxedwear,
		/obj/item/clothing/under/f13/spring,
		/obj/item/clothing/under/f13/merchant,
		/obj/item/clothing/under/f13/trader,
		/obj/item/clothing/under/f13/caravaneer,
		/obj/item/clothing/under/f13/petrochico,
		/obj/item/clothing/under/f13/mechanic,
		/obj/item/clothing/under/f13/lumberjack,
		/obj/item/clothing/under/f13/machinist,
		// Suits
		/obj/item/clothing/suit/f13/puffer,
		/obj/item/clothing/suit/toggle/labcoat/f13/wanderer
		)
	price = -1

/datum/content_pack/vault13
	name = "Vault 13"
	id = "vault13"
	desc = "<b>Available to: Neutral, City and Raider factions only!</b><br>Vault 13 has opened long time ago, now you can try and pretend your relatives actually lived there, or explain that you got frozen in time somehow - that's why items you got, look so pristine.</i>"
	items = list(
		/obj/item/clothing/under/f13/vault/v13,
		/obj/item/weapon/reagent_containers/food/drinks/flask/vault13,
		/obj/item/weapon/lighter/vault13
		)
	price = -0

/datum/content_pack/bard
	name = "Musical instruments"
	id = "bard"
	desc = "<b>Available to: All factions!</b><br>Russian General says, :<br><i>\"I do not like rock-and-roll music. This is too loud! I like folk music, soft, nice music, huh? Polka, waltz, anything!\"</i><br><b>Six String Samurai (1998)</b>"
	items = list(
		/obj/item/device/harmonica,
		/obj/item/device/instrument/guitar
		)
	price = -0

/datum/content_pack/trooper_armor
	name = "Batallion themed NCR armor"
	id = "trooper_armor"
	desc = "<b>Available to: NCR Trooper and NCR Sergeant roles only!</b><br>Form a strike squad with your friends, wearing the matching NCR armor sets!<br>This set includes six additional trooper armor skins:<br>White star insignia<br>Red star insignia<br>Holy cross insignia<br>Hear symbol insignia<br>Radiation symbol insignia<br>White skull insignia"
	items = list(
		/obj/item/clothing/suit/armor/f13/ncr/patriot,
		/obj/item/clothing/suit/armor/f13/ncr/soldier,
		/obj/item/clothing/suit/armor/f13/ncr/commie,
		/obj/item/clothing/suit/armor/f13/ncr/preacher,
		/obj/item/clothing/suit/armor/f13/ncr/lover,
		/obj/item/clothing/suit/armor/f13/ncr/stalker,
		/obj/item/clothing/suit/armor/f13/ncr/punisher
		)
	price = -1

/datum/content_pack/heavy_trooper
	name = "NCR Heavy Infantry Corps"
	id = "heavy_trooper"
	desc = "<b>Available to: NCR Trooper and NCR Sergeant roles only!</b><br>Become the NCR Heavy Trooper with a set of NCR salvaged power armor and a big gun!"
	items = list(
		/obj/item/clothing/head/helmet/power_armor/ncr,
		/obj/item/clothing/suit/armor/f13/ncr/salvaged,
		/obj/item/weapon/twohanded/largehammer,
		/obj/item/weapon/gun/ballistic/automatic/rifle,
		/obj/item/ammo_box/magazine/m308
		)
	price = -0

/datum/content_pack/tesla
	name = "Enclave Tesla Regiment"
	id = "tesla"
	desc = "<b>Available to: Enclave faction only!</b><br>Become the Tesla Trooper with a set of badass tesla power armor!<br><i>Note: Tesla weapons do not apply to this pack (yet).</i>"
	items = list(
		/obj/item/clothing/head/helmet/power_armor/tesla,
		/obj/item/clothing/suit/armor/f13/power_armor/tesla
		)
	price = -0

/datum/content_pack/khan
	name = "Great Khan"
	id = "khan"
	desc = "<b>Available to: Neutral and Raider factions only!</b><br>The glory of the Great Khans will be restored with this themed outfit set!<br>Or you can use this tribal spear to effectively defend yourself against a wildlife, at the start of the game.<br><i>Note: Great Khan jacket can be zipped up as well.</i>"
	items = list(
		/obj/item/clothing/head/helmet/f13/khan,
		/obj/item/clothing/suit/toggle/labcoat/f13/khan,
		/obj/item/clothing/under/pants/f13/khan,
		/obj/item/clothing/shoes/f13/khan,
		/obj/item/weapon/twohanded/tribal_spear,
		/obj/item/weapon/restraints/legcuffs/bola/tribal
		)
	price = -0

/datum/content_pack/super_ten
	name = "10 Iron"
	id = "super_ten"
	desc = "<b>Available to: All factions!</b><br>This pack includes a powerful 10 iron club."
	items = list(
		/obj/item/weapon/golf10,
		)
	price = -0

/datum/content_pack/punk
	name = "Punk"
	id = "punk"
	desc = "<b>Available to: Neutral and Raider factions only!</b><br>If the game doesn't feel metal enough for you, this set of items may fix it.<br><i>Note: Punk lives!</i><br>"
	items = list(
		/obj/item/clothing/shoes/f13/military/diesel,
		/obj/item/clothing/shoes/f13/military/female/diesel,
		/obj/item/clothing/suit/armor/f13/punk,
		/obj/item/device/instrument/eguitar,
		/obj/item/key/motorcycle
		)
	price = -0

/*
/datum/content_pack/starwars
	name = "Mos Eisley desert pack"
	id = "starwars"
	desc = "<b>Hate sandstorms and the wasteland in general? Want to cosplay as a fancy space wizard but look like a nerd wearing cardboard when you try to? This pack is for you!"
	items = list(
	    /obj/item/clothing/under/puristunder,
	    /obj/item/clothing/under/extremistunder,
		/obj/item/clothing/under/puristunderalt,
		/obj/item/clothing/under/extremistunderalt,
		/obj/item/clothing/shoes/puristboots,
		/obj/item/clothing/shoes/extremistboots,
		/obj/item/clothing/suit/hooded/puristrobes,
		/obj/item/clothing/suit/hooded/extremistrobes,
		)
	price = -0
*/

/datum/content_pack/off
	name = "OFF"
	id = "off"
	desc = "<b>Available to: Neutral and Raider factions only!</b><br>Carefully selected items from OFF game.<br><i>Note: Purification in progress...</i><br>"
	items = list(
		/obj/item/clothing/head/soft/black,
		/obj/item/clothing/under/f13/batter,
		/obj/item/weapon/twohanded/baseball,
		/obj/item/clothing/gloves/f13/baseball,
		/obj/item/clothing/shoes/f13/fancy
		)
	price = -0

/datum/content_pack/madmax
	name = "Mad Max"
	id = "madmax"
	desc = "<b>Available to: Neutral and Raider factions only!</b><br>Carefully selected items from an entire Mad Max movie franchise.<br><i>Note: Steering wheel is used just like a car key.<br>Small bit of trivia, the Fury Road cosmetics were some of the first custom items on our server, they were just never implemented.</i>"
	items = list(
		/obj/item/clothing/suit/f13/mfp,
		/obj/item/clothing/suit/f13/mfp/raider,
		/obj/item/weapon/reagent_containers/food/snacks/f13/dog,
		/obj/item/weapon/gun/ballistic/shotgun/trail,
		/obj/item/clothing/head/f13/safari,
		/obj/item/clothing/under/pants/f13/warboy,
		/obj/item/key/buggy/wheel,
		/obj/item/clothing/under/furyclothes,
		/obj/item/clothing/suit/furyjacket,
		/obj/item/clothing/shoes/furyshoes,
		)
	price = -0

/*
/datum/content_pack/doom
	name = "Doom"
	id = "doom"
	desc = "<b>Available to: Neutral and Raider factions only!</b><br>Carefully selected items from Doom game.<br><i>Note: Union Aerospace Corporation welcomes you aboard a shuttle leaving Earth on the way to Mars. Please fasten your seatbelts and have a safe flight!</i>"
	items = list(
		/obj/item/clothing/head/helmet/f13/doom,
		/obj/item/clothing/suit/armor/f13/doom,
		/obj/item/clothing/under/pants/f13/doom,
		/obj/item/clothing/gloves/f13/doom,
		/obj/item/clothing/shoes/f13/doom
		)
	price = -1

/datum/content_pack/tribal
	name = "Tribal pack"
	id = "tribal"
	desc = "A pack tailored specifically to Raiders and their tribal characters! Includes two new melee weapons and a plethora of cosmetic goodies."
	items = list(
		/obj/item/clothing/under/tribalshaman,
		/obj/item/clothing/under/tribalwarrior,
		/obj/item/clothing/under/tribaldoctor,
		/obj/item/clothing/suit/tribalshamancloak,
		/obj/item/clothing/head/helmet/bearpelt,
		/obj/item/clothing/head/tribalfeather,
		/obj/item/clothing/mask/tribalpaintpurple,
		/obj/item/clothing/mask/tribalpaintred,
		/obj/item/clothing/mask/tribalpaintgreen,
		/obj/item/weapon/melee/classic_baton/warclub,
		/obj/item/weapon/tomahawk
		)
	price = -1
*/

/*
/datum/content_pack/karate
	name = "Martial Arts pack"
	id = "karate"
	desc = "A pack inspired solely by the 1984 blockbuster The Karate Kid and it's two primary uniforms. Wax on, wax off."
	items = list(
		/obj/item/clothing/under/bonsaigi,
		/obj/item/clothing/under/cobragi,
		/obj/item/clothing/head/bonsaiheadband,
		/obj/item/clothing/head/cobraheadband
		)
	price = -1
*/

/datum/content_pack/leaders
	name = "Role: All Leaders set"
	id = "leaders"
	desc = "<b>Available to: All factions except for Neutral!</b><br><i>Got to rule them all!</i>"
	roles = list(
		/datum/job/gangleader,
		/datum/job/mayor,
		/datum/job/general,
		/datum/job/legate,
		/datum/job/elder,
		/datum/job/colonel
		)
	price = -0

/datum/content_pack/glowing_ghoul
	name = "Player race: Glowing Ghoul"
	id = "glowing_ghoul"
	desc = "<b>Available to: All factions except for the Enclave!</b><br>The following pack gives you ability to create a glowing ghoul character on round start!"
	price = -0

	on_set(client/client)
		client.add_race("glowing ghoul", /datum/species/ghoul/glowing)

/datum/content_pack/terminator
	name = "Wasteland Terminator"
	id = "terminator"
	desc = "<b>Available to: Neutral, City, and Raider factions only! You'll be back.</b><br><i>Thumbs up</i>"
	items = list(
		/obj/item/clothing/suit/terminatorjacket,
		/obj/item/clothing/under/terminatorclothes,
		/obj/item/clothing/shoes/laceup
		)
	price = -0
/*
/datum/content_pack/residentevil
	name = "Wasteland Evil"
	id = "residentevil"
	desc = "<b>Available to: Neutral, City, and Raider factions only! The wasteland is just about as dangerous a place as Raccoon City, why not dress the part?"
	items = list(
		/obj/item/clothing/suit/leonjacket,
		/obj/item/clothing/under/leonclothes,
		/obj/item/clothing/under/chrisclothes,
		/obj/item/clothing/under/barryclothes,
		/obj/item/clothing/under/weskerclothes,
		/obj/item/clothing/under/rpdclothes,
		/obj/item/clothing/gloves/chrisgloves,
		/obj/item/clothing/gloves/leongloves,
		/obj/item/clothing/gloves/rpdgloves,
		/obj/item/clothing/shoes/jackboots,
		/obj/item/clothing/shoes/laceup,
		/obj/item/weapon/storage/belt/reholster,
		/obj/item/weapon/reknife
		)
	price = -0
*/

/datum/content_pack/sierramadre
	name = "Dead Money"
	id = "sierramadre"
	desc = "<b>Available to: Neutral, City, and Raider factions only! The Sierra Madre may be several miles away, but now you can deck yourself out in enough equipment to emulate the experience! Doesn't include a vending machine with near-infinite stimpacks and food powered by casino chips, you freeloading jackass."
	items = list(
		/obj/item/clothing/under/veramale,
		/obj/item/clothing/shoes/laceup,
		/obj/item/clothing/under/verafemale,
		/obj/item/clothing/shoes/sandal,
		/obj/item/clothing/head/helmet/casinohelmet,
		/obj/item/clothing/under/casinoarmor,
		/obj/item/clothing/gloves/combat,
		/obj/item/clothing/shoes/jackboots,
		/obj/item/clothing/under/deadmoney,
		/obj/item/clothing/under/assassinarmor,
		/obj/item/weapon/kitchen/knife/cosmicknife,
		/obj/item/weapon/beartrapfist,
		)
	price = -0

/datum/content_pack/holsters
	name = "Holster Pack"
	id = "holsters"
	desc = "<b>Available to: All factions!</b><br>Brand new holsters to hold even more guns than you already could!"
	items = list(
		/obj/item/weapon/storage/belt/luckyholster,
		/obj/item/weapon/storage/belt/rochellholster,
		/obj/item/weapon/storage/belt/terminatorholster,
		/obj/item/weapon/storage/belt/jakeholster,
		/obj/item/weapon/storage/belt/wolfholster
		)
	price = -0
/*
/datum/content_pack/adminstuff
	name = "Admin Pack"
	id = "adminpack"
	desc = "<b>Available to: Neutral, City, and Raider factions only!</b><br>Recoloured admin sets, now for players too!"
	items = list(
		/obj/item/clothing/shoes/belmontboots,
		/obj/item/clothing/shoes/belmontbootsalt,
		/obj/item/clothing/suit/communitycoat,
		/obj/item/clothing/suit/communitycoatalt,
		/obj/item/clothing/under/communityclothes,
		/obj/item/clothing/under/communityclothesalt,
		/obj/item/clothing/under/wolfclothes,
		/obj/item/clothing/suit/wolfjacket,
		/obj/item/clothing/under/harryclothes,
		/obj/item/clothing/suit/harryjacket
		)
	price = -0
*/