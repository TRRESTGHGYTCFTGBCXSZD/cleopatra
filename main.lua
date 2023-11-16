function roblox_loadpieceassets()
	local patrasono = {["Coverable"]={["Small"]={},["Big"]={},},["Gem"]={},["Coffin"]={},["Mummy"]={["Small"]={},["Big"]={},},}
	local patrakoi = script.Blocks.Coverable.Small
	for k, file in ipairs(patrakoi:GetChildren()) do
		patrasono.Coverable.Small[file.Name]=require(file)
	end
	local patrakoi = script.Blocks.Coverable.Big
	for k, file in ipairs(patrakoi:GetChildren()) do
		patrasono.Coverable.Big[file.Name]=require(file)
	end
	local patrakoi = script.Blocks.Gem
	for k, file in ipairs(patrakoi:GetChildren()) do
		patrasono.Gem[file.Name]=require(file)
	end
	local patrakoi = script.Blocks.Coffin
	for k, file in ipairs(patrakoi:GetChildren()) do
		patrasono.Coffin[file.Name]=require(file)
	end
	local patrakoi = script.Blocks.Mummy.Small
	for k, file in ipairs(patrakoi:GetChildren()) do
		patrasono.Mummy.Small[file.Name]=require(file)
	end
	local patrakoi = script.Blocks.Mummy.Big
	for k, file in ipairs(patrakoi:GetChildren()) do
		patrasono.Mummy.Small[file.Name]=require(file)
	end
	return patrasono
end
function love_loadpieceassets()
	local patrasono = {["Coverable"]={["Small"]={},["Big"]={},},["Gem"]={},["Coffin"]={},["Mummy"]={["Small"]={},["Big"]={},},}
	local patrakoi = "data/blocks/coverable/small"
	local files = love.filesystem.getDirectoryItems(patrakoi)
	for k, file in ipairs(files) do
		patrasono.Coverable.Small[file]=love_loadpieceasset(patrakoi.."/"..file,false)
	end
	local patrakoi = "data/blocks/coverable/big"
	local files = love.filesystem.getDirectoryItems(patrakoi)
	for k, file in ipairs(files) do
		patrasono.Coverable.Big[file]=love_loadpieceasset(patrakoi.."/"..file,true)
	end
	local patrakoi = "data/blocks/gems"
	local files = love.filesystem.getDirectoryItems(patrakoi)
	for k, file in ipairs(files) do
		patrasono.Gem[file]=love_loadpieceasset(patrakoi.."/"..file,false)
	end
	local patrakoi = "data/blocks/coffins"
	local files = love.filesystem.getDirectoryItems(patrakoi)
	for k, file in ipairs(files) do
		patrasono.Coffin[file]=love_loadpieceasset(patrakoi.."/"..file,true)
	end
	local patrakoi = "data/blocks/mummies/small"
	local files = love.filesystem.getDirectoryItems(patrakoi)
	for k, file in ipairs(files) do
		patrasono.Mummy.Small[file]=love_loadpieceasset(patrakoi.."/"..file,false)
	end
	local patrakoi = "data/blocks/mummies/big"
	local files = love.filesystem.getDirectoryItems(patrakoi)
	for k, file in ipairs(files) do
		patrasono.Mummy.Big[file]=love_loadpieceasset(patrakoi.."/"..file,true)
	end
	return patrasono
end
function love_loadpieceasset(loc,large)
	ban, yoiiiiii = pcall(function()
	if love.filesystem.getInfo(loc) and love.filesystem.getInfo(loc)["type"] == "directory" and love.filesystem.getInfo(loc.."/code.lua") then
		local pinokono = love.filesystem.load(loc.."/code.lua")()
		if pinokono.Load then
			pinokono.Load(loc.."/")
		end
		return pinokono
	elseif (love.filesystem.getInfo(loc..".png") and (not (string.sub(loc,-8,-1) == "_overlay"))) or (love.filesystem.getInfo(loc) and pcall(function()local ito=love.graphics.newImage(loc)ito:release()end) and (not (string.sub(loc,-12,-5) == "_overlay"))) then
		local pinokono = large and love.filesystem.load("data/scripts/coverable/big.lua")() or love.filesystem.load("data/scripts/coverable/small.lua")()
		if pinokono.Load then
			pinokono.Load(string.sub(loc,1,-5))
		end
		return pinokono
	else 
		if (not (string.sub(loc,-12,-5) == "_overlay")) then -- handle if this is overlay file
			print("piece asset "..loc.." does not exist or has incorrect data")
		end
		return nil
	end
	end
	)
	if not ban then
		print("someting unexpected happened while loading, error is: "..yoiiiiii)
		return nil
	elseif ban then
		return yoiiiiii
	end
end
function DeductCredits1P(nmb)
	if game and game["Run Service"] then
		script.Parent.Credits1P.Value = script.Parent.Credits1P.Value - nmb
	end
end
function DeductCredits2P(nmb)
	if game and game["Run Service"] then
		script.Parent.Credits2P.Value = script.Parent.Credits2P.Value - nmb
	end
end
local function lerp(a,b,t) return a * (1-t) + b * t end
local function inverselerp(a,b,t) return (t-a)/(b-a) end
if love and love._version_major then
function love.load()
	rando = love.math.random
	love.math.setRandomSeed(os.time())
	math.randomseed(os.time())
	frames = 0
	frameticks = 0
	MachineConfiguration={
	["Credits1P"]=math.huge,
	["Credits2P"]=math.huge,
	["DualPlay"]=true,
	["CreditsPerPlay"]=1,
	["CreditsPerContinue"]=1,
	["ChallengerWelcome"]=true,
	["ContinueAllowed"]=true,
	["Player2Welcome"]=true,
	["VSOnSelection"]=true,
	["CoopOnSelection"]=true,
	["Level"]=8,
	}
	if not bit32 then bit32 = require("bit") end
	vox=require("data.scripts.sounds.VOX")
	love.graphics.setBackgroundColor(0, 0, 0, 0)
	bg = love.graphics.newImage("bg.png")
	board = love.graphics.newImage("board.png")
	errored = love.graphics.newImage("data/tex/error.png")
	music = love.audio.newSource("data/music/towinqux.ogg", "stream")
	music:setLooping(true)
	music:play()
	pieceimagetype = love_loadpieceassets()
	print("this has passed correctly")
	entrydl = 10
	timepassed = 10
	audaauda={}
	audaauda.selecto = love.audio.newSource("data/sound/select.wav", "static")
	audaauda.decide = love.audio.newSource("data/sound/decide.wav", "static")
	audaauda.dead = love.audio.newSource("data/sound/dead.wav", "static")
	audaauda.land = love.audio.newSource("data/sound/bonk.wav", "static")
	audaauda.rotate = love.audio.newSource("data/sound/rotate.wav", "static")
	audaauda.covered = love.audio.newSource("data/sound/coverage.wav", "static")
	audaauda.coverablebreak = love.audio.newSource("data/sound/blockbreak.wav", "static")
	audaauda.gembreak = love.audio.newSource("data/sound/gembreak.wav", "static")
	audaauda.mummybreak = love.audio.newSource("data/sound/lineclear.wav", "static")
	audaauda.chain = love.audio.newSource("data/sound/chain.wav", "static")
	controls = {["P1Left"]={"kbd","left"},["P1Right"]={"kbd","right"},["P1SoftDrop"]={"kbd","down"},["P1HardDrop"]={"kbd","up"},["P1CCW"]={"kbd","z"},["P1CW"]={"kbd","x"},["P1Hold"]={"kbd","space"},
	["P2Left"]={"none","none"},["P2Right"]={"none","none"},["P2SoftDrop"]={"none","none"},["P2HardDrop"]={"none","none"},["P2CCW"]={"none","none"},["P2CW"]={"none","none"},["P2Hold"]={"none","none"},}
	controleating = false
	whatcontroleating = nil
	piecetype=require("data.blocks.piecetype")
	piecetypeallowedqueue=require("data.blocks.piecequeue")
	p1 = {}
	initplayer(p1)
	p2 = {}
	initplayer(p2)
