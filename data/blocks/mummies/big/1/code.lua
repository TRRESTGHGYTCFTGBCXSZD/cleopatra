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
local Quad
return{
Load = function(relativepos)
Bambisona={
love.graphics.newImage(relativepos.."/gerio.png")
}
Quad=love.graphics.newQuad( 0, 0, 32, 32, 96, 64 )
end,
Create = function(animationstore)
animationstore.Blink = math.random(180,280)
animationstore.Bambisona = randomtableo(Bambisona)
end,
Update = function(typeofblock,breaking,animationstore,posx,posy,playerdata)
end,
Draw = function(x,y,color,size,typeofblock,breaking,animationstore,posx,posy,playerdata)
	if typeofblock == "T0T" then
	return
	elseif typeofblock == "T90T" then
	return
	elseif typeofblock == "T180T" then
	return
	elseif typeofblock == "T270T" then
	return
	end
	local rotation
	if typeofblock == "T0H" then
	rotation=0
	elseif typeofblock == "T90H" then
	rotation=90
	elseif typeofblock == "T180H" then
	rotation=180
	elseif typeofblock == "T270H" then
	rotation=270
	end
	Quad:setViewport(0,0,32,64)
	love.graphics.draw(animationstore.Bambisona or Bambisona[1],Quad,x+16,y+16,math.rad(rotation),size,size,16,16)
	Quad:setViewport(32,0,32,32)
	love.graphics.draw(animationstore.Bambisona or Bambisona[1],Quad,x+16,y+16,math.rad(rotation),size,size,16,16)
end,
}