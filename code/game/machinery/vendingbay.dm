
/**
 *  A vending machine
 */
/obj/machinery/vending
	name = "Vendomat"
	desc = "A generic vending machine."
	icon = 'icons/obj/vending.dmi'
	icon_state = "generic"
	layer = BELOW_OBJ_LAYER
	anchored = 1
	density = 1
	obj_flags = OBJ_FLAG_ANCHORABLE
	clicksound = "button"
	clickvol = 40

	var/icon_vend //Icon_state when vending
	var/icon_deny //Icon_state when denying access
	var/diona_spawn_chance = 0.1

	// Power
	use_power = 1
	idle_power_usage = 10
	var/vend_power_usage = 150 //actuators and stuff

	// Vending-related
	var/active = 1 //No sales pitches if off!
	var/vend_ready = 1 //Are we ready to vend?? Is it time??
	var/vend_delay = 10 //How long does it take to vend?
	var/categories = CAT_NORMAL // Bitmask of cats we're currently showing
	var/datum/stored_items/vending_products/currently_vending = null // What we're requesting payment for right now
	var/status_message = "" // Status screen messages like "insufficient funds", displayed in NanoUI
	var/status_error = 0 // Set to 1 if status_message is an error

	/*
		Variables used to initialize the product list
		These are used for initialization only, and so are optional if
		product_records is specified
	*/
	var/list/products	= list() // For each, use the following pattern:
	var/list/contraband	= list() // list(/type/path = amount,/type/path2 = amount2)
	var/list/premium 	= list() // No specified amount = only one in stock
	var/list/prices     = list() // Prices for each item, list(/type/path = price), items not in the list don't have a price.

	// List of vending_product items available.
	var/list/product_records = list()


	// Variables used to initialize advertising
	var/product_slogans = "" //String of slogans spoken out loud, separated by semicolons
	var/product_ads = "" //String of small ad messages in the vending screen

	var/list/ads_list = list()

	// Stuff relating vocalizations
	var/list/slogan_list = list()
	var/shut_up = 1 //Stop spouting those godawful pitches!
	var/vend_reply //Thank you for shopping!
	var/last_reply = 0
	var/last_slogan = 0 //When did we last pitch?
	var/slogan_delay = 6000 //How long until we can pitch again?

	// Things that can go wrong
	emagged = 0 //Ignores if somebody doesn't have card access to that machine.
	var/seconds_electrified = 0 //Shock customers like an airlock.
	var/shoot_inventory = 0 //Fire items at customers! We're broken!
	var/shooting_chance = 2 //The chance that items are being shot per tick

	var/scan_id = 1
	var/obj/item/weapon/coin/coin
	var/datum/wires/vending/wires = null

/obj/machinery/vending/New()
	..()
	wires = new(src)
	spawn(4)
		if(src.product_slogans)
			src.slogan_list += splittext(src.product_slogans, ";")

			// So not all machines speak at the exact same time.
			// The first time this machine says something will be at slogantime + this random value,
			// so if slogantime is 10 minutes, it will say it at somewhere between 10 and 20 minutes after the machine is crated.
			src.last_slogan = world.time + rand(0, slogan_delay)

		if(src.product_ads)
			src.ads_list += splittext(src.product_ads, ";")

		src.build_inventory()
		power_change()

		return

	return

/**
 *  Build src.produdct_records from the products lists
 *
 *  src.products, src.contraband, src.premium, and src.prices allow specifying
 *  products that the vending machine is to carry without manually populating
 *  src.product_records.
 */
/obj/machinery/vending/proc/build_inventory()
	var/list/all_products = list(
		list(src.products, CAT_NORMAL),
		list(src.contraband, CAT_HIDDEN),
		list(src.premium, CAT_COIN))

	for(var/current_list in all_products)
		var/category = current_list[2]

		for(var/entry in current_list[1])
			var/datum/stored_items/vending_products/product = new/datum/stored_items/vending_products(src, entry)

			product.price = (entry in src.prices) ? src.prices[entry] : 0
			product.amount = (current_list[1][entry]) ? current_list[1][entry] : 1
			product.category = category

			src.product_records.Add(product)

/obj/machinery/vending/Destroy()
	qdel(wires)
	wires = null
	qdel(coin)
	coin = null
	for(var/datum/stored_items/vending_products/R in product_records)
		qdel(R)
	product_records = null
	return ..()

/obj/machinery/vending/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			if (prob(50))
				qdel(src)
				return
		if(3.0)
			if (prob(25))
				spawn(0)
					src.malfunction()
					return
				return
		else
	return

/obj/machinery/vending/emag_act(var/remaining_charges, var/mob/user)
	if (!emagged)
		src.emagged = 1
		to_chat(user, "You short out the product lock on \the [src]")
		return 1

/obj/machinery/vending/attackby(obj/item/weapon/W as obj, mob/user as mob)

	var/obj/item/weapon/card/id/I = W.GetIdCard()

	if (currently_vending && vendor_account && !vendor_account.suspended)
		var/paid = 0
		var/handled = 0

		if (I) //for IDs and PDAs and wallets with IDs
			paid = pay_with_card(I,W)
			handled = 1
		else if (istype(W, /obj/item/weapon/spacecash/ewallet))
			var/obj/item/weapon/spacecash/ewallet/C = W
			paid = pay_with_ewallet(C)
			handled = 1
		else if (istype(W, /obj/item/weapon/spacecash/bundle))
			var/obj/item/weapon/spacecash/bundle/C = W
			paid = pay_with_cash(C)
			handled = 1

		if(paid)
			src.vend(currently_vending, usr)
			return
		else if(handled)
			GLOB.nanomanager.update_uis(src)
			return // don't smack that machine with your 2 thalers

	if (I || istype(W, /obj/item/weapon/spacecash))
		attack_hand(user)
		return
	else if(istype(W, /obj/item/weapon/screwdriver))
		src.panel_open = !src.panel_open
		to_chat(user, "You [src.panel_open ? "open" : "close"] the maintenance panel.")
		src.overlays.Cut()
		if(src.panel_open)
			src.overlays += image(src.icon, "[initial(icon_state)]-panel")

		GLOB.nanomanager.update_uis(src)  // Speaker switch is on the main UI, not wires UI
		return
	else if(isMultitool(W) || isWirecutter(W))
		if(src.panel_open)
			attack_hand(user)
		return
	else if((obj_flags & OBJ_FLAG_ANCHORABLE) && isWrench(W))
		wrench_floor_bolts(user)
		power_change()
		return
	else if(istype(W, /obj/item/weapon/coin) && premium.len > 0)
		user.drop_item()
		W.forceMove(src)
		coin = W
		categories |= CAT_COIN
		to_chat(user, "<span class='notice'>You insert \the [W] into \the [src].</span>")
		GLOB.nanomanager.update_uis(src)
		return
	else if(attempt_to_stock(W, user))
		return
	..()
	return

/obj/machinery/vending/MouseDrop_T(var/obj/item/I as obj, var/mob/user as mob)
	if(!CanMouseDrop(I, user) || (I.loc != user))
		return
	return attempt_to_stock(I, user)

/obj/machinery/vending/proc/attempt_to_stock(var/obj/item/I as obj, var/mob/user as mob)
	for(var/datum/stored_items/vending_products/R in product_records)
		if(I.type == R.item_path)
			stock(I, R, user)
			return 1

/**
 *  Receive payment with cashmoney.
 */
/obj/machinery/vending/proc/pay_with_cash(var/obj/item/weapon/spacecash/bundle/cashmoney)
	if(currently_vending.price > cashmoney.worth)
		// This is not a status display message, since it's something the character
		// themselves is meant to see BEFORE putting the money in
		to_chat(usr, "\icon[cashmoney] <span class='warning'>That is not enough money.</span>")
		return 0

	visible_message("<span class='info'>\The [usr] inserts some cash into \the [src].</span>")
	cashmoney.worth -= currently_vending.price

	if(cashmoney.worth <= 0)
		usr.drop_from_inventory(cashmoney)
		qdel(cashmoney)
	else
		cashmoney.update_icon()

	// Vending machines have no idea who paid with cash
	credit_purchase("(cash)")
	return 1

/**
 * Scan a chargecard and deduct payment from it.
 *
 * Takes payment for whatever is the currently_vending item. Returns 1 if
 * successful, 0 if failed.
 */
