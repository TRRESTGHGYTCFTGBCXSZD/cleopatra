local Block
local HasOverlay
local Overlay
local Quad
local function lerp(a,b,t) return a * (1-t) + b * t end
return{
Load = function(block)
Block=love.graphics.newImage(block..".png")
Quad=love.graphics.newQuad( 0, 0, 32, 32, 128, 64 )
HasOverlay,Overlay=pcall(function()return love.graphics.newImage(block.."_overlay.png")end)
Breako=love.graphics.newImage("data/blocks/break.png")
Breakov=love.graphics.newImage("data/blocks/break_overlay.png")
Breakq=love.graphics.newQuad( 0, 0, 32, 32, 128, 32 )
end,
Create = function(animationstore)
animationstore.Break = {}
for g = 1,4 do
	animationstore.Break[g] = {}
end
for _,hh in pairs(animationstore.Break) do
hh.XVel = lerp(-3,3,math.random())
hh.YVel = lerp(-5,-9,math.random())
hh.X = 0
hh.Y = 0
end
end,
Update = function(typeofblock,breaking,animationstore,posx,posy,playerdata)
	if breaking then
		for _,hh in pairs(animationstore.Break) do
			hh.X = hh.X + hh.XVel
			hh.Y = hh.Y + hh.YVel
			hh.YVel = hh.YVel + .5
		end
	end
end,
Draw = function(x,y,color,size,typeofblock,breaking,animationstore,posx,posy,playerdata)
	local yoncolora,yoncolorb,yoncolorc,yoncolord = love.graphics.getColor()
	if breaking then
		for g = 1,4 do
		Breakq:setViewport((g-1)*32,0,32,32)
		love.graphics.setColor(color.r,color.g,color.b,color.a or 1)
		love.graphics.draw(Breako,Breakq,x+animationstore.Break[g].X,y+animationstore.Break[g].Y,0,size,size)
		love.graphics.setColor(1,1,1,color.a or 1)
		love.graphics.draw(Breakov,Breakq,x+animationstore.Break[g].X,y+animationstore.Break[g].Y,0,size,size)
		end
	else
	love.graphics.setColor(color.r,color.g,color.b,color.a or 1)
	if typeofblock == "T0H" then
	Quad:setViewport(0,0,32,32)
	elseif typeofblock == "T90H" then
	Quad:setViewport(64,0,32,32)
	elseif typeofblock == "T180H" then
	Quad:setViewport(96,32,32,32)
	elseif typeofblock == "T270H" then
	Quad:setViewport(32,32,32,32)
	elseif typeofblock == "T0T" then
	Quad:setViewport(0,32,32,32)
	elseif typeofblock == "T90T" then
	Quad:setViewport(32,0,32,32)
	elseif typeofblock == "T180T" then
	Quad:setViewport(96,0,32,32)
	elseif typeofblock == "T270T" then
	Quad:setViewport(64,32,32,32)
	end
	love.graphics.draw(Block,Quad,x,y,0,size,size)
	if HasOverlay then
	love.graphics.setColor(1,1,1,color.a or 1)
	love.graphics.draw(Overlay,Quad,x,y,0,size,size)
	end
	end
	love.graphics.setColor(yoncolora,yoncolorb,yoncolorc,yoncolord)
end,
}