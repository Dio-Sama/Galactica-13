var/obj/structure/overmap/instancedstation = null

var/list/maps = list(
	list(path = "templates/boarding")

var/station_file = file("orbitalhabitat.dmm")

syndiship = instance_ship_from_json(station_file)