/obj/machinery/vending/proc/pay_with_ewallet(var/obj/item/weapon/spacecash/ewallet/wallet)
	visible_message("<span class='info'>\The [usr] swipes \the [wallet] through \the [src].</span>")
	if(currently_vending.price > wallet.worth)
		src.status_message = "Insufficient funds on chargecard."
		src.status_error = 1
		return 0
	else
		wallet.worth -= currently_vending.price
		credit_purchase("[wallet.owner_name] (chargecard)")
		return 1

/**
 * Scan a card and attempt to transfer payment from associated account.
 *
 * Takes payment for whatever is the currently_vending item. Returns 1 if
 * successful, 0 if failed
 */
/obj/machinery/vending/proc/pay_with_card(var/obj/item/weapon/card/id/I, var/obj/item/ID_container)
	if(I==ID_container || ID_container == null)
		visible_message("<span class='info'>\The [usr] swipes \the [I] through \the [src].</span>")
	else
		visible_message("<span class='info'>\The [usr] swipes \the [ID_container] through \the [src].</span>")
	var/datum/money_account/customer_account = get_account(I.associated_account_number)
	if (!customer_account)
		src.status_message = "Error: Unable to access account. Please contact technical support if problem persists."
		src.status_error = 1
		return 0

	if(customer_account.suspended)
		src.status_message = "Unable to access account: account suspended."
		src.status_error = 1
		return 0

	// Have the customer punch in the PIN before checking if there's enough money. Prevents people from figuring out acct is
	// empty at high security levels
	if(customer_account.security_level != 0) //If card requires pin authentication (ie seclevel 1 or 2)
		var/attempt_pin = input("Enter pin code", "Vendor transaction") as num
		customer_account = attempt_account_access(I.associated_account_number, attempt_pin, 2)

		if(!customer_account)
			src.status_message = "Unable to access account: incorrect credentials."
			src.status_error = 1
			return 0

	if(currently_vending.price > customer_account.money)
		src.status_message = "Insufficient funds in account."
		src.status_error = 1
		return 0
	else
		// Okay to move the money at this point
		var/datum/transaction/T = new("[vendor_account.owner_name] (via [name])", "Purchase of [currently_vending.item_name]", -currently_vending.price, name)

		customer_account.do_transaction(T)

		// Give the vendor the money. We use the account owner name, which means
		// that purchases made with stolen/borrowed card will look like the card
		// owner made them
		credit_purchase(customer_account.owner_name)
		return 1

/**
 *  Add money for current purchase to the vendor account.
 *
 *  Called after the money has already been taken from the customer.
 */
/obj/machinery/vending/proc/credit_purchase(var/target as text)
	vendor_account.money += currently_vending.price

	var/datum/transaction/T = new(target, "Purchase of [currently_vending.item_name]", currently_vending.price, name)
	vendor_account.do_transaction(T)

/obj/machinery/vending/attack_ai(mob/user as mob)
	return attack_hand(user)

/obj/machinery/vending/attack_hand(mob/user as mob)
	if(stat & (BROKEN|NOPOWER))
		return

	if(src.seconds_electrified != 0)
		if(src.shock(user, 100))
			return

	wires.Interact(user)
	ui_interact(user)

/**
 *  Display the NanoUI window for the vending machine.
 *
 *  See NanoUI documentation for details.
 */
/obj/machinery/vending/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	user.set_machine(src)

	var/list/data = list()
	if(currently_vending)
		data["mode"] = 1
		data["product"] = currently_vending.item_name
		data["price"] = currently_vending.price
		data["message_err"] = 0
		data["message"] = src.status_message
		data["message_err"] = src.status_error
	else
		data["mode"] = 0
		var/list/listed_products = list()

		for(var/key = 1 to src.product_records.len)
			var/datum/stored_items/vending_products/I = src.product_records[key]

			if(!(I.category & src.categories))
				continue

			listed_products.Add(list(list(
				"key" = key,
				"name" = I.item_name,
				"price" = I.price,
				"color" = I.display_color,
				"amount" = I.get_amount())))

		data["products"] = listed_products

	if(src.coin)
		data["coin"] = src.coin.name

	if(src.panel_open)
		data["panel"] = 1
		data["speaker"] = src.shut_up ? 0 : 1
	else
		data["panel"] = 0

	ui = GLOB.nanomanager.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "vending_machine.tmpl", src.name, 440, 600)
		ui.set_initial_data(data)
		ui.open()

/obj/machinery/vending/Topic(href, href_list)
	if(stat & (BROKEN|NOPOWER))
		return
	if(..())
		return

	if(href_list["remove_coin"] && !istype(usr,/mob/living/silicon))
		if(!coin)
			to_chat(usr, "There is no coin in this machine.")
			return

		coin.forceMove(src.loc)
		if(!usr.get_active_hand())
			usr.put_in_hands(coin)
		to_chat(usr, "<span class='notice'>You remove \the [coin] from \the [src]</span>")
		coin = null
		categories &= ~CAT_COIN

	if ((usr.contents.Find(src) || (in_range(src, usr) && istype(src.loc, /turf))))
		if ((href_list["vend"]) && (src.vend_ready) && (!currently_vending))
			if((!allowed(usr)) && !emagged && scan_id)	//For SECURE VENDING MACHINES YEAH
				to_chat(usr, "<span class='warning'>Access denied.</span>")//Unless emagged of course
				flick(icon_deny,src)
				return

			var/key = text2num(href_list["vend"])
			var/datum/stored_items/vending_products/R = product_records[key]

			// This should not happen unless the request from NanoUI was bad
			if(!(R.category & src.categories))
				return

			if(R.price <= 0)
				src.vend(R, usr)
			else if(istype(usr,/mob/living/silicon)) //If the item is not free, provide feedback if a synth is trying to buy something.
				to_chat(usr, "<span class='danger'>Artificial unit recognized.  Artificial units cannot complete this transaction.  Purchase canceled.</span>")
				return
			else
				src.currently_vending = R
				if(!vendor_account || vendor_account.suspended)
					src.status_message = "This machine is currently unable to process payments due to problems with the associated account."
					src.status_error = 1
				else
					src.status_message = "Please swipe a card or insert cash to pay for the item."
					src.status_error = 0

		else if (href_list["cancelpurchase"])
			src.currently_vending = null

		else if ((href_list["togglevoice"]) && (src.panel_open))
			src.shut_up = !src.shut_up

		GLOB.nanomanager.update_uis(src)

/obj/machinery/vending/proc/vend(var/datum/stored_items/vending_products/R, mob/user)
	if((!allowed(usr)) && !emagged && scan_id)	//For SECURE VENDING MACHINES YEAH
		to_chat(usr, "<span class='warning'>Access denied.</span>")//Unless emagged of course
		flick(src.icon_deny,src)
		return
	src.vend_ready = 0 //One thing at a time!!
	src.status_message = "Vending..."
	src.status_error = 0
	GLOB.nanomanager.update_uis(src)

	if (R.category & CAT_COIN)
		if(!coin)
			to_chat(user, "<span class='notice'>You need to insert a coin to get this item.</span>")
			return
		if(coin.string_attached)
			if(prob(50))
				to_chat(user, "<span class='notice'>You successfully pull the coin out before \the [src] could swallow it.</span>")
			else
				to_chat(user, "<span class='notice'>You weren't able to pull the coin out fast enough, the machine ate it, string and all.</span>")
				qdel(coin)
				coin = null
				categories &= ~CAT_COIN
		else
			qdel(coin)
			coin = null
			categories &= ~CAT_COIN

	if(((src.last_reply + (src.vend_delay + 200)) <= world.time) && src.vend_reply)
		spawn(0)
			src.speak(src.vend_reply)
			src.last_reply = world.time

	use_power(vend_power_usage)	//actuators and stuff
	if (src.icon_vend) //Show the vending animation if needed
		flick(src.icon_vend,src)
	spawn(src.vend_delay) //Time to vend
		if(prob(diona_spawn_chance)) //Hehehe
			var/turf/T = get_turf(src)
			var/mob/living/carbon/alien/diona/S = new(T)
			src.visible_message("<span class='notice'>\The [src] makes an odd grinding noise before coming to a halt as \a [S.name] slurmps out from the receptacle.</span>")
		else //Just a normal vend, then
			R.get_product(get_turf(src))
			src.visible_message("\The [src] whirs as it vends \the [R.item_name].")
			if(prob(1)) //The vending gods look favorably upon you
				sleep(3)
				if(R.get_product(get_turf(src)))
					src.visible_message("<span class='notice'>\The [src] clunks as it vends an additional [R.item_name].</span>")

		src.status_message = ""
		src.status_error = 0
		src.vend_ready = 1
		currently_vending = null
		GLOB.nanomanager.update_uis(src)

