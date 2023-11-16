local Block
local HasOverlay
local Overlay
local Quad
return{
Load = function(block)
Block=love.graphics.newImage(block..".png")
HasOverlay,Overlay=pcall(function()return love.graphics.newImage(block.."_overlay.png")end)
Quad=love.graphics.newQuad( 0, 0, 32, 32, 128, 64 )
end,
Create = function(animationstore)
end,
Update = function(typeofblock,breaking,animationstore,posx,posy,playerdata)
end,
Draw = function(x,y,color,size,typeofblock,breaking,animationstore,posx,posy,playerdata)
	if breaking then return end
	local yoncolora,yoncolorb,yoncolorc,yoncolord = love.graphics.getColor()
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
	love.graphics.setColor(yoncolora,yoncolorb,yoncolorc,yoncolord)
end,
}