end
end
if game and game["Run Service"] then
	rando = math.random
	frames = 0
	frameticks = 0
	if not bit32 then bit32 = require("bit") end
	pieceimagetype = roblox_loadpieceassets()
	print("this has passed correctly")
	entrydl = 10
	timepassed = 10
	piecetype=require(script.piecetype)
	piecetypeallowedqueue=require(script.piecequeue)
	p1 = {}
	initplayer(p1)
	p2 = {}
	initplayer(p2)
end
function getgravityforlevel(level)
	return level <= 9 and (1/80)*(level^(2^(1/2))) or (1/40)*((math.fmod(level,10)^(((math.floor(level/10)+1)^(1/2))^(1/2)))+1)
end
	function tablltablltabllcontains(list, x)
		for _, v in pairs(list) do
			if v == x then return true end
		end
		return false
	end
	function tablltablltabllelsecontains(list, x)
		for _, v in pairs(list) do
			if v ~= x then return true end
		end
		return false
	end
	function deepCopy(original)
		local copy = {}
		for k, v in pairs(original) do
			if type(v) == "table" then
				v = deepCopy(v)
			end
			copy[k] = v
		end
		return copy
	end
function initplayer(player)
	player.board=
	{
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	{nil,nil,nil,nil,nil,nil,nil,},
	}
	player.coverboard=
	{
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	{{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},{0,false},},
	}
	player.particlefordeadpieces={}
	player.gemd={}
	player.pieceactive=false
	player.piecex=0
	player.piecey=0
	player.piececurrent=nil
	player.piecequeue={
	ProcessPiece(piecetype.GemBlock),
	}
	player.attackincoming=0
	player.linecleartrigger=false
	player.lineclears=0
	player.dead=false
	player.ccwinput=false
	player.ccwlock=false
	player.cwinput=false
	player.cwlock=false
	player.holdinput=false
	player.holdlock=false
	player.chain=-1
	player.perfectclear=false
	player.leftinput=false
	player.leftdas=10
	player.rightinput=false
	player.rightdas=10
	player.sdinput=false
	player.hdinput=false
	player.unstableboard=false
	player.coverpopd=false
	player.linepopd=false
	player.smthistouching=true
	player.downwardtime=0
	player.hasbeenlanded=false
	player.resetafterpoint=0
	player.locktime=30
	player.perfectclearframes=0
	player.are=0
	player.level=59
	player.blocksuntilnextlevel=8
	
	player.playsound={
	["land"]=false,
	["lock"]=false,
	["rotateccw"]=false,
	["rotatecw"]=false,
	["moveleft"]=false,
	["moveright"]=false,
	["coverablebreak"]=false,
	["chain"]=false,
	["gembreak"]=false,
	["coffinbreak"]=false,
	["mummybreak"]=false,
	["covered"]=false,
	["bonus"]=false,
	["gravityland"]=false,
	["dead"]=false,
	}
end
function collidetest(board,x,y)
	local clipping = false
	if x <= 0 or x >= 8 or (y <= 0 and (x <= 0 or x >= 8)) or y >= 26 then
		clipping = true
	else
		if y >= 1 then
			if board[y][x] ~= nil then
				clipping = true
			end
		end
	end
	return clipping
end
function ShuffleInPlace(t)
    for i = #t, 2, -1 do
        local j = love.math.random(i)
        t[i], t[j] = t[j], t[i]
    end
end
function randomtableo(myTable)
-- iterate over whole table to get all keys
local keyset = {}
for k in pairs(myTable) do
    table.insert(keyset, k)