/**
 * Add item to the machine
 *
 * Checks if item is vendable in this machine should be performed before
 * calling. W is the item being inserted, R is the associated vending_product entry.
 */
/obj/machinery/vending/proc/stock(obj/item/weapon/W, var/datum/stored_items/vending_products/R, var/mob/user)
	if(!user.unEquip(W))
		return

	if(R.add_product(W))
		to_chat(user, "<span class='notice'>You insert \the [W] in the product receptor.</span>")
		GLOB.nanomanager.update_uis(src)
		return 1

	GLOB.nanomanager.update_uis(src)

/obj/machinery/vending/Process()
	if(stat & (BROKEN|NOPOWER))
		return

	if(!src.active)
		return

	if(src.seconds_electrified > 0)
		src.seconds_electrified--

	//Pitch to the people!  Really sell it!
	if(((src.last_slogan + src.slogan_delay) <= world.time) && (src.slogan_list.len > 0) && (!src.shut_up) && prob(5))
		var/slogan = pick(src.slogan_list)
		src.speak(slogan)
		src.last_slogan = world.time

	if(src.shoot_inventory && prob(shooting_chance))
		src.throw_item()

	return

/obj/machinery/vending/proc/speak(var/message)
	if(stat & NOPOWER)
		return

	if (!message)
		return

	for(var/mob/O in hearers(src, null))
		O.show_message("<span class='game say'><span class='name'>\The [src]</span> beeps, \"[message]\"</span>",2)
	return

/obj/machinery/vending/powered()
	return anchored && ..()

/obj/machinery/vending/update_icon()
	if(stat & BROKEN)
		icon_state = "[initial(icon_state)]-broken"
	else if( !(stat & NOPOWER) )
		icon_state = initial(icon_state)
	else
		spawn(rand(0, 15))
			src.icon_state = "[initial(icon_state)]-off"

//Oh no we're malfunctioning!  Dump out some product and break.
/obj/machinery/vending/proc/malfunction()
	for(var/datum/stored_items/vending_products/R in src.product_records)
		while(R.get_amount()>0)
			R.get_product(loc)
		break

	stat |= BROKEN
	src.icon_state = "[initial(icon_state)]-broken"
	return

//Somebody cut an important wire and now we're following a new definition of "pitch."
/obj/machinery/vending/proc/throw_item()
	var/obj/throw_item = null
	var/mob/living/target = locate() in view(7,src)
	if(!target)
		return 0

	for(var/datum/stored_items/vending_products/R in shuffle(src.product_records))
		throw_item = R.get_product(loc)
		if (throw_item)
			break
	if (!throw_item)
		return 0
	spawn(0)
		throw_item.throw_at(target, rand(1,2), 3, src)
	src.visible_message("<span class='warning'>\The [src] launches \a [throw_item] at \the [target]!</span>")
	return 1

/*
 * Vending machine types
 */

/*

/obj/machinery/vending/[vendors name here]   // --vending machine template   :)
	name = ""
	desc = ""
	icon = ''
	icon_state = ""
	vend_delay = 15
	products = list()
	contraband = list()
	premium = list()

*/

/obj/machinery/vending/boozeomat
	name = "\improper Booze-O-Mat"
	desc = "A technological marvel, supposedly able to mix just the mixture you'd like to drink the moment you ask for one."
	icon_state = "boozeomat"        //////////////18 drink entities below, plus the glasses, in case someone wants to edit the number of bottles
	icon_deny = "boozeomat-deny"
	products = list(/obj/item/weapon/reagent_containers/food/drinks/bottle/gin = 5,/obj/item/weapon/reagent_containers/food/drinks/bottle/whiskey = 5,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/tequila = 5,/obj/item/weapon/reagent_containers/food/drinks/bottle/vodka = 5,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/vermouth = 5,/obj/item/weapon/reagent_containers/food/drinks/bottle/rum = 5,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/wine = 5,/obj/item/weapon/reagent_containers/food/drinks/bottle/cognac = 5,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/kahlua = 5,/obj/item/weapon/reagent_containers/food/drinks/bottle/hcider = 5,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/absinthe = 5, /obj/item/weapon/reagent_containers/food/drinks/bottle/grappa = 5,
					/obj/item/weapon/reagent_containers/food/drinks/ale = 6,/obj/item/weapon/reagent_containers/food/drinks/bottle/orangejuice = 4,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/tomatojuice = 4,/obj/item/weapon/reagent_containers/food/drinks/bottle/limejuice = 4,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/cream = 4,/obj/item/weapon/reagent_containers/food/drinks/soda_cans/tonic = 8,
					/obj/item/weapon/reagent_containers/food/drinks/soda_cans/cola = 8, /obj/item/weapon/reagent_containers/food/drinks/soda_cans/sodawater = 15,
					/obj/item/weapon/reagent_containers/food/drinks/drinkingglass = 30,/obj/item/weapon/reagent_containers/food/drinks/ice = 10,
					/obj/item/weapon/reagent_containers/food/drinks/drinkingglass/shotglass = 12,
					/obj/item/weapon/reagent_containers/food/drinks/flask = 3)
	contraband = list(/obj/item/weapon/reagent_containers/food/drinks/mug/tea = 12)
	product_slogans = "I hope nobody asks me for a bloody cup o' tea...;Alcohol is humanity's friend. Would you abandon a friend?;Quite delighted to serve you!;Is nobody thirsty on this station?"
	product_ads = "Drink up!;Booze is good for you!;Alcohol is humanity's best friend.;Quite delighted to serve you!;Care for a nice, cold beer?;Nothing cures you like booze!;Have a sip!;Have a drink!;Have a beer!;Beer is good for you!;Only the finest alcohol!;Best quality booze since 2053!;Award-winning wine!;Maximum alcohol!;Man loves beer.;A toast for progress!"
	req_access_txt = "25"
	refill_canister = /obj/item/weapon/vending_refill/boozeomat

/obj/machinery/vending/assist
	products = list(	/obj/item/device/assembly/prox_sensor = 5,/obj/item/device/assembly/igniter = 3,/obj/item/device/assembly/signaler = 4,
						/obj/item/weapon/wirecutters = 1, /obj/item/weapon/cartridge/signal = 4)
	contraband = list(/obj/item/device/flashlight = 5,/obj/item/device/assembly/timer = 2, /obj/item/device/assembly/voice = 2, /obj/item/device/assembly/health = 2)
	product_ads = "Only the finest!;Have some tools.;The most robust equipment.;The finest gear in space!"
	armor = list(melee = 100, bullet = 100, laser = 100, energy = 100, bomb = 0, bio = 0, rad = 0, fire = 100, acid = 50)
	resistance_flags = FIRE_PROOF

/obj/machinery/vending/coffee
	name = "\improper Solar's Best Hot Drinks"
	desc = "A vending machine which dispenses hot drinks."
	product_ads = "Have a drink!;Drink up!;It's good for you!;Would you like a hot joe?;I'd kill for some coffee!;The best beans in the galaxy.;Only the finest brew for you.;Mmmm. Nothing like a coffee.;I like coffee, don't you?;Coffee helps you work!;Try some tea.;We hope you like the best!;Try our new chocolate!;Admin conspiracies"
	icon_state = "coffee"
	icon_vend = "coffee-vend"
	products = list(/obj/item/weapon/reagent_containers/food/drinks/coffee = 25,/obj/item/weapon/reagent_containers/food/drinks/mug/tea = 25,/obj/item/weapon/reagent_containers/food/drinks/mug/coco = 25)
	contraband = list(/obj/item/weapon/reagent_containers/food/drinks/ice = 12)
	refill_canister = /obj/item/weapon/vending_refill/coffee

/obj/machinery/vending/snack
	name = "\improper Getmore Chocolate Corp"
	desc = "A snack machine courtesy of the Getmore Chocolate Corporation, based out of Mars"
	product_slogans = "Try our new nougat bar!;Twice the calories for half the price!"
	product_ads = "The healthiest!;Award-winning chocolate bars!;Mmm! So good!;Oh my god it's so juicy!;Have a snack.;Snacks are good for you!;Have some more Getmore!;Best quality snacks straight from mars.;We love chocolate!;Try our new jerky!"
	icon_state = "snack"
	products = list(/obj/item/weapon/reagent_containers/food/snacks/candy = 6,/obj/item/weapon/reagent_containers/food/drinks/dry_ramen = 6,/obj/item/weapon/reagent_containers/food/snacks/chips =6,
					/obj/item/weapon/reagent_containers/food/snacks/sosjerky = 6,/obj/item/weapon/reagent_containers/food/snacks/no_raisin = 6,/obj/item/weapon/reagent_containers/food/snacks/spacetwinkie = 6,
					/obj/item/weapon/reagent_containers/food/snacks/cheesiehonkers = 6)
	contraband = list(/obj/item/weapon/reagent_containers/food/snacks/syndicake = 6)
	refill_canister = /obj/item/weapon/vending_refill/snack
	var/chef_compartment_access = "28"

