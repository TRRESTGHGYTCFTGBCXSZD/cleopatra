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
	if not (typeofblock == "T0H" or typeofblock == "T90H" or typeofblock == "T180H" or typeofblock == "T270H") then
	return
	end
	animationstore.Blink = animationstore.Blink - 1
	if animationstore.Blink <= 0 then
		animationstore.Blink = math.random(180,280)
	end
end,
Draw = function(x,y,color,size,typeofblock,breaking,animationstore,posx,posy,playerdata)
	local rotation
	if typeofblock == "T0H" then
	rotation=0
	elseif typeofblock == "T90H" then
	rotation=90
	elseif typeofblock == "T180H" then
	rotation=180
	elseif typeofblock == "T270H" then
	rotation=270
	else
	return
	end
	Quad:setViewport(0,0,32,64)
	love.graphics.draw(animationstore.Bambisona,Quad,x+16,y+16,math.rad(rotation),size,size,16,16)
	if animationstore.Blink <= 4 then
	Quad:setViewport(64,32,32,32)
	elseif animationstore.Blink <= 8 then
	Quad:setViewport(64,0,32,32)
	elseif animationstore.Blink <= 12 then
	Quad:setViewport(32,32,32,32)
	else
	Quad:setViewport(32,0,32,32)
	end
	love.graphics.draw(animationstore.Bambisona,Quad,x+16,y+16,math.rad(rotation),size,size,16,16)
end,
}