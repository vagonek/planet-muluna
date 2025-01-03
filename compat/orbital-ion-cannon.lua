local rro = require("lib.remove-replace-object")
if data.raw["technology"]["orbital-ion-cannon"] then
    rro.replace(data.raw["technology"]["orbital-ion-cannon"].prerequisites,"rocket-silo","space-science-pack")
end
