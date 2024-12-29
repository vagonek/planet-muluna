local tau = 2*math.pi
local muluna = data.raw["planet"]["muluna"]
muluna.orbit = {
	polar = {2,0.005*tau},
	parent={
		type="planet",
		name="nauvis"
	},
	sprite={
		type="sprite",
		filename="__planet-muluna__/graphics/orbits/orbit_muluna.png",
		size=128
	}
}