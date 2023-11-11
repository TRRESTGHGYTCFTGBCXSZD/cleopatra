function randomtableo(myTable)
-- iterate over whole table to get all keys
local keyset = {}
for k in pairs(myTable) do
    table.insert(keyset, k)
end
-- now you can reliably return a random key
return myTable[keyset[math.random(#keyset)]]
end
local Bambisona
return{
Load = function(relativepos)
Bambisona={
love.graphics.newImage(relativepos.."gerio.png")
}
end,
Create = function(animationstore)
animationstore.Blink = math.random(180,280)
animationstore.Bambisona = randomtableo(Bambisona)
end,
Update = function(head,breaking,animationstore,posx,posy,playerdata)
end,
Draw = function(x,y,color,size,head,breaking,animationstore,posx,posy,playerdata)
end,
}