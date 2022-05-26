/datum/job/bartender
	title = "Bartender"
	flag = BARTENDER
	department_head = list("Executive Officer")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Executive Officer"
	selection_color = "#bbe291"
	chat_color = "#B2CEB3"
	exp_type_department = EXP_TYPE_SERVICE // This is so the jobs menu can work properly

	outfit = /datum/outfit/job/bartender

	access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	minimal_access = list(ACCESS_BAR, ACCESS_MINERAL_STOREROOM)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_BARTENDER
	departments = DEPARTMENT_SERVICE

	species_outfits = list(
		SPECIES_PLASMAMAN = /datum/outfit/plasmaman/bar
	)
/datum/outfit/job/bartender
	name = "Bartender"
	jobtype = /datum/job/bartender

	glasses = /obj/item/clothing/glasses/sunglasses/advanced/reagent
	belt = /obj/item/pda/bar
	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/civilian/bartender
	suit = /obj/item/clothing/suit/armor/vest
	backpack_contents = list(/obj/item/storage/box/beanbag=1)
	shoes = /obj/item/clothing/shoes/laceup