/obj/machinery/vending/sustenance
	name = "\improper Sustenance Vendor"
	desc = "A vending machine which vends food, as required by section 47-C of the NT's Prisoner Ethical Treatment Agreement."
	product_slogans = "Enjoy your meal.;Enough calories to support strenuous labor."
	product_ads = "Sufficiently healthy.;Efficiently produced tofu!;Mmm! So good!;Have a meal.;You need food to live!;Have some more candy corn!;Try our new ice cups!"
	icon_state = "sustenance"
	products = list(/obj/item/weapon/reagent_containers/food/snacks/tofu = 24,
					/obj/item/weapon/reagent_containers/food/drinks/ice = 12,
					/obj/item/weapon/reagent_containers/food/snacks/candy_corn = 6)
	contraband = list(/obj/item/weapon/kitchen/knife = 6,
					/obj/item/weapon/reagent_containers/food/drinks/coffee = 12,
					/obj/item/weapon/tank/internals/emergency_oxygen = 6,
					/obj/item/clothing/mask/breath = 6)
	armor = list(melee = 100, bullet = 100, laser = 100, energy = 100, bomb = 0, bio = 0, rad = 0, fire = 100, acid = 50)
	resistance_flags = FIRE_PROOF

/obj/machinery/vending/cola
	name = "\improper Robust Softdrinks"
	desc = "A softdrink vendor provided by Robust Industries, LLC."
	icon_state = "Cola_Machine"
	product_slogans = "Robust Softdrinks: More robust than a toolbox to the head!"
	product_ads = "Refreshing!;Hope you're thirsty!;Over 1 million drinks sold!;Thirsty? Why not cola?;Please, have a drink!;Drink up!;The best drinks in space."
	products = list(/obj/item/weapon/reagent_containers/food/drinks/soda_cans/cola = 10,/obj/item/weapon/reagent_containers/food/drinks/soda_cans/space_mountain_wind = 10,
					/obj/item/weapon/reagent_containers/food/drinks/soda_cans/dr_gibb = 10,/obj/item/weapon/reagent_containers/food/drinks/soda_cans/starkist = 10,
					/obj/item/weapon/reagent_containers/food/drinks/soda_cans/space_up = 10,
					/obj/item/weapon/reagent_containers/food/drinks/soda_cans/lemon_lime = 10)
	contraband = list(/obj/item/weapon/reagent_containers/food/drinks/soda_cans/thirteenloko = 6)
	refill_canister = /obj/item/weapon/vending_refill/cola

//This one's from bay12
/obj/machinery/vending/cart
	name = "\improper PTech"
	desc = "Cartridges for PDAs"
	product_slogans = "Carts to go!"
	icon_state = "cart"
	icon_deny = "cart-deny"
	products = list(/obj/item/weapon/cartridge/medical = 10,/obj/item/weapon/cartridge/engineering = 10,/obj/item/weapon/cartridge/security = 10,
					/obj/item/weapon/cartridge/janitor = 10,/obj/item/weapon/cartridge/signal/toxins = 10,/obj/item/device/pda/heads = 10,
					/obj/item/weapon/cartridge/captain = 3,/obj/item/weapon/cartridge/quartermaster = 10)
	armor = list(melee = 100, bullet = 100, laser = 100, energy = 100, bomb = 0, bio = 0, rad = 0, fire = 100, acid = 50)
	resistance_flags = FIRE_PROOF

/obj/machinery/vending/liberationstation
	name = "\improper Liberation Station"
	desc = "An overwhelming amount of <b>ancient patriotism</b> washes over you just by looking at the machine."
	icon_state = "liberationstation"
	req_access_txt = "1"
	product_slogans = "Liberation Station: Your one-stop shop for all things second ammendment!;Be a patriot today, pick up a gun!;Quality weapons for cheap prices!;Better dead than red!"
	product_ads = "Float like an astronaut, sting like a bullet!;Express your second ammendment today!;Guns don't kill people, but you can!;Who needs responsibilities when you have guns?"
	vend_reply = "Remember the name: Liberation Station!"
	products = list(/obj/item/weapon/gun/ballistic/automatic/pistol/deagle/gold = 2,/obj/item/weapon/gun/ballistic/automatic/pistol/deagle/camo = 2,
					/obj/item/weapon/gun/ballistic/automatic/pistol/m1911 = 2,/obj/item/weapon/gun/ballistic/automatic/proto/unrestricted = 2,
					/obj/item/weapon/gun/ballistic/shotgun/automatic/combat = 2,/obj/item/weapon/gun/ballistic/automatic/gyropistol = 1,
					/obj/item/weapon/gun/ballistic/shotgun = 2,/obj/item/weapon/gun/ballistic/automatic/ar = 2)
	premium = list(/obj/item/ammo_box/magazine/smgm9mm = 2,/obj/item/ammo_box/magazine/m50 = 4,/obj/item/ammo_box/magazine/m45 = 2,/obj/item/ammo_box/magazine/m75 = 2)
	contraband = list(/obj/item/clothing/under/patriotsuit = 1,/obj/item/weapon/bedsheet/patriot = 3)
	armor = list(melee = 100, bullet = 100, laser = 100, energy = 100, bomb = 0, bio = 0, rad = 0, fire = 100, acid = 50)
	resistance_flags = FIRE_PROOF

/obj/machinery/vending/cigarette
	name = "\improper ShadyCigs Deluxe"
	desc = "If you want to get cancer, might as well do it in style"
	product_slogans = "Space cigs taste good like a cigarette should.;I'd rather toolbox than switch.;Smoke!;Don't believe the reports - smoke today!"
	product_ads = "Probably not bad for you!;Don't believe the scientists!;It's good for you!;Don't quit, buy more!;Smoke!;Nicotine heaven.;Best cigarettes since 2150.;Award-winning cigs."
	icon_state = "cigs"
	products = list(/obj/item/weapon/storage/fancy/cigarettes = 5,
					/obj/item/weapon/storage/fancy/cigarettes/cigpack_uplift = 3,
					/obj/item/weapon/storage/fancy/cigarettes/cigpack_robust = 3,
					/obj/item/weapon/storage/fancy/cigarettes/cigpack_carp = 3,
					/obj/item/weapon/storage/fancy/cigarettes/cigpack_joy = 3,
					/obj/item/weapon/storage/box/matches = 10,
					/obj/item/weapon/lighter/greyscale = 4,
					/obj/item/weapon/storage/fancy/rollingpapers = 5)
	contraband = list(/obj/item/weapon/lighter = 3, /obj/item/clothing/mask/vape = 5)
	premium = list(/obj/item/weapon/storage/fancy/cigarettes/cigpack_robustgold = 3, \
	/obj/item/weapon/storage/fancy/cigarettes/cigars = 1, /obj/item/weapon/storage/fancy/cigarettes/cigars/havana = 1, /obj/item/weapon/storage/fancy/cigarettes/cigars/cohiba = 1)
	refill_canister = /obj/item/weapon/vending_refill/cigarette

