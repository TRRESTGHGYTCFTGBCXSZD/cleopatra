function randomtableo(myTable)
-- iterate over whole table to get all keys
local keyset = {}
for k in pairs(myTable) do
    table.insert(keyset, k)
end
-- now you can reliably return a random key
return myTable[keyset[math.random(#keyset)]]
end
local function lerp(a,b,t) return a * (1-t) + b * t end
local function inverselerp(a,b,t) return (t-a)/(b-a) end
local gusun = {}
return{
Load = function(relativepos)
gusun.stand=love.graphics.newImage(relativepos.."stand.png")
gusun.lookup1=love.graphics.newImage(relativepos.."lookup1.png")
gusun.lookup2=love.graphics.newImage(relativepos.."lookup2.png")
gusun.wa1=love.graphics.newImage(relativepos.."fall1.png")
gusun.wa2=love.graphics.newImage(relativepos.."fall2.png")
gusun.wa3=love.graphics.newImage(relativepos.."fall3.png")
gusun.wa4=love.graphics.newImage(relativepos.."fall4.png")
gusun.wa5=love.graphics.newImage(relativepos.."fall5.png")
gusun.wa6=love.graphics.newImage(relativepos.."fall6.png")
gusun.wa7=love.graphics.newImage(relativepos.."fall7.png")
gusun.hu1=love.graphics.newImage(relativepos.."crushdown1.png")
gusun.hu2=love.graphics.newImage(relativepos.."crushdown2.png")
gusun.hu3=love.graphics.newImage(relativepos.."crushdown3.png")
gusun.hu4=love.graphics.newImage(relativepos.."crushdown4.png")
gusun.owa1=love.graphics.newImage(relativepos.."owa1.png")
gusun.owa2=love.graphics.newImage(relativepos.."owa2.png")
end,
Create = function(animationstore)
animationstore.Blink = math.random(180,280)
animationstore.HU = 0
animationstore.WAAAAA = 0
animationstore.Gussun = {}
animationstore.Gussun.XVel = lerp(-3,3,math.random())
animationstore.Gussun.YVel = lerp(-5,-9,math.random())
animationstore.Gussun.ScalVel = lerp(.2,.5,math.random())
animationstore.Gussun.X = 0
animationstore.Gussun.Y = 0
animationstore.Gussun.Scal = 0
animationstore.Orientation = math.random() > 0.5
end,
Update = function(typeofblock,breaking,animationstore,posx,posy,playerdata)
	animationstore.Blink = animationstore.Blink - 1
	animationstore.HU = animationstore.HU - 1
	if breaking then
		animationstore.WAAAAA = animationstore.WAAAAA + 1
	end
	if animationstore.WAAAAA > 30 then
		animationstore.Gussun.X = animationstore.Gussun.X + animationstore.Gussun.XVel
		animationstore.Gussun.Y = animationstore.Gussun.Y + animationstore.Gussun.YVel
		animationstore.Gussun.YVel = animationstore.Gussun.YVel + .5
		animationstore.Gussun.Scal = animationstore.Gussun.Scal + animationstore.Gussun.ScalVel
	end
	if posx and posy then
		if playerdata.board[posy-1][posx] ~= nil and animationstore.HU < 4+4+10+12+6+6+6 then
			animationstore.HU = 6+6+6+6+5+5 + 4+4+10+12+6+6+6
		elseif playerdata.board[posy-1][posx] ~= nil and animationstore.HU == 4+4+10+12+6+6+6 then
			animationstore.HU = 5+5 + 4+4+10+12+6+6+6
		end
	end
	if animationstore.Blink <= 0 then
		animationstore.Blink = math.random(180,280)
	end
end,
Draw = function(x,y,color,size,typeofblock,breaking,animationstore,posx,posy,playerdata)
	if false then
	elseif animationstore.WAAAAA > 0 then
	love.graphics.draw(math.fmod(animationstore.WAAAAA,8) > 4 and gusun.owa2 or gusun.owa1,-16+x+animationstore.Gussun.X,-32+y+animationstore.Gussun.Y,0,size,size)
	
	elseif animationstore.HU > 6+6+6+5+5 + 4+4+10+12+6+6+6 then
	love.graphics.draw(gusun.hu1,(animationstore.Orientation and -16 or 48)+x,-32+y,0,size*(animationstore.Orientation and 1 or -1),size)
	elseif animationstore.HU > 6+6+5+5 + 4+4+10+12+6+6+6 then
	love.graphics.draw(gusun.hu2,(animationstore.Orientation and -16 or 48)+x,-32+y,0,size*(animationstore.Orientation and 1 or -1),size)
	elseif animationstore.HU > 6+5+5 + 4+4+10+12+6+6+6 then
	love.graphics.draw(gusun.hu1,(animationstore.Orientation and -16 or 48)+x,-32+y,0,size*(animationstore.Orientation and 1 or -1),size)
	elseif animationstore.HU > 5+5 + 4+4+10+12+6+6+6 then
	love.graphics.draw(gusun.hu2,(animationstore.Orientation and -16 or 48)+x,-32+y,0,size*(animationstore.Orientation and 1 or -1),size)
	elseif animationstore.HU > 5 + 4+4+10+12+6+6+6 then
	love.graphics.draw(gusun.hu3,(animationstore.Orientation and -16 or 48)+x,-32+y,0,size*(animationstore.Orientation and 1 or -1),size)
	elseif animationstore.HU > 4+4+10+12+6+6+6 then
	love.graphics.draw(gusun.hu4,(animationstore.Orientation and -16 or 48)+x,-32+y,0,size*(animationstore.Orientation and 1 or -1),size)
	
	elseif animationstore.HU > 4+10+12+6+6+6 then
	love.graphics.draw(gusun.wa1,(animationstore.Orientation and -16 or 48)+x,-32+y,0,size*(animationstore.Orientation and 1 or -1),size)
	elseif animationstore.HU > 10+12+6+6+6 then
	love.graphics.draw(gusun.wa2,(animationstore.Orientation and -16 or 48)+x,-32+y,0,size*(animationstore.Orientation and 1 or -1),size)
	elseif animationstore.HU > 12+6+6+6 then
	love.graphics.draw(gusun.wa3,(animationstore.Orientation and -16 or 48)+x,-32+y,0,size*(animationstore.Orientation and 1 or -1),size)
	elseif animationstore.HU > 6+6+6 then
	love.graphics.draw(gusun.wa4,(animationstore.Orientation and -16 or 48)+x,-32+y,0,size*(animationstore.Orientation and 1 or -1),size)
	elseif animationstore.HU > 6+6 then
	love.graphics.draw(gusun.wa5,(animationstore.Orientation and -16 or 48)+x,-32+y,0,size*(animationstore.Orientation and 1 or -1),size)
	elseif animationstore.HU > 6 then
	love.graphics.draw(gusun.wa6,(animationstore.Orientation and -16 or 48)+x,-32+y,0,size*(animationstore.Orientation and 1 or -1),size)
	elseif animationstore.HU > 0 then
	love.graphics.draw(gusun.wa7,(animationstore.Orientation and -16 or 48)+x,-32+y,0,size*(animationstore.Orientation and 1 or -1),size)
	
	elseif animationstore.Blink <= 5 then
	love.graphics.draw(gusun.lookup1,(animationstore.Orientation and -16 or 48)+x,-32+y,0,size*(animationstore.Orientation and 1 or -1),size)
	elseif animationstore.Blink <= 10 then
	love.graphics.draw(gusun.lookup2,(animationstore.Orientation and -16 or 48)+x,-32+y,0,size*(animationstore.Orientation and 1 or -1),size)
	elseif animationstore.Blink <= 15 then
	love.graphics.draw(gusun.lookup1,(animationstore.Orientation and -16 or 48)+x,-32+y,0,size*(animationstore.Orientation and 1 or -1),size)
	else
	love.graphics.draw(gusun.stand,(animationstore.Orientation and -16 or 48)+x,-32+y,0,size*(animationstore.Orientation and 1 or -1),size)
	end
end,
}