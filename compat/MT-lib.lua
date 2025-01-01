local tau = 2*math.pi
data.raw["planet"]["nauvis"].orbit=nil
data.raw["planet"]["vulcanus"].orbit=nil
data.raw["planet"]["gleba"].orbit=nil
data.raw["planet"]["fulgora"].orbit=nil

local muluna = data.raw["planet"]["muluna"]
muluna.orbit = {
	polar = {2,0.005*tau},
	parent={
		type="planet",
		name="nauvis"
	},
	sprite={
		type="sprite",
		filename="__planet-muluna__/graphics/orbits/orbit-muluna.png",
		size=512
	}
}