/obj/machinery/vending/medical
	name = "\improper NanoMed Plus"
	desc = "Medical drug dispenser."
	icon_state = "med"
	icon_deny = "med-deny"
	product_ads = "Go save some lives!;The best stuff for your medbay.;Only the finest tools.;Natural chemicals!;This stuff saves lives.;Don't you want some?;Ping!"
	req_access_txt = "5"
	products = list(/obj/item/weapon/reagent_containers/syringe = 12,/obj/item/weapon/reagent_containers/dropper = 3,/obj/item/stack/medical/gauze = 8,/obj/item/weapon/reagent_containers/pill/patch/styptic = 5, /obj/item/weapon/reagent_containers/pill/insulin = 10,
				/obj/item/weapon/reagent_containers/pill/patch/silver_sulf = 5,/obj/item/weapon/reagent_containers/glass/bottle/charcoal = 4, /obj/item/weapon/reagent_containers/spray/medical/sterilizer = 1,
				/obj/item/weapon/reagent_containers/glass/bottle/epinephrine = 4,/obj/item/weapon/reagent_containers/glass/bottle/morphine = 4,/obj/item/weapon/reagent_containers/glass/bottle/salglu_solution = 3,
				/obj/item/weapon/reagent_containers/glass/bottle/toxin = 3,/obj/item/weapon/reagent_containers/syringe/antiviral = 6,/obj/item/weapon/reagent_containers/pill/salbutamol = 2,/obj/item/device/healthanalyzer = 4, /obj/item/device/sensor_device = 2)
	contraband = list(/obj/item/weapon/reagent_containers/pill/tox = 3,/obj/item/weapon/reagent_containers/pill/morphine = 4,/obj/item/weapon/reagent_containers/pill/charcoal = 6)
	premium = list(/obj/item/weapon/storage/box/hug/medical = 1,/obj/item/weapon/reagent_containers/hypospray/medipen = 3, /obj/item/weapon/storage/belt/medical = 3, /obj/item/weapon/wrench/medical = 1)
	armor = list(melee = 100, bullet = 100, laser = 100, energy = 100, bomb = 0, bio = 0, rad = 0, fire = 100, acid = 50)
	resistance_flags = FIRE_PROOF

//This one's from bay12
/obj/machinery/vending/plasmaresearch
	name = "\improper Toximate 3000"
	desc = "All the fine parts you need in one vending machine!"
	products = list(/obj/item/clothing/under/rank/scientist = 6,/obj/item/clothing/suit/bio_suit = 6,/obj/item/clothing/head/bio_hood = 6,
					/obj/item/device/transfer_valve = 6,/obj/item/device/assembly/timer = 6,/obj/item/device/assembly/signaler = 6,
					/obj/item/device/assembly/prox_sensor = 6,/obj/item/device/assembly/igniter = 6)
	contraband = list(/obj/item/device/assembly/health = 3)

/obj/machinery/vending/wallmed
	name = "\improper NanoMed"
	desc = "Wall-mounted Medical Equipment dispenser."
	icon_state = "wallmed"
	icon_deny = "wallmed-deny"
	density = 0
	products = list(/obj/item/weapon/reagent_containers/syringe = 3,/obj/item/weapon/reagent_containers/pill/patch/styptic = 5,
					/obj/item/weapon/reagent_containers/pill/patch/silver_sulf = 5,/obj/item/weapon/reagent_containers/pill/charcoal = 2,
					/obj/item/weapon/reagent_containers/spray/medical/sterilizer = 1)
	contraband = list(/obj/item/weapon/reagent_containers/pill/tox = 2,/obj/item/weapon/reagent_containers/pill/morphine = 2)
	armor = list(melee = 100, bullet = 100, laser = 100, energy = 100, bomb = 0, bio = 0, rad = 0, fire = 100, acid = 50)
	resistance_flags = FIRE_PROOF

/obj/machinery/vending/security
	name = "\improper SecTech"
	desc = "A security equipment vendor"
	product_ads = "Crack capitalist skulls!;Beat some heads in!;Don't forget - harm is good!;Your weapons are right here.;Handcuffs!;Freeze, scumbag!;Don't tase me bro!;Tase them, bro.;Why not have a donut?"
	icon_state = "sec"
	icon_deny = "sec-deny"
	req_access_txt = "1"
	products = list(/obj/item/weapon/restraints/handcuffs = 8,/obj/item/weapon/restraints/handcuffs/cable/zipties = 10,/obj/item/weapon/grenade/flashbang = 4,/obj/item/device/assembly/flash/handheld = 5,
					/obj/item/weapon/reagent_containers/food/snacks/donut = 12,/obj/item/weapon/storage/box/evidence = 6,/obj/item/device/flashlight/seclite = 4,/obj/item/weapon/restraints/legcuffs/bola/energy = 7)
	contraband = list(/obj/item/clothing/glasses/sunglasses = 2,/obj/item/weapon/storage/fancy/donut_box = 2)
	premium = list(/obj/item/weapon/coin/antagtoken = 1)
	armor = list(melee = 100, bullet = 100, laser = 100, energy = 100, bomb = 0, bio = 0, rad = 0, fire = 100, acid = 50)
	resistance_flags = FIRE_PROOF

/obj/machinery/vending/hydronutrients
	name = "\improper NutriMax"
	desc = "A plant nutrients vendor"
	product_slogans = "Aren't you glad you don't have to fertilize the natural way?;Now with 50% less stink!;Plants are people too!"
	product_ads = "We like plants!;Don't you want some?;The greenest thumbs ever.;We like big plants.;Soft soil..."
	icon_state = "nutri"
	icon_deny = "nutri-deny"
	products = list(/obj/item/weapon/reagent_containers/glass/bottle/nutrient/ez = 30,/obj/item/weapon/reagent_containers/glass/bottle/nutrient/l4z = 20,/obj/item/weapon/reagent_containers/glass/bottle/nutrient/rh = 10,/obj/item/weapon/reagent_containers/spray/pestspray = 20,
					/obj/item/weapon/reagent_containers/syringe = 5,/obj/item/weapon/storage/bag/plants = 5,/obj/item/weapon/cultivator = 3,/obj/item/weapon/shovel/spade = 3,/obj/item/device/plant_analyzer = 4)
	contraband = list(/obj/item/weapon/reagent_containers/glass/bottle/ammonia = 10,/obj/item/weapon/reagent_containers/glass/bottle/diethylamine = 5)
	armor = list(melee = 100, bullet = 100, laser = 100, energy = 100, bomb = 0, bio = 0, rad = 0, fire = 100, acid = 50)
	resistance_flags = FIRE_PROOF

/obj/machinery/vending/hydroseeds
	name = "\improper MegaSeed Servitor"
	desc = "When you need seeds fast!"
	product_slogans = "THIS'S WHERE TH' SEEDS LIVE! GIT YOU SOME!;Hands down the best seed selection on the station!;Also certain mushroom varieties available, more for experts! Get certified today!"
	product_ads = "We like plants!;Grow some crops!;Grow, baby, growww!;Aw h'yeah son!"
	icon_state = "seeds"
	products = list(/obj/item/seeds/ambrosia = 3,/obj/item/seeds/apple = 3,/obj/item/seeds/banana = 3,/obj/item/seeds/berry = 3,
						/obj/item/seeds/cabbage = 3,/obj/item/seeds/carrot = 3,/obj/item/seeds/cherry = 3,/obj/item/seeds/chanter = 3,
						/obj/item/seeds/chili = 3,/obj/item/seeds/cocoapod = 3,/obj/item/seeds/coffee = 3,/obj/item/seeds/corn = 3,
						/obj/item/seeds/eggplant = 3,/obj/item/seeds/grape = 3,/obj/item/seeds/grass = 3,/obj/item/seeds/lemon = 3,
						/obj/item/seeds/lime = 3,/obj/item/seeds/orange = 3,/obj/item/seeds/potato = 3,/obj/item/seeds/poppy = 3,
						/obj/item/seeds/pumpkin = 3,/obj/item/seeds/replicapod = 3,/obj/item/seeds/wheat/rice = 3,/obj/item/seeds/soya = 3,/obj/item/seeds/sunflower = 3,
						/obj/item/seeds/tea = 3,/obj/item/seeds/tobacco = 3,/obj/item/seeds/tomato = 3,
						/obj/item/seeds/tower = 3,/obj/item/seeds/watermelon = 3,/obj/item/seeds/wheat = 3,/obj/item/seeds/whitebeet = 3)
	contraband = list(/obj/item/seeds/amanita = 2,/obj/item/seeds/glowshroom = 2,/obj/item/seeds/liberty = 2,/obj/item/seeds/nettle = 2,
						/obj/item/seeds/plump = 2,/obj/item/seeds/reishi = 2,/obj/item/seeds/cannabis = 3, /obj/item/seeds/random = 2)
	premium = list(/obj/item/weapon/reagent_containers/spray/waterflower = 1)
	armor = list(melee = 100, bullet = 100, laser = 100, energy = 100, bomb = 0, bio = 0, rad = 0, fire = 100, acid = 50)
	resistance_flags = FIRE_PROOF