end
-- now you can reliably return a random key
return myTable[keyset[rando(#keyset)]]
end
function ProcessPiece(Piece)
	local pieceyon = {{nil,nil,nil},{nil,nil,nil},{nil,nil,nil}}
	for pooy = 1,3 do
		for poox = 1,3 do
			if Piece[pooy][poox] ~= nil then
			if Piece[pooy][poox] == "BLS" then
				pieceyon[pooy][poox] = {"BLS",randomtableo(pieceimagetype.Coverable.Small),{}}
				pieceyon[pooy][poox][2].Create(pieceyon[pooy][poox][3])
			end
			if Piece[pooy][poox] == "BLT0" then
				local Yojong = randomtableo(pieceimagetype.Coverable.Big)
				pieceyon[pooy][poox] = {"BLT0H",Yojong,{}}
				pieceyon[pooy+1][poox] = {"BLT0T",Yojong,{}}
				Yojong.Create(pieceyon[pooy][poox][3])
				Yojong.Create(pieceyon[pooy+1][poox][3])
			end
			if Piece[pooy][poox] == "BLT90" then
				local Yojong = randomtableo(pieceimagetype.Coverable.Big)
				pieceyon[pooy][poox+1] = {"BLT90H",Yojong,{}}
				pieceyon[pooy][poox] = {"BLT90T",Yojong,{}}
				Yojong.Create(pieceyon[pooy][poox][3])
				Yojong.Create(pieceyon[pooy][poox+1][3])
			end
			if Piece[pooy][poox] == "BLT180" then
				local Yojong = randomtableo(pieceimagetype.Coverable.Big)
				pieceyon[pooy+1][poox] = {"BLT180H",Yojong,{}}
				pieceyon[pooy][poox] = {"BLT180T",Yojong,{}}
				Yojong.Create(pieceyon[pooy][poox][3])
				Yojong.Create(pieceyon[pooy+1][poox][3])
			end
			if Piece[pooy][poox] == "BLT270" then
				local Yojong = randomtableo(pieceimagetype.Coverable.Big)
				pieceyon[pooy][poox] = {"BLT270H",Yojong,{}}
				pieceyon[pooy][poox+1] = {"BLT270T",Yojong,{}}
				Yojong.Create(pieceyon[pooy][poox][3])
				Yojong.Create(pieceyon[pooy][poox+1][3])
			end
			if Piece[pooy][poox] == "GM" then
				pieceyon[pooy][poox] = {"GMS",randomtableo(pieceimagetype.Gem),{}}
				pieceyon[pooy][poox][2].Create(pieceyon[pooy][poox][3])
			end
			if Piece[pooy][poox] == "CF0" then
				local Yojong = randomtableo(pieceimagetype.Coffin)
				pieceyon[pooy][poox] = {"CFT0H",Yojong,{}}
				pieceyon[pooy+1][poox] = {"CFT0T",Yojong,{}}
				Yojong.Create(pieceyon[pooy][poox][3])
				Yojong.Create(pieceyon[pooy+1][poox][3])
			end
			if Piece[pooy][poox] == "CF90" then
				local Yojong = randomtableo(pieceimagetype.Coffin)
				pieceyon[pooy][poox+1] = {"CFT90H",Yojong,{}}
				pieceyon[pooy][poox] = {"CFT90T",Yojong,{}}
				Yojong.Create(pieceyon[pooy][poox][3])
				Yojong.Create(pieceyon[pooy][poox+1][3])
			end
			if Piece[pooy][poox] == "CF180" then
				local Yojong = randomtableo(pieceimagetype.Coffin)
				pieceyon[pooy+1][poox] = {"CFT180H",Yojong,{}}
				pieceyon[pooy][poox] = {"CFT180T",Yojong,{}}
				Yojong.Create(pieceyon[pooy][poox][3])
				Yojong.Create(pieceyon[pooy+1][poox][3])
			end
			if Piece[pooy][poox] == "CF270" then
				local Yojong = randomtableo(pieceimagetype.Coffin)
				pieceyon[pooy][poox] = {"CFT270H",Yojong,{}}
				pieceyon[pooy][poox+1] = {"CFT270T",Yojong,{}}
				Yojong.Create(pieceyon[pooy][poox][3])
				Yojong.Create(pieceyon[pooy][poox+1][3])
			end
			if Piece[pooy][poox] == "MUS" then
				pieceyon[pooy][poox] = {"MUS",randomtableo(pieceimagetype.Mummy.Small),{}}
				pieceyon[pooy][poox][2].Create(pieceyon[pooy][poox][3])
			end
			if Piece[pooy][poox] == "MUT0" then
				local Yojong = randomtableo(pieceimagetype.Mummy.Big)
				pieceyon[pooy][poox] = {"MUT0H",Yojong,{}}
				pieceyon[pooy+1][poox] = {"MUT0T",Yojong,{}}
				Yojong.Create(pieceyon[pooy][poox][3])
				Yojong.Create(pieceyon[pooy+1][poox][3])
			end
			if Piece[pooy][poox] == "MUT90" then
				local Yojong = randomtableo(pieceimagetype.Mummy.Big)
				pieceyon[pooy][poox+1] = {"MUT90H",Yojong,{}}
				pieceyon[pooy][poox] = {"MUT90T",Yojong,{}}
				Yojong.Create(pieceyon[pooy][poox][3])
				Yojong.Create(pieceyon[pooy][poox+1][3])
			end
			if Piece[pooy][poox] == "MUT180" then
				local Yojong = randomtableo(pieceimagetype.Mummy.Big)
				pieceyon[pooy+1][poox] = {"MUT180H",Yojong,{}}
				pieceyon[pooy][poox] = {"MUT180T",Yojong,{}}
				Yojong.Create(pieceyon[pooy][poox][3])
				Yojong.Create(pieceyon[pooy+1][poox][3])
			end
			if Piece[pooy][poox] == "MUT270" then
				local Yojong = randomtableo(pieceimagetype.Mummy.Big)
				pieceyon[pooy][poox] = {"MUT270H",Yojong,{}}
				pieceyon[pooy][poox+1] = {"MUT270T",Yojong,{}}
				Yojong.Create(pieceyon[pooy][poox][3])
				Yojong.Create(pieceyon[pooy][poox+1][3])
			end
			end
		end
	end
	return pieceyon
end
if love and love._version_major then -- love2d controls
function love.keypressed(key, scancode, isrepeat)
	if controleating then
	controls[whatcontroleating][1] = "kbd"
	controls[whatcontroleating][2] = key
	controleating = false
	love.audio.stop(audaauda.decide)
	love.audio.play(audaauda.decide)
	else
	if controls.P1CCW[1] == "kbd" and key == controls.P1CCW[2] then
		p1.ccwinput=true
	end
	if controls.P1CW[1] == "kbd" and key == controls.P1CW[2] then
		p1.cwinput=true
	end
	if controls.P1Left[1] == "kbd" and key == controls.P1Left[2] then
		p1.leftinput=true
	end
	if controls.P1Right[1] == "kbd" and key == controls.P1Right[2] then
		p1.rightinput=true
	end
	if controls.P1SoftDrop[1] == "kbd" and key == controls.P1SoftDrop[2] then
		p1.sdinput=true
	end
	if controls.P1HardDrop[1] == "kbd" and key == controls.P1HardDrop[2] then
		p1.hdinput=true
	end
	if controls.P1Hold[1] == "kbd" and key == controls.P1Hold[2] then
		p1.holdinput=true
	end
	if controls.P2CCW[1] == "kbd" and key == controls.P2CCW[2] then
		p2.ccwinput=true
	end
	if controls.P2CW[1] == "kbd" and key == controls.P2CW[2] then
		p2.cwinput=true
	end
	if controls.P2Left[1] == "kbd" and key == controls.P2Left[2] then
		p2.leftinput=true
	end
	if controls.P2Right[1] == "kbd" and key == controls.P2Right[2] then
		p2.rightinput=true
	end
	if controls.P2SoftDrop[1] == "kbd" and key == controls.P2SoftDrop[2] then
		p2.sdinput=true
	end
	if controls.P2HardDrop[1] == "kbd" and key == controls.P2HardDrop[2] then
		p2.hdinput=true
	end
	if controls.P2Hold[1] == "kbd" and key == controls.P2Hold[2] then
		p2.holdinput=true
	end
	end
end
function love.keyreleased(key)
	if controls.P1CCW[1] == "kbd" and key == controls.P1CCW[2] then
		p1.ccwinput=false
	end
	if controls.P1CW[1] == "kbd" and key == controls.P1CW[2] then
		p1.cwinput=false
	end
	if controls.P1Left[1] == "kbd" and key == controls.P1Left[2] then
		p1.leftinput=false
	end
	if controls.P1Right[1] == "kbd" and key == controls.P1Right[2] then
		p1.rightinput=false
	end
	if controls.P1SoftDrop[1] == "kbd" and key == controls.P1SoftDrop[2] then
		p1.sdinput=false
	end
	if controls.P1HardDrop[1] == "kbd" and key == controls.P1HardDrop[2] then
		p1.hdinput=false
	end
	if controls.P1Hold[1] == "kbd" and key == controls.P1Hold[2] then
		p1.holdinput=false
	end
	if controls.P2CCW[1] == "kbd" and key == controls.P2CCW[2] then
		p2.ccwinput=false
	end
	if controls.P2CW[1] == "kbd" and key == controls.P2CW[2] then
		p2.cwinput=false
	end
	if controls.P2Left[1] == "kbd" and key == controls.P2Left[2] then
		p2.leftinput=false
	end
	if controls.P2Right[1] == "kbd" and key == controls.P2Right[2] then
		p2.rightinput=false
	end
	if controls.P2SoftDrop[1] == "kbd" and key == controls.P2SoftDrop[2] then
		p2.sdinput=false
	end
	if controls.P2HardDrop[1] == "kbd" and key == controls.P2HardDrop[2] then
		p2.hdinput=false
	end
	if controls.P2Hold[1] == "kbd" and key == controls.P2Hold[2] then
		p2.holdinput=false
	end
end
function love.gamepadpressed(control, key)
	if controleating then
	controls[whatcontroleating][1] = control
	controls[whatcontroleating][2] = key
	controleating = false
	love.audio.stop(audaauda.decide)
	love.audio.play(audaauda.decide)
	else
	if controls.P1CCW[1] == control and key == controls.P1CCW[2] then
		p1.ccwinput=true
	end
	if controls.P1CW[1] == control and key == controls.P1CW[2] then
		p1.cwinput=true
	end
	if controls.P1Left[1] == control and key == controls.P1Left[2] then
		p1.leftinput=true
	end
	if controls.P1Right[1] == control and key == controls.P1Right[2] then
		p1.rightinput=true
	end
	if controls.P1SoftDrop[1] == control and key == controls.P1SoftDrop[2] then
		p1.sdinput=true
	end
	if controls.P1HardDrop[1] == control and key == controls.P1HardDrop[2] then
		p1.hdinput=true
	end
	if controls.P1Hold[1] == control and key == controls.P1Hold[2] then
		p1.holdinput=true
	end
	if controls.P2CCW[1] == control and key == controls.P2CCW[2] then
		p2.ccwinput=true
	end
	if controls.P2CW[1] == control and key == controls.P2CW[2] then
		p2.cwinput=true
	end
	if controls.P2Left[1] == control and key == controls.P2Left[2] then
		p2.leftinput=true
	end
	if controls.P2Right[1] == control and key == controls.P2Right[2] then
		p2.rightinput=true
	end
	if controls.P2SoftDrop[1] == control and key == controls.P2SoftDrop[2] then
		p2.sdinput=true
	end
	if controls.P2HardDrop[1] == control and key == controls.P2HardDrop[2] then
		p2.hdinput=true
	end
	if controls.P2Hold[1] == control and key == controls.P2Hold[2] then
		p2.holdinput=true
	end
	end
end
function love.gamepadreleased(control, key)
	if controls.P1CCW[1] == control and key == controls.P1CCW[2] then
		p1.ccwinput=false
	end
	if controls.P1CW[1] == control and key == controls.P1CW[2] then
		p1.cwinput=false
	end
	if controls.P1Left[1] == control and key == controls.P1Left[2] then
		p1.leftinput=false
	end
	if controls.P1Right[1] == control and key == controls.P1Right[2] then
		p1.rightinput=false
	end
	if controls.P1SoftDrop[1] == control and key == controls.P1SoftDrop[2] then
		p1.sdinput=false
	end
	if controls.P1HardDrop[1] == control and key == controls.P1HardDrop[2] then
		p1.hdinput=false
	end
	if controls.P1Hold[1] == control and key == controls.P1Hold[2] then
		p1.holdinput=false
	end
	if controls.P2CCW[1] == control and key == controls.P2CCW[2] then
		p2.ccwinput=false
	end
	if controls.P2CW[1] == control and key == controls.P2CW[2] then
		p2.cwinput=false
	end
	if controls.P2Left[1] == control and key == controls.P2Left[2] then
		p2.leftinput=false
	end
	if controls.P2Right[1] == control and key == controls.P2Right[2] then
		p2.rightinput=false
	end
	if controls.P2SoftDrop[1] == control and key == controls.P2SoftDrop[2] then
		p2.sdinput=false
	end
	if controls.P2HardDrop[1] == control and key == controls.P2HardDrop[2] then
		p2.hdinput=false
	end
	if controls.P2Hold[1] == control and key == controls.P2Hold[2] then
		p2.holdinput=false
	end
end
function love.gamepadaxis(control, key, activation)
	if controleating and activation >= 0.5 then
	controls[whatcontroleating][1] = control
	controls[whatcontroleating][2] = key
	love.audio.stop(audaauda.decide)
	love.audio.play(audaauda.decide)
	else
	if controls.P1CCW[1] == control and key == controls.P1CCW[2] then
		p1.ccwinput=activation >= 0.5
	end
	if controls.P1CW[1] == control and key == controls.P1CW[2] then
		p1.cwinput=activation >= 0.5
	end
	if controls.P1Left[1] == control and key == controls.P1Left[2] then
		p1.leftinput=activation >= 0.5
	end
	if controls.P1Right[1] == control and key == controls.P1Right[2] then
		p1.rightinput=activation >= 0.5
	end
	if controls.P1SoftDrop[1] == control and key == controls.P1SoftDrop[2] then
		p1.sdinput=activation >= 0.5
	end
	if controls.P1HardDrop[1] == control and key == controls.P1HardDrop[2] then
		p1.hdinput=activation >= 0.5
	end
	if controls.P1Hold[1] == control and key == controls.P1Hold[2] then
		p1.holdinput=activation >= 0.5
	end
	if controls.P2CCW[1] == control and key == controls.P2CCW[2] then
		p2.ccwinput=activation >= 0.5
	end
	if controls.P2CW[1] == control and key == controls.P2CW[2] then
		p2.cwinput=activation >= 0.5
	end
	if controls.P2Left[1] == control and key == controls.P2Left[2] then
		p2.leftinput=activation >= 0.5
	end
	if controls.P2Right[1] == control and key == controls.P2Right[2] then
		p2.rightinput=activation >= 0.5
	end
	if controls.P2SoftDrop[1] == control and key == controls.P2SoftDrop[2] then
		p2.sdinput=activation >= 0.5
	end
	if controls.P2HardDrop[1] == control and key == controls.P2HardDrop[2] then
		p2.hdinput=activation >= 0.5
	end
	if controls.P2Hold[1] == control and key == controls.P2Hold[2] then
		p2.holdinput=activation >= 0.5
	end
	end
end
function love.mousepressed( x, y, button, istouch, presses )
	if button ~= 1 then return end
	if controleating then
		love.audio.stop(audaauda.dead)
		love.audio.play(audaauda.dead)
		controleating = false
	elseif y < 16*torturey then
		if 0 <= x and x < 16*torturex then
			love.audio.stop(audaauda.selecto)
			love.audio.play(audaauda.selecto)
			controleating = true
			whatcontroleating = "P1CCW"
		end
		if 16*torturex <= x and x < 32*torturex then
			love.audio.stop(audaauda.selecto)
			love.audio.play(audaauda.selecto)
			controleating = true
			whatcontroleating = "P1CW"
		end
		if 32*torturex <= x and x < 48*torturex then
			love.audio.stop(audaauda.selecto)
			love.audio.play(audaauda.selecto)
			controleating = true
			whatcontroleating = "P1Left"
		end
		if 48*torturex <= x and x < 64*torturex then
			love.audio.stop(audaauda.selecto)
			love.audio.play(audaauda.selecto)
			controleating = true
			whatcontroleating = "P1Right"
		end
		if 64*torturex <= x and x < 80*torturex then
			love.audio.stop(audaauda.selecto)
			love.audio.play(audaauda.selecto)
			controleating = true
			whatcontroleating = "P1SoftDrop"
		end
		if 80*torturex <= x and x < 96*torturex then
			love.audio.stop(audaauda.selecto)
			love.audio.play(audaauda.selecto)
			controleating = true
			whatcontroleating = "P1HardDrop"
		end
		if 96*torturex <= x and x < 112*torturex then
			love.audio.stop(audaauda.selecto)
			love.audio.play(audaauda.selecto)
			controleating = true
			whatcontroleating = "P1Hold"
		end
		if 128*torturex <= x and x < 144*torturex then
			love.audio.stop(audaauda.selecto)
			love.audio.play(audaauda.selecto)
			controleating = true
			whatcontroleating = "P2CCW"
		end
		if 144*torturex <= x and x < 160*torturex then
			love.audio.stop(audaauda.selecto)
			love.audio.play(audaauda.selecto)
			controleating = true
			whatcontroleating = "P2CW"
		end
		if 160*torturex <= x and x < 176*torturex then
			love.audio.stop(audaauda.selecto)
			love.audio.play(audaauda.selecto)
			controleating = true
			whatcontroleating = "P2Left"
		end
		if 176*torturex <= x and x < 192*torturex then
			love.audio.stop(audaauda.selecto)
			love.audio.play(audaauda.selecto)
			controleating = true
			whatcontroleating = "P2Right"
		end
		if 192*torturex <= x and x < 208*torturex then
			love.audio.stop(audaauda.selecto)
			love.audio.play(audaauda.selecto)
			controleating = true
			whatcontroleating = "P2SoftDrop"
		end
		if 208*torturex <= x and x <= 224*torturex then
			love.audio.stop(audaauda.selecto)
			love.audio.play(audaauda.selecto)
			controleating = true
			whatcontroleating = "P2HardDrop"
		end
		if 224*torturex <= x and x <= 240*torturex then
			love.audio.stop(audaauda.selecto)
			love.audio.play(audaauda.selecto)
			controleating = true
			whatcontroleating = "P2Hold"
		end
	end
end
end
function piececollidetest(board,piece,rotation,x,y)
	clipping = false
	for pies2 = 1 ,3 do
		for pies1 = 1 ,3 do
			if piece[pies2][pies1] ~= nil then
				if collidetest(board,x+pies1-1,y+pies2-1) == true then
					clipping = true
				end
			end
		end
	end
	return clipping
end
function modmod(a,b)return a-math.floor(a/b)*b end
function floodfill(checkboard,x,y,value)
	if checkboard[y] and checkboard[y][x] and checkboard[y][x][2] == false then
		checkboard[y][x][1] = value
		checkboard[y][x][2] = true
		floodfill(checkboard,x+1,y,value)
		floodfill(checkboard,x-1,y,value)
		floodfill(checkboard,x,y+1,value)
		floodfill(checkboard,x,y-1,value)
	end
end
function getyon(tabl,tabI)
    if #tabl == 0 then return nil end
    local key, value = -math.huge, nil
    for g,i in pairs(tabl) do
        if key < g and key >= tabI then
            key, value = g, i
        end
    end
    return key
end
function updateplayer(player)
	player.are = player.are - 1
		for ita = 1,25 do
			for ite = 1,7 do
				if player.board[ita][ite] ~= nil then
					player.board[ita][ite][2].Update(string.sub(player.board[ita][ite][1],3,-1),false,player.board[ita][ite][3],ite,ita,player)
				end
			end
		end
		for ita = 1,3 do
			for ite = 1,3 do
				if player.piececurrent ~= nil and player.piececurrent[ita][ite] ~= nil then
					player.piececurrent[ita][ite][2].Update(string.sub(player.piececurrent[ita][ite][1],3,-1),false,player.piececurrent[ita][ite][3],nil,nil,player)
				end
			end
		end
		for h,ita in pairs(player.particlefordeadpieces) do
			ita[2].Update(string.sub(ita[1],3,-1),true,ita[3],nil,nil,player)
			ita[6] = ita[6] - 1
			if ita[6] == 0 then player.particlefordeadpieces[h] = nil end
		end
	if player.pieceactive == false and player.dead == false and player.are > 0 then
		if (not player.leftinput) or (player.leftinput and player.rightinput) then
			player.leftdas = 10
		end
		if player.leftinput and (not(player.leftinput and player.rightinput)) then
			player.leftdas = player.leftdas - 1
		end
		if (not player.rightinput) or (player.leftinput and player.rightinput) then
			player.rightdas = 10
		end
		if player.rightinput and (not(player.leftinput and player.rightinput)) then
			player.rightdas = player.rightdas - 1
		end
		player.lineclears = 0
		player.linecleartrigger = true
		player.unstableboard = false
		player.coverpopd = false
		player.linepopd = false
		local pccheck = true
		for ita = 25,1,-1 do -- unstablecheck
			for ite = 1,7 do
				if player.board[ita][ite] and (string.sub(player.board[ita][ite][1],3,-1) == "S" or string.sub(player.board[ita][ite][1],3,-2) == "T0" or string.sub(player.board[ita][ite][1],3,-2) == "T180") then
					if not collidetest(player.board,ite,ita+1) then
						player.board[ita+1][ite],player.board[ita][ite] = player.board[ita][ite],nil
						player.unstableboard = true
						player.coverboard[ita+1][ite] = {0,true}
					elseif player.coverboard[ita][ite][2] == true then
						player.coverboard[ita][ite] = {0,false}
						player.playsound.gravityland = true
					end
				elseif player.board[ita][ite] and (string.sub(player.board[ita][ite][1],3,-1) == "T90T" or string.sub(player.board[ita][ite][1],3,-1) == "T270H") then
					if not (collidetest(player.board,ite,ita+1) or collidetest(player.board,ite+1,ita+1)) then
						player.board[ita+1][ite],player.board[ita][ite] = player.board[ita][ite],nil
						player.board[ita+1][ite+1],player.board[ita][ite+1] = player.board[ita][ite+1],nil
						player.unstableboard = true
						player.coverboard[ita+1][ite] = {0,true}
						player.coverboard[ita+1][ite+1] = {0,true}
					elseif player.coverboard[ita][ite] == {0,true} then
						player.coverboard[ita][ite] = {0,false}
						player.playsound.gravityland = true
					end
				end
			end
		end
		if player.unstableboard then
		player.are = entrydl
		end
		if player.unstableboard == false then
		for ita = 1,25 do -- coverpop
			for ite = 1,7 do
				player.coverboard[ita][ite] = {(ita*7)+ite,false}
				if player.board[ita][ite] and string.sub(player.board[ita][ite][1],1,2) == "BL" then
					player.coverboard[ita][ite] = {-1,true}
				end
			end
		end
			for ite = 1,7 do
				if player.coverboard[1][ite][1] ~= -1 then
					floodfill(player.coverboard,ite,1,0)
				end
			end
		for ita = 2,25 do
			for ite = 1,7 do
				if player.coverboard[ita][ite][2] == false then
					floodfill(player.coverboard,ite,ita,player.coverboard[ita][ite][1])
				end
			end
		end
		for ita = 1,25 do
			for ite = 1,7 do
					player.gemd[(ita*7)+ite] = false
			end
		end
		for ita = 1,25 do
			for ite = 1,7 do
				if player.board[ita][ite] and player.coverboard[ita][ite][1] ~= 0 and (string.sub(player.board[ita][ite][1],1,2) == "GM" or string.sub(player.board[ita][ite][1],1,2) == "CF") then
					player.gemd[player.coverboard[ita][ite][1]] = true
				end
			end
		end
		for ita = 1,25 do
			for ite = 1,7 do
				if player.gemd[player.coverboard[ita][ite][1]] then
					local deadban = player.board[ita][ite]
					deadban[4]=ite
					deadban[5]=ita
					deadban[6]=300
					table.insert(player.particlefordeadpieces,deadban)
					player.board[ita][ite] = nil
					player.coverpopd = true
				end
			end
		end
		if player.coverpopd then
			player.chain = player.chain + 1
			player.are = entrydl
			player.playsound.covered = true
		end
		if player.coverpopd == false then
		for ita = 1,25 do --linepop
			for ite = 1,7 do
				player.coverboard[ita][ite] = {0,false}
			end
		end
		for ita = 1,25 do 
			if player.board[ita][1] then
			local checkforsmth = string.sub(player.board[ita][1][1],1,2)
			local isgonnaliner = true
			for ite = 1,7 do
				if (not player.board[ita][ite]) or string.sub(player.board[ita][ite][1],1,2) ~= checkforsmth then
					isgonnaliner = false
				end
			end
			if isgonnaliner then
				for ite = 1,7 do
					if player.board[ita][ite] and (string.sub(player.board[ita][ite][1],3,-1) == "T0T" or string.sub(player.board[ita][ite][1],3,-1) == "T180H") then
						player.coverboard[ita-1][ite][2] = true
					end
					if player.board[ita][ite] and (string.sub(player.board[ita][ite][1],3,-1) == "T0H" or string.sub(player.board[ita][ite][1],3,-1) == "T180T") then
						player.coverboard[ita+1][ite][2] = true
					end
					player.coverboard[ita][ite][2] = true
				end
			end
			else
			end
		end
		for ita = 1,25 do
			for ite = 1,7 do
				if player.coverboard[ita][ite][2] == true then
					if string.sub(player.board[ita][ite][1],1,2) == "BL" then player.playsound.coverablebreak = true end
					if string.sub(player.board[ita][ite][1],1,2) == "GM" then player.playsound.gembreak = true end
					if string.sub(player.board[ita][ite][1],1,2) == "CF" then player.playsound.coffinbreak = true end
					if string.sub(player.board[ita][ite][1],1,2) == "MU" then player.playsound.mummybreak = true end
					local deadban = player.board[ita][ite]
					deadban[4]=ite
					deadban[5]=ita
					deadban[6]=300
					table.insert(player.particlefordeadpieces,deadban)
					player.board[ita][ite] = nil
					player.linepopd = true
				end
			end
		end
		if player.linepopd then
			player.chain = player.chain + 1
			player.are = entrydl
		end
		end
		end
		if (player.coverpopd or player.linepopd) and player.chain >= 2 then
			player.playsound.chain = true
		end
		for ita = 1,25 do
			for ite = 1,7 do
				if player.board[ita][ite] ~= nil then
					pccheck = false
				end
			end
		end
		--print(player.unstableboard)
		--print(player.coverpopd)
		--print(player.linepopd)
		--print(player.are)
		player.perfectclear = pccheck
		if pccheck then
			player.perfectclearframes=120
		end
	elseif player.pieceactive == false and player.dead == false and player.are <= 0 then
		player.pieceactive = true
		if not player.donotnext then
			player.piececurrent = table.remove(player.piecequeue,1)
			if #player.piecequeue < 3 then
				local yonnnn = piecetypeallowedqueue[getyon(piecetypeallowedqueue,player.level)]
				print(getyon(piecetypeallowedqueue,player.level))
				table.insert(player.piecequeue,ProcessPiece(piecetype[randomtableo(yonnnn)]))
			end
		end
		player.piecex = 3
		player.piecey = 10
		if not (player.piececurrent[3][1] ~= nil or player.piececurrent[3][2] ~= nil or player.piececurrent[3][3] ~= nil) then
			player.piecey = player.piecey + 1
		end
		player.piecerotation = 0
		player.downwardtime = 0
		player.locktime = 30
		player.resetafterpoint = 0
		player.ccwlock = false
		player.cwlock = false
		player.holdlock = false
		player.tspin = "no"
		if player.ccwinput or player.cwinput then
		player.ccwlock = true
		player.cwlock = true
		end
		if piececollidetest(player.board,player.piececurrent,player.piecerotation,player.piecex,player.piecey) or collidetest(player.board,4,13) then
			player.dead = true
			player.playsound.dead = true
			player.piecey = player.piecey + 1
		end
	end
	if player.pieceactive == true and player.dead == false then
		
		player.downwardtime=player.downwardtime+getgravityforlevel(player.level)
		
		if (not player.leftinput) or (player.leftinput and player.rightinput) then
			player.leftdas = 10
		end
		
		if player.leftinput and (not(player.leftinput and player.rightinput)) then
			if player.leftdas == 10 or player.leftdas < 0 then
				ishemoving = true
				player.piecex = player.piecex - 1
				if piececollidetest(player.board,player.piececurrent,player.piecerotation,player.piecex,player.piecey) then
					ishemoving = false
					player.piecex = player.piecex + 1
				end
				if ishemoving then
					player.playsound.moveleft = true
				end
			end
			player.leftdas = player.leftdas - 1
		end
		
		if (not player.rightinput) or (player.leftinput and player.rightinput) then
			player.rightdas = 10
		end
		
		if player.rightinput and (not(player.leftinput and player.rightinput)) then
			if player.rightdas == 10 or player.rightdas < 0 then
				ishemoving = true
				player.piecex = player.piecex + 1
				if piececollidetest(player.board,player.piececurrent,player.piecerotation,player.piecex,player.piecey) then
					ishemoving = false
					player.piecex = player.piecex - 1
				end
				if ishemoving then
					player.playsound.moveright = true
				end
			end
			player.rightdas = player.rightdas - 1
		end
		
		if not player.ccwinput then
			player.ccwlock = false
		end
		
		if player.ccwinput and (not player.ccwlock) then
			player.ccwlock = true
			local rotatedpiece = deepCopy({{player.piececurrent[1][3],player.piececurrent[2][3],player.piececurrent[3][3]},{player.piececurrent[1][2],player.piececurrent[2][2],player.piececurrent[3][2]},{player.piececurrent[1][1],player.piececurrent[2][1],player.piececurrent[3][1]},})
			for dfgdgh1 = 1,3 do
				for dfgdgh2 = 1,3 do
					if rotatedpiece[dfgdgh2][dfgdgh1] then
					if string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],3,-1) == "T0H" then
						rotatedpiece[dfgdgh2][dfgdgh1][1] = string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],1,2).."T270H"
					elseif string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],3,-1) == "T90H" then
						rotatedpiece[dfgdgh2][dfgdgh1][1] = string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],1,2).."T0H"
					elseif string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],3,-1) == "T180H" then
						rotatedpiece[dfgdgh2][dfgdgh1][1] = string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],1,2).."T90H"
					elseif string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],3,-1) == "T270H" then
						rotatedpiece[dfgdgh2][dfgdgh1][1] = string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],1,2).."T180H"
					elseif string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],3,-1) == "T0T" then
						rotatedpiece[dfgdgh2][dfgdgh1][1] = string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],1,2).."T270T"
					elseif string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],3,-1) == "T90T" then
						rotatedpiece[dfgdgh2][dfgdgh1][1] = string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],1,2).."T0T"
					elseif string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],3,-1) == "T180T" then
						rotatedpiece[dfgdgh2][dfgdgh1][1] = string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],1,2).."T90T"
					elseif string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],3,-1) == "T270T" then
						rotatedpiece[dfgdgh2][dfgdgh1][1] = string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],1,2).."T180T"
					end
					end
				end
			end
			if piececollidetest(player.board,rotatedpiece,player.piecerotation,player.piecex,player.piecey) then
				if piececollidetest(player.board,rotatedpiece,player.piecerotation,player.piecex-1,player.piecey) then
					if piececollidetest(player.board,rotatedpiece,player.piecerotation,player.piecex+1,player.piecey) then
						if piececollidetest(player.board,rotatedpiece,player.piecerotation,player.piecex,player.piecey-1) then
							if piececollidetest(player.board,rotatedpiece,player.piecerotation,player.piecex,player.piecey+1) then
								
							else
								player.piecey=player.piecey+1
								player.piececurrent = rotatedpiece
								player.playsound.rotateccw = true
							end
						else
							player.piecey=player.piecey-1
							player.piececurrent = rotatedpiece
							player.playsound.rotateccw = true
						end
					else
						player.piecex=player.piecex+1
						player.piececurrent = rotatedpiece
						player.playsound.rotateccw = true
					end
				else
					player.piecex=player.piecex-1
					player.piececurrent = rotatedpiece
					player.playsound.rotateccw = true
				end
			else
				player.piececurrent = rotatedpiece
				player.playsound.rotateccw = true
			end
		end
		
		if not player.cwinput then
			player.cwlock = false
		end
		
		if player.cwinput and (not player.cwlock) then
			player.cwlock = true
			local rotatedpiece = deepCopy({{player.piececurrent[3][1],player.piececurrent[2][1],player.piececurrent[1][1]},{player.piececurrent[3][2],player.piececurrent[2][2],player.piececurrent[1][2]},{player.piececurrent[3][3],player.piececurrent[2][3],player.piececurrent[1][3]},})
			for dfgdgh1 = 1,3 do
				for dfgdgh2 = 1,3 do
					if rotatedpiece[dfgdgh2][dfgdgh1] then
					if string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],3,-1) == "T0H" then
						rotatedpiece[dfgdgh2][dfgdgh1][1] = string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],1,2).."T90H"
					elseif string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],3,-1) == "T90H" then
						rotatedpiece[dfgdgh2][dfgdgh1][1] = string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],1,2).."T180H"
					elseif string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],3,-1) == "T180H" then
						rotatedpiece[dfgdgh2][dfgdgh1][1] = string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],1,2).."T270H"
					elseif string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],3,-1) == "T270H" then
						rotatedpiece[dfgdgh2][dfgdgh1][1] = string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],1,2).."T0H"
					elseif string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],3,-1) == "T0T" then
						rotatedpiece[dfgdgh2][dfgdgh1][1] = string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],1,2).."T90T"
					elseif string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],3,-1) == "T90T" then
						rotatedpiece[dfgdgh2][dfgdgh1][1] = string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],1,2).."T180T"
					elseif string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],3,-1) == "T180T" then
						rotatedpiece[dfgdgh2][dfgdgh1][1] = string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],1,2).."T270T"
					elseif string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],3,-1) == "T270T" then
						rotatedpiece[dfgdgh2][dfgdgh1][1] = string.sub(rotatedpiece[dfgdgh2][dfgdgh1][1],1,2).."T0T"
					end
					end
				end
			end
			if piececollidetest(player.board,rotatedpiece,player.piecerotation,player.piecex,player.piecey) then
				if piececollidetest(player.board,rotatedpiece,player.piecerotation,player.piecex+1,player.piecey) then
					if piececollidetest(player.board,rotatedpiece,player.piecerotation,player.piecex-1,player.piecey) then
						if piececollidetest(player.board,rotatedpiece,player.piecerotation,player.piecex,player.piecey-1) then
							if piececollidetest(player.board,rotatedpiece,player.piecerotation,player.piecex,player.piecey+1) then
								
							else
								player.piecey=player.piecey+1
								player.piececurrent = rotatedpiece
								player.playsound.rotatecw = true
							end
						else
							player.piecey=player.piecey-1
							player.piececurrent = rotatedpiece
							player.playsound.rotatecw = true
						end
					else
						player.piecex=player.piecex-1
						player.piececurrent = rotatedpiece
						player.playsound.rotatecw = true
					end
				else
					player.piecex=player.piecex+1
					player.piececurrent = rotatedpiece
					player.playsound.rotatecw = true
				end
			else
				player.piececurrent = rotatedpiece
				player.playsound.rotatecw = true
			end
		end
		
		if piececollidetest(player.board,player.piececurrent,player.piecerotation,player.piecex,player.piecey+1) then
			player.downwardtime=0
			player.locktime=player.locktime-1
			if not player.hasbeenlanded then
				player.hasbeenlanded = true
				player.playsound.land = true
			end
		else
			player.hasbeenlanded = false
		if player.sdinput or player.downwardtime >= 1 then
			if player.sdinput and player.downwardtime < 1 then
				player.downwardtime = 1
			end
			while piececollidetest(player.board,player.piececurrent,player.piecerotation,player.piecex,player.piecey) == false and player.downwardtime >= 1 do
				player.piecey = player.piecey+1
				player.downwardtime = player.downwardtime - 1
				if player.piecey > player.resetafterpoint then
					player.locktime = 30
					player.resetafterpoint = player.piecey
				end
			end
			if piececollidetest(player.board,player.piececurrent,player.piecerotation,player.piecex,player.piecey) then
				player.piecey = player.piecey-1
			end
		end
		end
		
		if player.locktime <= 0 and piececollidetest(player.board,player.piececurrent,player.piecerotation,player.piecex,player.piecey+1) then
			for pies2 = 1 ,3 do
				for pies1 = 1 ,3 do
					if player.piececurrent[pies2][pies1] ~= nil then
						player.board[player.piecey+pies2-1][player.piecex+pies1-1],player.piececurrent[pies2][pies1]=player.piececurrent[pies2][pies1],nil
					end
				end
			end
			player.pieceactive = false
		end
	end
	if player.pieceactive == false and player.dead == false and player.are <= 0 then
		for ita = 1,25 do -- clear cover
			for ite = 1,7 do
				player.coverboard[ita][ite] = {0,false}
			end
		end
		player.are = entrydl
		player.chain = 0
	end
