local utils = require("utils")
local drawableSprite = require("structs.drawable_sprite")
local spinorb = {}

spinorb.name = "canyon/spinorb"
spinorb.depth = -9999
spinorb.justification = {0.5, 0.5}
spinorb.placements = 
{
    name = "SpinOrb",
    data = {
        rotateCounterclockwise = false,
        initialAngle = 270,
        spritePath = "objects/canyon/spinorb/"
    }
}

function spinorb.sprite(room, entity)
    basePath = entity.spritePath or "objects/canyon/spinorb"
    if not basePath:match(".*/$") then
        basePath = basePath .. "/"
    end

    local texture = basePath .. "idle00"
    local sprite = drawableSprite.fromTexture(texture, entity)

    sprite:setJustification(0.5, 0.5)

    local angleDegrees = entity.initialAngle or 270
    sprite.rotation = math.rad(angleDegrees + 90)

    return sprite
end

function spinorb.rectangle(room, entity)
    local x, y = entity.x or 0, entity.y or 0
    return utils.rectangle(x - 9, y - 21, 17, 30)
end

return spinorb