local Block
local HasOverlay
local Overlay
return{
Load = function(block)
Block=love.graphics.newImage(block..".png")
HasOverlay,Overlay=pcall(function()return love.graphics.newImage(block.."_overlay.png")end)
end,
Create = function(animationstore)
end,
Update = function(typeofblock,breaking,animationstore,posx,posy,playerdata)
end,
Draw = function(x,y,color,size,typeofblock,breaking,animationstore,posx,posy,playerdata)
	if breaking then return end
	local yoncolora,yoncolorb,yoncolorc,yoncolord = love.graphics.getColor()
	love.graphics.setColor(color.r,color.g,color.b,color.a or 1)
	love.graphics.draw(Block,x,y,0,size,size)
	if HasOverlay then
	love.graphics.setColor(1,1,1,color.a or 1)
	love.graphics.draw(Overlay,x,y,0,size,size)
	end
	love.graphics.setColor(yoncolora,yoncolorb,yoncolorc,yoncolord)
end,
}