end
resettime = 300
winner = "none"
function cleopatra_update(dt)
frames = frames + (dt*60)
	while frames > 1 do
	frameticks = frameticks + 1
	updateplayer(p1)
	updateplayer(p2)
	frames = frames - 1
	end
end
spriterelative = {{0,0,1,0,1}}
function stabo()
	spriterelative = {{0,0,1,0,1}}
end
function stakpis(x,y,scale,rot,scaley)
	table.insert(spriterelative,{x,y,scale or 1,rot or 0,scaley or scale or 1})
end
function stakpanvas(x,y,scale,rot,scaley)
	table.insert(spriterelative,{x,y,scale or 1,rot or 0,scaley or scale or 1})
end
function unstakpis(x,y)
	table.remove(spriterelative)
end
function rotatearoundpoint(x,y,px,py,rt)
	local rx = x - px
	local ry = y - py
	ax = (math.cos(rt)*rx)-(math.sin(rt)*ry)
	ay = (math.sin(rt)*rx)+(math.cos(rt)*ry)
	ax = px + ax
	ay = py + ay
	return ax, ay
end
function drawsprite(image,x,y,cx,cy,sx,sy,rt)
	love.graphics.push()
	tarx = 0
	tary = 0
	tarscalx = 1
	tarscaly = 1
	tarsrot = 0
	for _,p in pairs(spriterelative) do
	tarx,tary = rotatearoundpoint(tarx+(p[1]*tarscalx),tary+(p[2]*tarscaly),tarx,tary,tarsrot)
	tarsrot = tarsrot + p[4]
	tarscalx = tarscalx * p[3]
	tarscaly = tarscaly * p[5]
	end
	tarx,tary = rotatearoundpoint(tarx+(x*tarscalx),tary+(y*tarscaly),tarx,tary,tarsrot)
	tarsrot = tarsrot + (rt or 0)
	tarscalx = tarscalx * sx
	tarscaly = tarscaly * sy
	love.graphics.translate(tarx,tary)
	love.graphics.rotate(tarsrot)
	love.graphics.scale(tarscalx, tarscaly)
	love.graphics.draw(image or errored, -cx, -cy)
	love.graphics.pop()
