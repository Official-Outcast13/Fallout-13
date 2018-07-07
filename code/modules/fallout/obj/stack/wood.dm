/obj/item/stack/sheet/mineral/wood/var/barricade_busy = FALSE

/obj/item/stack/sheet/mineral/wood/afterattack(atom/A, mob/user,proximity)
	if(!proximity || barricade_busy) return
	if(istype(A, /obj/structure/barricade/wooden/planks))
		var/obj/structure/barricade/wooden/planks/F = A
		var/obj/structure/barricade/wooden/planks/MYPLANKS = null
		for(var/atom/S in F.loc)
			if(istype(S, /obj/structure/barricade/wooden/planks))
				MYPLANKS = S
				if(MYPLANKS.planks == MYPLANKS.maxplanks)
					to_chat(user, "There are too many boards on [MYPLANKS] already!")
					return
				break
		if(MYPLANKS)
			user.visible_message("<i>[user] begins to reinforce [MYPLANKS]...</i>")
			barricade_busy = TRUE
			if(do_after(user, 20, target = MYPLANKS))
				barricade_busy = FALSE
				user.visible_message("<i>[user] reinforced [MYPLANKS] with an additional board.</i>")
				src.use(1)
				MYPLANKS.planks++
				MYPLANKS.checkplanks()
				return
		else
			user.visible_message("<i>[user] begins to board up [F]...</i>")
			barricade_busy = TRUE
			if(do_after(user, 20, target = MYPLANKS))
				barricade_busy = FALSE
				user.visible_message("<i>[user] reinforced [F] with a board.</i>")
				src.use(1)
				var/obj/structure/barricade/wooden/planks/K = new /obj/structure/barricade/wooden/planks(F.loc)
				K.planks = 1
				K.checkplanks()
				return

	if(istype(A, /obj/structure/window/fulltile))
		var/obj/structure/window/fulltile/F = A
		var/obj/structure/barricade/wooden/planks/MYPLANKS = null
		for(var/atom/S in F.loc)
			if(istype(S, /obj/structure/barricade/wooden/planks))
				MYPLANKS = S
				if(MYPLANKS.planks == MYPLANKS.maxplanks)
					to_chat(user, "There are too many boards on [MYPLANKS] already!")
					return
				break
		if(MYPLANKS)
			user.visible_message("<i>[user] begins to reinforce [MYPLANKS]...</i>")
			barricade_busy = TRUE
			if(do_after(user, 20, target = MYPLANKS))
				barricade_busy = FALSE
				user.visible_message("<i>[user] reinforced [MYPLANKS] with an additional board.</i>")
				src.use(1)
				MYPLANKS.planks++
				MYPLANKS.checkplanks()
				return
		else
			user.visible_message("<i>[user] begins to board up [F]...</i>")
			barricade_busy = TRUE
			if(do_after(user, 20, target = MYPLANKS))
				barricade_busy = FALSE
				user.visible_message("<i>[user] reinforced [F] with a board.</i>")
				src.use(1)
				var/obj/structure/barricade/wooden/planks/K = new /obj/structure/barricade/wooden/planks(F.loc)
				K.planks = 1
				K.checkplanks()
				return
	if(istype(A, /obj/structure/simple_door))
		var/obj/structure/simple_door/F = A
		var/obj/structure/barricade/wooden/planks/MYPLANKS = null
		for(var/atom/S in F.loc)
			if(istype(S, /obj/structure/barricade/wooden/planks))
				MYPLANKS = S
				if(MYPLANKS.planks == MYPLANKS.maxplanks)
					to_chat(user, "There are too many boards on [MYPLANKS] already!")
					return
				break
		if(MYPLANKS)
			user.visible_message("<i>[user] begins to reinforce [MYPLANKS]...</i>")
			barricade_busy = TRUE
			if(do_after(user, 20, target = MYPLANKS))
				barricade_busy = FALSE
				user.visible_message("<i>[user] reinforced [MYPLANKS] with an additional board.</i>")
				src.use(1)
				MYPLANKS.planks++
				MYPLANKS.checkplanks()
				return
		else
			user.visible_message("<i>[user] begins to board up [F]...</i>")
			barricade_busy = TRUE
			if(do_after(user, 20, target = MYPLANKS))
				barricade_busy = FALSE
				user.visible_message("<i>[user] reinforced [F] with a board.</i>")
				src.use(1)
				var/obj/structure/barricade/wooden/planks/K = new /obj/structure/barricade/wooden/planks(F.loc)
				K.planks = 1
				K.checkplanks()
				return
	..()