/obj/machinery/vending/magivend
	name = "\improper MagiVend"
	desc = "A magic vending machine."
	icon_state = "MagiVend"
	product_slogans = "Sling spells the proper way with MagiVend!;Be your own Houdini! Use MagiVend!"
	vend_reply = "Have an enchanted evening!"
	product_ads = "FJKLFJSD;AJKFLBJAKL;1234 LOONIES LOL!;>MFW;Kill them fuckers!;GET DAT FUKKEN DISK;HONK!;EI NATH;Destroy the station!;Admin conspiracies since forever!;Space-time bending hardware!"
	products = list(/obj/item/clothing/head/wizard = 1,/obj/item/clothing/suit/wizrobe = 1,/obj/item/clothing/head/wizard/red = 1,/obj/item/clothing/suit/wizrobe/red = 1,/obj/item/clothing/head/wizard/yellow = 1,/obj/item/clothing/suit/wizrobe/yellow = 1,/obj/item/clothing/shoes/sandal/magic = 1,/obj/item/weapon/staff = 2)
	contraband = list(/obj/item/weapon/reagent_containers/glass/bottle/wizarditis = 1)	//No one can get to the machine to hack it anyways; for the lulz - Microwave
	armor = list(melee = 100, bullet = 100, laser = 100, energy = 100, bomb = 0, bio = 0, rad = 0, fire = 100, acid = 50)
	resistance_flags = FIRE_PROOF

/obj/machinery/vending/autodrobe
	name = "\improper AutoDrobe"
	desc = "A vending machine for costumes."
	icon_state = "theater"
	icon_deny = "theater-deny"
	req_access_txt = "46" //Theatre access needed, unless hacked.
	product_slogans = "Dress for success!;Suited and booted!;It's show time!;Why leave style up to fate? Use AutoDrobe!"
	vend_reply = "Thank you for using AutoDrobe!"
	products = list(/obj/item/clothing/suit/chickensuit = 1,/obj/item/clothing/head/chicken = 1,/obj/item/clothing/under/gladiator = 1,
					/obj/item/clothing/head/helmet/gladiator = 1,/obj/item/clothing/under/gimmick/rank/captain/suit = 1,/obj/item/clothing/head/flatcap = 1,
					/obj/item/clothing/suit/toggle/labcoat/mad = 1,/obj/item/clothing/shoes/jackboots = 1,
					/obj/item/clothing/under/female/schoolgirl = 1,/obj/item/clothing/under/female/schoolgirl/red = 1,/obj/item/clothing/under/female/schoolgirl/green = 1,/obj/item/clothing/under/female/schoolgirl/orange = 1,/obj/item/clothing/head/kitty = 1,/obj/item/clothing/under/female/dress_hr = 1,/obj/item/clothing/head/beret = 1,
					/obj/item/clothing/tie/waistcoat = 1,/obj/item/clothing/under/suit_jacket = 1,/obj/item/clothing/head/that =1,/obj/item/clothing/under/kilt = 1,/obj/item/clothing/head/beret = 1,/obj/item/clothing/tie/waistcoat = 1,
					/obj/item/clothing/glasses/monocle =1,/obj/item/clothing/head/bowler = 1,/obj/item/weapon/cane = 1,/obj/item/clothing/under/sl_suit = 1,
					/obj/item/clothing/mask/fakemoustache = 1,/obj/item/clothing/suit/bio_suit/plaguedoctorsuit = 1,/obj/item/clothing/head/plaguedoctorhat = 1,/obj/item/clothing/mask/gas/plaguedoctor = 1,
					/obj/item/clothing/suit/toggle/owlwings = 1, /obj/item/clothing/under/owl = 1,/obj/item/clothing/mask/gas/owl_mask = 1,
					/obj/item/clothing/suit/toggle/owlwings/griffinwings = 1, /obj/item/clothing/under/griffin = 1, /obj/item/clothing/shoes/griffin = 1, /obj/item/clothing/head/griffin = 1,
					/obj/item/clothing/suit/apron = 1,/obj/item/clothing/under/waiter = 1,/obj/item/clothing/suit/jacket/miljacket = 1,
					/obj/item/clothing/under/pirate = 1,/obj/item/clothing/suit/pirate = 1,/obj/item/clothing/head/pirate = 1,/obj/item/clothing/head/bandana = 1,
					/obj/item/clothing/head/bandana = 1,/obj/item/clothing/under/soviet = 1,/obj/item/clothing/head/ushanka = 1,/obj/item/clothing/suit/imperium_monk = 1,
					/obj/item/clothing/mask/gas/cyborg = 1,/obj/item/clothing/suit/holidaypriest = 1,/obj/item/clothing/head/wizard/marisa/fake = 1,
					/obj/item/clothing/suit/wizrobe/marisa/fake = 1,/obj/item/clothing/under/female/sundress = 1,/obj/item/clothing/head/witchwig = 1,/obj/item/weapon/staff/broom = 1,
					/obj/item/clothing/suit/wizrobe/fake = 1,/obj/item/clothing/head/wizard/fake = 1,/obj/item/weapon/staff = 3,/obj/item/clothing/mask/gas/sexyclown = 1,
					/obj/item/clothing/under/female/sexyclown = 1,/obj/item/clothing/mask/gas/sexymime = 1,/obj/item/clothing/under/female/sexymime = 1,/obj/item/clothing/mask/rat/bat = 1,/obj/item/clothing/mask/rat/bee = 1,/obj/item/clothing/mask/rat/bear = 1,/obj/item/clothing/mask/rat/raven = 1,/obj/item/clothing/mask/rat/jackal = 1,/obj/item/clothing/mask/rat/fox = 1,/obj/item/clothing/mask/rat/tribal = 1,/obj/item/clothing/mask/rat = 1,/obj/item/clothing/suit/apron/overalls = 1,
					/obj/item/clothing/head/rabbitears =1, /obj/item/clothing/head/sombrero = 1, /obj/item/clothing/head/sombrero/green = 1, /obj/item/clothing/suit/poncho = 1,
					/obj/item/clothing/suit/poncho/green = 1, /obj/item/clothing/suit/poncho/red = 1,
					/obj/item/clothing/under/female/maid = 1, /obj/item/clothing/under/female/janimaid = 1,/obj/item/clothing/glasses/cold=1,/obj/item/clothing/glasses/heat=1,
					/obj/item/clothing/suit/whitedress = 1,
					/obj/item/clothing/under/jester = 1, /obj/item/clothing/head/jester = 1,
					/obj/item/clothing/under/f13/vault = 1,
					/obj/item/clothing/shoes/singery = 1,/obj/item/clothing/under/singery = 1,
					/obj/item/clothing/shoes/singerb = 1,/obj/item/clothing/under/singerb = 1,
					/obj/item/clothing/suit/hooded/carp_costume = 1,
					/obj/item/clothing/suit/hooded/ian_costume = 1,
					/obj/item/clothing/suit/hooded/bee_costume = 1,
					/obj/item/clothing/suit/snowman = 1,
					/obj/item/clothing/head/snowman = 1,
					/obj/item/clothing/mask/joy = 1,
					/obj/item/clothing/head/cueball = 1,
					/obj/item/clothing/under/scratch = 1)
	contraband = list(/obj/item/clothing/suit/judgerobe = 1,/obj/item/clothing/head/powdered_wig = 1,/obj/item/weapon/gun/magic/wand = 2,/obj/item/clothing/glasses/sunglasses/garb = 2)
	premium = list(/obj/item/clothing/suit/pirate/captain = 2, /obj/item/clothing/head/pirate/captain = 2, /obj/item/clothing/head/helmet/roman = 1, /obj/item/clothing/head/helmet/roman/legionaire = 1, /obj/item/clothing/under/roman = 1, /obj/item/clothing/shoes/roman = 1, /obj/item/weapon/shield/riot/roman = 1, /obj/item/weapon/skub = 1)
	refill_canister = /obj/item/weapon/vending_refill/autodrobe

/obj/machinery/vending/dinnerware
	name = "\improper Plasteel Chef's Dinnerware Vendor"
	desc = "A kitchen and restaurant equipment vendor"
	product_ads = "Mm, food stuffs!;Food and food accessories.;Get your plates!;You like forks?;I like forks.;Woo, utensils.;You don't really need these..."
	icon_state = "dinnerware"
	products = list(/obj/item/weapon/storage/bag/tray = 8,/obj/item/weapon/kitchen/fork = 6,/obj/item/weapon/kitchen/knife = 6,/obj/item/weapon/kitchen/rollingpin = 2,/obj/item/weapon/reagent_containers/food/drinks/drinkingglass = 8,/obj/item/clothing/suit/apron/chef = 2,/obj/item/weapon/reagent_containers/food/condiment/pack/ketchup = 5,/obj/item/weapon/reagent_containers/food/condiment/pack/hotsauce = 5,/obj/item/weapon/reagent_containers/food/condiment/saltshaker = 5,/obj/item/weapon/reagent_containers/food/condiment/peppermill = 5,/obj/item/weapon/reagent_containers/glass/bowl = 20)
	contraband = list(/obj/item/weapon/kitchen/rollingpin = 2, /obj/item/weapon/kitchen/knife/butcher = 2)
	armor = list(melee = 100, bullet = 100, laser = 100, energy = 100, bomb = 0, bio = 0, rad = 0, fire = 100, acid = 50)
	resistance_flags = FIRE_PROOF