end
function drawpiece(piecetyperr,x,y,size,color,player)
	if not piecetyperr then return end
	for pies2 = 1 ,3 do
		for pies1 = 1 ,3 do
			if piecetyperr[pies2][pies1] ~= nil then
	love.graphics.push()
	tarx = 0
	tary = 0
	tarscalx = 1
	tarscaly = 1
	tarsrot = 0
	for _,p in pairs(spriterelative) do
	tarx,tary = rotatearoundpoint(tarx+(p[1]*tarscalx),tary+(p[2]*tarscaly),tarx,tary,tarsrot)
	tarsrot = tarsrot + p[4]
	tarscalx = tarscalx * p[3]
	tarscaly = tarscaly * p[5]
	end
	tarx,tary = rotatearoundpoint(tarx+((x+((pies1-1)*(32*size)))*tarscalx),tary+((y+((pies2-1)*(32*size)))*tarscaly),tarx,tary,tarsrot)
	tarsrot = tarsrot + (rt or 0)
	tarscalx = tarscalx * size
	tarscaly = tarscaly * size
	love.graphics.translate(tarx,tary)
	love.graphics.rotate(tarsrot)
	love.graphics.scale(tarscalx, tarscaly)
	pcall(function()piecetyperr[pies2][pies1][2].Draw(0,0,color,1,string.sub(piecetyperr[pies2][pies1][1],3,-1),false,piecetyperr[pies2][pies1][3],nil,nil,player)end)
	love.graphics.pop()
			end
		end
	end
