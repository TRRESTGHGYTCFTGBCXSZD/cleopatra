local Block
local HasOverlay
local Overlay
return{
Load = function(block)
Block=love.graphics.newImage(block..".png")
HasOverlay,Overlay=pcall(function()return love.graphics.newImage(block..".png")end)
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