/obj/machinery/vending/sovietsoda
	name = "\improper BODA"
	desc = "Old sweet water vending machine"
	icon_state = "sovietsoda"
	product_ads = "For Tsar and Country.;Have you fulfilled your nutrition quota today?;Very nice!;We are simple people, for this is all we eat.;If there is a person, there is a problem. If there is no person, then there is no problem."
	products = list(/obj/item/weapon/reagent_containers/food/drinks/drinkingglass/filled/soda = 30)
	contraband = list(/obj/item/weapon/reagent_containers/food/drinks/drinkingglass/filled/cola = 20)
	armor = list(melee = 100, bullet = 100, laser = 100, energy = 100, bomb = 0, bio = 0, rad = 0, fire = 100, acid = 50)
	resistance_flags = FIRE_PROOF

/obj/machinery/vending/tool
	name = "\improper YouTool"
	desc = "Tools for tools."
	icon_state = "tool"
	icon_deny = "tool-deny"
	//req_access_txt = "12" //Maintenance access
	products = list(/obj/item/stack/cable_coil/random = 10,/obj/item/weapon/crowbar = 5,/obj/item/weapon/weldingtool = 3,/obj/item/weapon/wirecutters = 5,
					/obj/item/weapon/wrench = 5,/obj/item/device/analyzer = 5,/obj/item/device/t_scanner = 5,/obj/item/weapon/screwdriver = 5)
	contraband = list(/obj/item/weapon/weldingtool/hugetank = 2,/obj/item/clothing/gloves/color/fyellow = 2)
	premium = list(/obj/item/clothing/gloves/color/yellow = 1)
	armor = list(melee = 100, bullet = 100, laser = 100, energy = 100, bomb = 0, bio = 0, rad = 0, fire = 100, acid = 70)
	resistance_flags = FIRE_PROOF

/obj/machinery/vending/engivend
	name = "\improper Engi-Vend"
	desc = "Spare tool vending. What? Did you expect some witty description?"
	icon_state = "engivend"
	icon_deny = "engivend-deny"
	req_access_txt = "11" //Engineering Equipment access
	products = list(/obj/item/clothing/glasses/meson/engine = 2,/obj/item/device/multitool = 4,/obj/item/weapon/electronics/airlock = 10,/obj/item/weapon/electronics/apc = 10,/obj/item/weapon/electronics/airalarm = 10,/obj/item/weapon/stock_parts/cell/high = 10, /obj/item/weapon/rcd/loaded = 3, /obj/item/device/geiger_counter = 5)
	contraband = list(/obj/item/weapon/stock_parts/cell/potato = 3)
	premium = list(/obj/item/weapon/storage/belt/utility = 3)
	armor = list(melee = 100, bullet = 100, laser = 100, energy = 100, bomb = 0, bio = 0, rad = 0, fire = 100, acid = 50)
	resistance_flags = FIRE_PROOF

//This one's from bay12
/obj/machinery/vending/engineering
	name = "\improper Robco Tool Maker"
	desc = "Everything you need for do-it-yourself station repair."
	icon_state = "engi"
	icon_deny = "engi-deny"
	req_access_txt = "11"
	products = list(/obj/item/clothing/under/rank/chief_engineer = 4,/obj/item/clothing/under/rank/engineer = 4,/obj/item/clothing/shoes/sneakers/orange = 4,/obj/item/clothing/head/hardhat = 4,
					/obj/item/weapon/storage/belt/utility = 4,/obj/item/clothing/glasses/meson/engine = 4,/obj/item/clothing/gloves/color/yellow = 4, /obj/item/weapon/screwdriver = 12,
					/obj/item/weapon/crowbar = 12,/obj/item/weapon/wirecutters = 12,/obj/item/device/multitool = 12,/obj/item/weapon/wrench = 12,/obj/item/device/t_scanner = 12,
					/obj/item/weapon/stock_parts/cell = 8, /obj/item/weapon/weldingtool = 8,/obj/item/clothing/head/welding = 8,
					/obj/item/weapon/light/tube = 10,/obj/item/clothing/suit/fire = 4, /obj/item/weapon/stock_parts/scanning_module = 5,/obj/item/weapon/stock_parts/micro_laser = 5,
					/obj/item/weapon/stock_parts/matter_bin = 5,/obj/item/weapon/stock_parts/manipulator = 5,/obj/item/weapon/stock_parts/console_screen = 5)
	armor = list(melee = 100, bullet = 100, laser = 100, energy = 100, bomb = 0, bio = 0, rad = 0, fire = 100, acid = 50)
	resistance_flags = FIRE_PROOF

//This one's from bay12
/obj/machinery/vending/robotics
	name = "\improper Robotech Deluxe"
	desc = "All the tools you need to create your own robot army."
	icon_state = "robotics"
	icon_deny = "robotics-deny"
	req_access_txt = "29"
	products = list(/obj/item/clothing/suit/toggle/labcoat = 4,/obj/item/clothing/under/rank/roboticist = 4,/obj/item/stack/cable_coil = 4,/obj/item/device/assembly/flash/handheld = 4,
					/obj/item/weapon/stock_parts/cell/high = 12, /obj/item/device/assembly/prox_sensor = 3,/obj/item/device/assembly/signaler = 3,/obj/item/device/healthanalyzer = 3,
					/obj/item/weapon/scalpel = 2,/obj/item/weapon/circular_saw = 2,/obj/item/weapon/tank/internals/anesthetic = 2,/obj/item/clothing/mask/breath/medical = 5,
					/obj/item/weapon/screwdriver = 5,/obj/item/weapon/crowbar = 5)
	armor = list(melee = 100, bullet = 100, laser = 100, energy = 100, bomb = 0, bio = 0, rad = 0, fire = 100, acid = 50)
	resistance_flags = FIRE_PROOF