end
function drawplayer(player,x,y,size)
	stakpis(x-160,y-240,size,0,size)
	if player.perfectclearframes > 0 then
		local sizexsize = 1
		if player.perfectclearframes > 90 then
			sizexsize = (120-player.perfectclearframes)/30
		end
		if player.perfectclearframes <= 30 then
			sizexsize = (player.perfectclearframes)/30
		end
		drawsprite(perfectclearboard,160,240,80,160,sizexsize,sizexsize)
	end
	for boardgridy = 12,25 do
		for boardgridx = 1,7 do
			if player.board[boardgridy][boardgridx] ~= nil then
				--drawsprite(pieceimagetype[player.board[boardgridy][boardgridx]], 160+(boardgridx*16)-(88), 240+(boardgridy*16)-((88+320+80)),8,8,1,1)
	love.graphics.push()
	tarx = 0
	tary = 0
	tarscalx = 1
	tarscaly = 1
	tarsrot = 0
	for _,p in pairs(spriterelative) do
	tarx,tary = rotatearoundpoint(tarx+(p[1]*tarscalx),tary+(p[2]*tarscaly),tarx,tary,tarsrot)
	tarsrot = tarsrot + p[4]
	tarscalx = tarscalx * p[3]
	tarscaly = tarscaly * p[5]
	end
	tarx,tary = rotatearoundpoint(tarx+(((boardgridx*32)+16)*tarscalx),tary+(((boardgridy*32)-384)*tarscaly),tarx,tary,tarsrot)
	tarsrot = tarsrot + (rt or 0)
	love.graphics.translate(tarx,tary)
	love.graphics.rotate(tarsrot)
	love.graphics.scale(tarscalx, tarscaly)
				pcall(function()player.board[boardgridy][boardgridx][2].Draw(0,0,{r=162/255,g=219/255,b=212/255},1,string.sub(player.board[boardgridy][boardgridx][1],3,-1),false,player.board[boardgridy][boardgridx][3],boardgridx,boardgridy,player)end)
	love.graphics.pop()
			end
		end
	end
	for _,pry in pairs(player.particlefordeadpieces) do
				--drawsprite(pieceimagetype[player.board[boardgridy][boardgridx]], 160+(boardgridx*16)-(88), 240+(boardgridy*16)-((88+320+80)),8,8,1,1)
	love.graphics.push()
	tarx = 0
	tary = 0
	tarscalx = 1
	tarscaly = 1
	tarsrot = 0
	for _,p in pairs(spriterelative) do
	tarx,tary = rotatearoundpoint(tarx+(p[1]*tarscalx),tary+(p[2]*tarscaly),tarx,tary,tarsrot)
	tarsrot = tarsrot + p[4]
	tarscalx = tarscalx * p[3]
	tarscaly = tarscaly * p[5]
	end
	tarx,tary = rotatearoundpoint(tarx+(((pry[4]*32)+16)*tarscalx),tary+(((pry[5]*32)-384)*tarscaly),tarx,tary,tarsrot)
	tarsrot = tarsrot + (rt or 0)
	love.graphics.translate(tarx,tary)
	love.graphics.rotate(tarsrot)
	love.graphics.scale(tarscalx, tarscaly)
				pcall(function()pry[2].Draw(0,0,{r=162/255,g=219/255,b=212/255},1,string.sub(pry[1],3,-1),true,pry[3],nil,nil,player)end)
	love.graphics.pop()
	end
	--drawsprite(board, 160, 240,88,240,1,1)
	drawsprite(board, 160, 240,144,240,1,1)
	--drawpiece(player.piecequeue[1],0,160-(24),240-(216),1)
	if player.pieceactive then
		drawpiece(player.piececurrent,16+(player.piecex*32),-256-128+(player.piecey*32),1,{r=lerp(1,.5,inverselerp(30,0,player.locktime)),g=lerp(1,.5,inverselerp(30,0,player.locktime)),b=0},player)
	end
    unstakpis()
