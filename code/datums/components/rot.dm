/datum/component/rot
	var/amount = 1

/datum/component/rot/Initialize(new_amount)
	if(!isatom(parent))
		return COMPONENT_INCOMPATIBLE

	if(new_amount)
		amount = new_amount
	//NSV13 - no miasma, no problem
	//START_PROCESSING(SSprocessing, src)

/datum/component/rot/Destroy()
	//STOP_PROCESSING(SSprocessing, src)
	return ..()

/datum/component/rot/process(delta_time)
	var/atom/A = parent

	var/turf/open/T = get_turf(A)
	if(!istype(T) || T.return_air().return_pressure() > (WARNING_HIGH_PRESSURE - 10))
		return

/* NSV13 - Stolen Datum
	var/datum/gas_mixture/stank = new
	stank.set_moles(GAS_MIASMA, amount * delta_time)
	stank.set_temperature(BODYTEMP_NORMAL) // otherwise we have gas below 2.7K which will break our lag generator
	T.assume_air(stank)
	T.air_update_turf()
*/

/datum/component/rot/corpse
	amount = MIASMA_CORPSE_MOLES

/datum/component/rot/corpse/Initialize()
	if(!iscarbon(parent))
		return COMPONENT_INCOMPATIBLE
	. = ..()

/datum/component/rot/corpse/process()
	var/mob/living/carbon/C = parent
	if(C == null) //can't delete what doesnt exist
		return

	if(C.stat != DEAD)
		qdel(src)
		return

	// Wait a bit before decaying
	if(world.time - C.timeofdeath < 2 MINUTES)
		return

	// Properly stored corpses shouldn't create miasma
	if(istype(C.loc, /obj/structure/closet/crate/coffin)|| istype(C.loc, /obj/structure/closet/body_bag) || istype(C.loc, /obj/structure/bodycontainer))
		return

	// No decay if formaldehyde in corpse or when the corpse is charred
	if(C.reagents.has_reagent(/datum/reagent/toxin/formaldehyde, 15) || HAS_TRAIT(C, TRAIT_HUSK))
		return

	// Also no decay if corpse chilled or not organic/undead
	if(C.bodytemperature <= T0C-10 || (!(MOB_ORGANIC in C.mob_biotypes) && !(MOB_UNDEAD in C.mob_biotypes)))
		return

	..()

/datum/component/rot/gibs
	amount = MIASMA_GIBS_MOLES
