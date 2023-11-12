function randomtableo(myTable)
-- iterate over whole table to get all keys
local keyset = {}
for k in pairs(myTable) do
    table.insert(keyset, k)
end
-- now you can reliably return a random key
return myTable[keyset[math.random(#keyset)]]
end
local gusun = {}
return{
Load = function(relativepos)
gusun.stand=love.graphics.newImage(relativepos.."stand.png")
end,
Create = function(animationstore)
animationstore.Blink = math.random(180,280)
end,
Update = function(typeofblock,breaking,animationstore,posx,posy,playerdata)
end,
Draw = function(x,y,color,size,typeofblock,breaking,animationstore,posx,posy,playerdata)
	love.graphics.draw(gusun.stand,-16+x,-32+y,0,size,size)
end,
}