end
torturex, torturey = 640,480
function love_cleopatra_render()
	pcall(function()
	torturex, torturey = (love.graphics.getWidth() or 640)/640, (love.graphics.getHeight() or 480)/480
	end)
	stabo()
    stakpis(0,0,torturex,0,torturey)
	drawsprite(bg,0,0,0,0,1,1,0)
	drawplayer(p1,160,240,1)
	drawplayer(p2,480,240,1)
	drawpiece(p1.piecequeue[1],320-48,80,.5,{r=.5,g=.5,b=0},p1)
	drawpiece(p2.piecequeue[1],320,80,.5,{r=.5,g=.5,b=0},p2)
	unstakpis()
end
if love and love._version_major then
function reportErrorAndRestart(err)
	local errHandler  = love.errorhandler or love.errhand
	local errMainLoop = errHandler(err)

	repeat until errMainLoop() -- Repeat until the callback returns an exit code.

	-- We can restart the game now.
	love.event.quit( "restart" )
end
function ohnoes(nonononoyoushouldnoterror)
	ita=nonononoyoushouldnoterror
	ite=debug.traceback()
	local function draw()
		if not love.graphics.isActive() then return end
		if not htbfhkblrdgljrhensmrhmvergbehngserv then htbfhkblrdgljrhensmrhmvergbehngserv = 0 end
		htbfhkblrdgljrhensmrhmvergbehngserv = htbfhkblrdgljrhensmrhmvergbehngserv + 1
		love.graphics.origin()
		love.graphics.clear(0, 0, 0)
		love.graphics.setColor(.5,.5,.5)
		if not vksndnhyrsbfugtfsdusdfhsbsdfk then vksndnhyrsbfugtfsdusdfhsbsdfk = love.graphics.newImage("data/tex/criterr0r.png") end
		if not dgrkndrgnirngdghdfghgfhgfh then dgrkndrgnirngdghdfghgfhgfh = love.graphics.newImage("data/tex/criterror.png") end
		for h = -1,math.ceil(love.graphics.getWidth()/230) do
		for hh = -1,math.ceil(love.graphics.getHeight()/230) do
		love.graphics.draw(vksndnhyrsbfugtfsdusdfhsbsdfk,(math.sin((htbfhkblrdgljrhensmrhmvergbehngserv*.025)+((hh-math.floor(htbfhkblrdgljrhensmrhmvergbehngserv/230))*.5))*90)+(h*230),math.fmod(htbfhkblrdgljrhensmrhmvergbehngserv,230)+(hh*230),0,.5,.5)
		end
		end
		love.graphics.setColor(1,1,1)
		love.graphics.draw(dgrkndrgnirngdghdfghgfhgfh,0,0,0,1,1)
		love.graphics.print(ita,20,192)
		love.graphics.print(ite,20,208)
		love.graphics.present()
	end
	return function()
		love.event.pump()
		for e, a, b, c in love.event.poll() do
			if e == "quit" then
				return 1
			elseif e == "keypressed" and a == "escape" then
				return 1
			elseif e == "keypressed" and a == "r" then
				return 1
			end
		end
		draw()
		if love.timer then
			love.timer.sleep(1/60)
		end
	end