//DON'T FORGET TO CHANGE THE REFILL SIZE IF YOU CHANGE THE MACHINE'S CONTENTS!
/obj/machinery/vending/clothing
	name = "ClothesMate" //renamed to make the slogan rhyme
	desc = "A vending machine for clothing."
	icon_state = "clothes"
	product_slogans = "Dress for success!;Prepare to look swagalicious!;Look at all this free swag!;Why leave style up to fate? Use the ClothesMate!"
	vend_reply = "Thank you for using the ClothesMate!"
	products = list(/obj/item/clothing/head/that=2,/obj/item/clothing/head/fedora=1,/obj/item/clothing/glasses/monocle=1,
	/obj/item/clothing/suit/jacket=2, /obj/item/clothing/suit/jacket/puffer/vest=2, /obj/item/clothing/suit/jacket/puffer=2,
	/obj/item/clothing/under/suit_jacket/navy=1,/obj/item/clothing/under/suit_jacket/really_black=1,/obj/item/clothing/under/suit_jacket/burgundy=1,
	/obj/item/clothing/under/suit_jacket/charcoal=1, /obj/item/clothing/under/suit_jacket/white=1,/obj/item/clothing/under/kilt=1,/obj/item/clothing/under/overalls=1,
	/obj/item/clothing/under/sl_suit=1,/obj/item/clothing/under/pants/jeans=3,/obj/item/clothing/under/pants/classicjeans=2,
	/obj/item/clothing/under/pants/camo = 1,/obj/item/clothing/under/pants/blackjeans=2,/obj/item/clothing/under/pants/khaki=2,
	/obj/item/clothing/under/pants/white=2,/obj/item/clothing/under/pants/red=1,/obj/item/clothing/under/pants/black=2,
	/obj/item/clothing/under/pants/tan=2,/obj/item/clothing/under/pants/track=1,/obj/item/clothing/suit/jacket/miljacket = 1,
	/obj/item/clothing/neck/tie/blue=1, /obj/item/clothing/neck/tie/red=1, /obj/item/clothing/neck/tie/black=1, /obj/item/clothing/neck/tie/horrible=1,
	/obj/item/clothing/neck/scarf/red=1,/obj/item/clothing/neck/scarf/green=1,/obj/item/clothing/neck/scarf/darkblue=1,
	/obj/item/clothing/neck/scarf/purple=1,/obj/item/clothing/neck/scarf/yellow=1,/obj/item/clothing/neck/scarf/orange=1,
	/obj/item/clothing/neck/scarf/cyan=1,/obj/item/clothing/neck/scarf=1,/obj/item/clothing/neck/scarf/black=1,
	/obj/item/clothing/neck/scarf/zebra=1,/obj/item/clothing/neck/scarf/christmas=1,/obj/item/clothing/neck/stripedredscarf=1,
	/obj/item/clothing/neck/stripedbluescarf=1,/obj/item/clothing/neck/stripedgreenscarf=1,/obj/item/clothing/tie/waistcoat=1,
	/obj/item/clothing/glasses/regular=2,/obj/item/clothing/head/sombrero=1,/obj/item/clothing/suit/poncho=1,
	/obj/item/clothing/suit/ianshirt=1,/obj/item/clothing/shoes/laceup=2,/obj/item/clothing/shoes/sneakers/black=4,
	/obj/item/clothing/shoes/sandal=1, /obj/item/clothing/gloves/fingerless=2,/obj/item/clothing/glasses/orange=1,/obj/item/clothing/glasses/red=1,
	/obj/item/weapon/storage/belt/fannypack=1, /obj/item/weapon/storage/belt/fannypack/blue=1, /obj/item/weapon/storage/belt/fannypack/red=1, /obj/item/clothing/suit/jacket/letterman=2,
	/obj/item/clothing/head/beanie=1, /obj/item/clothing/head/beanie/black=1, /obj/item/clothing/head/beanie/red=1, /obj/item/clothing/head/beanie/green=1, /obj/item/clothing/head/beanie/darkblue=1,
	/obj/item/clothing/head/beanie/purple=1, /obj/item/clothing/head/beanie/yellow=1, /obj/item/clothing/head/beanie/orange=1, /obj/item/clothing/head/beanie/cyan=1, /obj/item/clothing/head/beanie/christmas=1,
	/obj/item/clothing/head/beanie/striped=1, /obj/item/clothing/head/beanie/stripedred=1, /obj/item/clothing/head/beanie/stripedblue=1, /obj/item/clothing/head/beanie/stripedgreen=1,
	/obj/item/clothing/suit/jacket/letterman_red=1)
	contraband = list(/obj/item/clothing/under/syndicate/tacticool=1,/obj/item/clothing/mask/balaclava=1,/obj/item/clothing/head/ushanka=1,/obj/item/clothing/under/soviet=1,/obj/item/weapon/storage/belt/fannypack/black=2,/obj/item/clothing/suit/jacket/letterman_syndie=1,/obj/item/clothing/under/jabroni=1, /obj/item/clothing/suit/vapeshirt=1, /obj/item/clothing/under/geisha=1)
	premium = list(/obj/item/clothing/under/suit_jacket/checkered=1,/obj/item/clothing/head/mailman=1,/obj/item/clothing/under/rank/mailman=1,/obj/item/clothing/suit/jacket/leather=1,/obj/item/clothing/suit/jacket/leather/overcoat=1,/obj/item/clothing/under/pants/mustangjeans=1,/obj/item/clothing/neck/necklace/dope=3,/obj/item/clothing/suit/jacket/letterman_nanotrasen=1)
	refill_canister = /obj/item/weapon/vending_refill/clothing

#undef STANDARD_CHARGE
#undef CONTRABAND_CHARGE
#undef COIN_CHARGE

/obj/machinery/vending/cigarette
	name = "Cigarette machine" //OCD had to be uppercase to look nice with the new formating
	desc = "A specialized vending machine designed to contribute to your slow and uncomfortable death."
	product_slogans = "There's no better time to start smokin'.;\
		Smoke now, and win the adoration of your peers.;\
		They beat cancer centuries ago, so smoke away.;\
		If you're not smoking, you must be joking."
	product_ads = "Probably not bad for you!;\
		Don't believe the scientists!;\
		It's good for you!;\
		Don't quit, buy more!;\
		Smoke!;\
		Nicotine heaven.;\
		Best cigarettes since 2150.;\
		Award-winning cigarettes, all the best brands.;\
		Feeling temperamental? Try a Temperamento!;\
		Carcinoma Angels - go fuck yerself!;\
		Don't be so hard on yourself, kid. Smoke a Lucky Star!;\
		We understand the depressed, alcoholic cowboy in you. That's why we also smoke Jericho.;\
		Professionals. Better cigarettes for better people. Yes, better people."
	vend_delay = 21
	icon_state = "cigs"
	icon_vend = "cigs-vend"
	products = list(/obj/item/weapon/storage/fancy/cigarettes = 5,
					/obj/item/weapon/storage/fancy/cigarettes/luckystars = 2,
					/obj/item/weapon/storage/fancy/cigarettes/jerichos = 2,
					/obj/item/weapon/storage/fancy/cigarettes/menthols = 2,
					/obj/item/weapon/storage/fancy/cigarettes/carcinomas = 2,
					/obj/item/weapon/storage/fancy/cigarettes/professionals = 2,
					/obj/item/weapon/storage/fancy/cigarettes/cigarello = 2,
					/obj/item/weapon/storage/fancy/cigarettes/cigarello/mint = 2,
					/obj/item/weapon/storage/fancy/cigarettes/cigarello/variety = 2,
					/obj/item/weapon/storage/box/matches = 10,
					/obj/item/weapon/flame/lighter/random = 4,
					/obj/item/clothing/mask/smokable/ecig/simple = 10,
					/obj/item/clothing/mask/smokable/ecig/util = 5,
					/obj/item/clothing/mask/smokable/ecig/deluxe = 1,
					/obj/item/weapon/reagent_containers/ecig_cartridge/med_nicotine = 10,
					/obj/item/weapon/reagent_containers/ecig_cartridge/high_nicotine = 5,
					/obj/item/weapon/reagent_containers/ecig_cartridge/orange = 5,
					/obj/item/weapon/reagent_containers/ecig_cartridge/mint = 5,
					/obj/item/weapon/reagent_containers/ecig_cartridge/watermelon = 5,
					/obj/item/weapon/reagent_containers/ecig_cartridge/grape = 5,
					/obj/item/weapon/reagent_containers/ecig_cartridge/lemonlime = 5,
					/obj/item/weapon/reagent_containers/ecig_cartridge/coffee = 5,
					/obj/item/weapon/reagent_containers/ecig_cartridge/blanknico = 2)
	contraband = list(/obj/item/weapon/flame/lighter/zippo = 4)
	premium = list(/obj/item/weapon/storage/fancy/cigar = 5,/obj/item/weapon/storage/fancy/cigarettes/killthroat = 5)

	prices = list(/obj/item/weapon/storage/fancy/cigarettes = 45,
					/obj/item/weapon/storage/fancy/cigarettes/luckystars = 50,
					/obj/item/weapon/storage/fancy/cigarettes/jerichos = 65,
					/obj/item/weapon/storage/fancy/cigarettes/menthols = 55,
					/obj/item/weapon/storage/fancy/cigarettes/carcinomas = 65,
					/obj/item/weapon/storage/fancy/cigarettes/professionals = 70,
					/obj/item/weapon/storage/fancy/cigarettes/cigarello = 85,
					/obj/item/weapon/storage/fancy/cigarettes/cigarello/mint = 85,
					/obj/item/weapon/storage/fancy/cigarettes/cigarello/variety = 85,
					/obj/item/weapon/storage/box/matches = 2,
					/obj/item/weapon/flame/lighter/random = 5,
					/obj/item/clothing/mask/smokable/ecig/simple = 50,
					/obj/item/clothing/mask/smokable/ecig/util = 100,
					/obj/item/clothing/mask/smokable/ecig/deluxe = 250,
					/obj/item/weapon/reagent_containers/ecig_cartridge/med_nicotine = 15,
					/obj/item/weapon/reagent_containers/ecig_cartridge/high_nicotine = 15,
					/obj/item/weapon/reagent_containers/ecig_cartridge/orange = 15,
					/obj/item/weapon/reagent_containers/ecig_cartridge/mint = 15,
					/obj/item/weapon/reagent_containers/ecig_cartridge/watermelon = 15,
					/obj/item/weapon/reagent_containers/ecig_cartridge/grape = 15,
					/obj/item/weapon/reagent_containers/ecig_cartridge/lemonlime = 15,
					/obj/item/weapon/reagent_containers/ecig_cartridge/coffee = 15,
					/obj/item/weapon/reagent_containers/ecig_cartridge/blanknico = 15)