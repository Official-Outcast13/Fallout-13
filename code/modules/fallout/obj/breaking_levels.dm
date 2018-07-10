#define SOFT_BREAK 10
#define BADWOOD_BREAK 30
#define WOOD_BREAK 50
#define CONCRETE_BREAK 80
#define METAL_BREAK 100
#define REINFORCED_BREAK 130
#define VAULT_BREAK 300

// Adding breaking levels, items that deal damage can break walls not because of their damage alone, but with their ability to break certain walls too
// All items that deal damage should be able to break soft walls, soft walls as in paper walls, snow walls, etc... If they deal enough damage, of course.
/turf/closed/wall/var/break_resist = METAL_BREAK
/obj/var/break_attack = 0

// Failsafe of "calculated breaking level", just in case
// By doing tests here I've noticed that this /New() thing is what causes objects to take a lot of time to load
/obj/item/New()
	..()
	// Blunt things can break metal walls from 40 damage. Sharp things will break metal walls from 80 damage
	// This is just default calculations, there will always be exceptions to this rule.
	if(!break_attack || break_attack == 0)
		break_attack = (sharpness == IS_BLUNT) ? force*2.5 : force*1.3

/obj/item/weapon/New()
	..()
	if(!break_attack || break_attack == 0)
		break_attack = (sharpness == IS_BLUNT) ? force*2.5 : force*1.3
	if(!break_attack || break_attack == 0)
		break_attack = (sharpness == IS_BLUNT) ? force_unwielded*2.5 : force_unwielded*1.3
	if(!break_attack || break_attack == 0)
		break_attack = (sharpness == IS_BLUNT) ? force_wielded*2.5 : force_wielded*1.3


// Breaking levels for walls
/turf/closed/wall/clockwork/break_resist = METAL_BREAK
/turf/closed/wall/f13/ruins/break_resist = CONCRETE_BREAK
/turf/closed/wall/f13/store/break_resist = CONCRETE_BREAK
/turf/closed/wall/f13/supermart/break_resist = CONCRETE_BREAK
/turf/closed/wall/f13/tunnel/break_resist = METAL_BREAK
/turf/closed/wall/f13/wood/break_resist = WOOD_BREAK
/turf/closed/wall/f13/wood/house/break_resist = WOOD_BREAK
/turf/closed/wall/f13/wood/interior/break_resist = SOFT_BREAK

/turf/closed/wall/ice/break_resist = SOFT_BREAK
/turf/closed/wall/mineral/break_resist = METAL_BREAK
/turf/closed/wall/mineral/wood/break_resist = WOOD_BREAK

/turf/closed/wall/r_wall/break_resist = REINFORCED_BREAK
/turf/closed/wall/r_wall/rust/break_resist = METAL_BREAK
/turf/closed/wall/r_wall/f13/vault/break_resist = VAULT_BREAK
/turf/closed/wall/rust/break_resist = METAL_BREAK

// Breaking levels for weapons
/obj/item/weapon/katana/break_attack = SOFT_BREAK
/obj/item/weapon/chinese/break_attack = SOFT_BREAK
/obj/item/weapon/melee/bullwhip/break_attack = SOFT_BREAK
/obj/item/weapon/melee/curator_whip/break_attack = SOFT_BREAK

/obj/item/weapon/alucardsword/break_attack = WOOD_BREAK
/obj/item/weapon/alucardsword/break_attack = WOOD_BREAK
/obj/item/weapon/lumberaxe/break_attack = WOOD_BREAK
/obj/item/weapon/claymore/break_attack = WOOD_BREAK
/obj/item/weapon/twohanded/fireaxe/break_attack = WOOD_BREAK
/obj/item/weapon/twohanded/sledgehammer/break_attack = CONCRETE_BREAK
/obj/item/weapon/twohanded/largehammer/break_attack = CONCRETE_BREAK
/obj/item/weapon/twohanded/superhammer/break_attack = METAL_BREAK
/obj/item/weapon/twohanded/required/mining_hammer/break_attack = METAL_BREAK
/obj/item/weapon/twohanded/singularityhammer/break_attack = METAL_BREAK
/obj/item/weapon/banhammer/break_attack = VAULT_BREAK

// Projectile defaults
/obj/item/projectile/bullet/dart/break_attack = SOFT_BREAK
/obj/item/projectile/bullet/sniper/break_attack = SOFT_BREAK
/obj/item/projectile/bullet/break_attack = WOOD_BREAK
/obj/item/projectile/kinetic/break_attack = WOOD_BREAK
/obj/item/projectile/temp/break_attack = METAL_BREAK
/obj/item/projectile/beam/break_attack = METAL_BREAK
/obj/item/projectile/energy/break_attack = METAL_BREAK
/obj/item/projectile/plasma/break_attack = METAL_BREAK

// Bullet specifics
/obj/item/projectile/bullet/a40mm/break_attack = REINFORCED_BREAK
/obj/item/projectile/bullet/a84mm/break_attack = REINFORCED_BREAK

// Armor piercing and snipers should have a special ability to pass through anything that is WOOD_BREAK or below, but they actually are SOFT_BREAK
// Yes, they do actually have "forcedodge" on their respective definitions
/obj/item/projectile/bullet/sniper/penetrator/break_attack = SOFT_BREAK
/obj/item/projectile/bullet/armourpiercing/break_attack = SOFT_BREAK