end
love.errorhandler=ohnoes
function playersound(player)
	if player.playsound.land then
		player.playsound.land = false
		love.audio.stop(audaauda.land)
		love.audio.play(audaauda.land)
	end
	if player.playsound.gravityland then
		player.playsound.gravityland = false
		love.audio.stop(audaauda.land)
		love.audio.play(audaauda.land)
	end
	if player.playsound.rotatecw then
		player.playsound.rotatecw = false
		love.audio.stop(audaauda.rotate)
		love.audio.play(audaauda.rotate)
	end
	if player.playsound.rotateccw then
		player.playsound.rotateccw = false
		love.audio.stop(audaauda.rotate)
		love.audio.play(audaauda.rotate)
	end
	if player.playsound.covered then
		player.playsound.covered = false
		love.audio.stop(audaauda.covered)
		love.audio.play(audaauda.covered)
	end
	if player.playsound.coverablebreak then
		player.playsound.coverablebreak = false
		love.audio.stop(audaauda.coverablebreak)
		love.audio.play(audaauda.coverablebreak)
	end
	if player.playsound.gembreak then
		player.playsound.gembreak = false
		love.audio.stop(audaauda.gembreak)
		love.audio.play(audaauda.gembreak)
	end
	if player.playsound.coffinbreak then
		player.playsound.coffinbreak = false
		love.audio.stop(audaauda.mummybreak)
		love.audio.play(audaauda.mummybreak)
	end
	if player.playsound.mummybreak then
		player.playsound.mummybreak = false
		love.audio.stop(audaauda.mummybreak)
		love.audio.play(audaauda.mummybreak)
	end
	if player.playsound.chain then
		player.playsound.chain = false
		love.audio.stop(audaauda.chain)
		love.audio.play(audaauda.chain)
	end
	if player.playsound.dead then
		player.playsound.dead = false
		love.audio.stop(audaauda.dead)
		love.audio.play(audaauda.dead)
	end
end
function love.update    (...)
xpcall(cleopatra_update,reportErrorAndRestart,...)
playersound(p1)
playersound(p2)
end
function love.draw      (...)  xpcall(love_cleopatra_render,reportErrorAndRestart,...)  end
end
if game and game["Run Service"] then
game:GetService("RunService").Heartbeat:Connect(function(...)  cleopatra_update(...) roblox_cleopatra_render(...) end)
end