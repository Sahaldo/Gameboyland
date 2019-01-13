--Chargement des images de la map
imgDecor = {}

	imgDecor[0] = love.graphics.newImage("img/fond_sable.png")
	imgDecor[1] = love.graphics.newImage("img/herbe.png")
	imgDecor[2] = love.graphics.newImage("img/terre.png")
--Caractéristique du personnage
boy = {}
	boy.x = 0
	boy.y = 0
	boy.vx = 0
	boy.vy = 0
	boy.speed = 300
	boy.img = love.graphics.newImage("img/perso.png ")
	


function love.load()
--Variables largeur et hauteur
	largeur = love.graphics.getWidth()
	hauteur = love.graphics.getHeight()

--Position du personnage
	boy.y = hauteur/1.1
	
--Réglage de la fenêtre (Icone, titre et dimensions)
	local imgData = love.image.newImageData( "img/icon.png" )
	love.window.setTitle("GameboyLand")
	love.window.setIcon( imgData )
	love.window.setMode(1600, 840)
--La map
	map = {}
		map[1]  = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[2]  = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[3]  = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[4]  = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[5]  = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0}
		map[6]  = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,0,0,0,0}
		map[7]  = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,0,0,0,0}
		map[8]  = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,2,0,0,0,0}
		map[9]  = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,2,2,0,0,0,0}
		map[10] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,2,2,2,0,0,0,0}
		map[11] = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
		map[12] = {2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2}
		map[13] = {2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2}

end

function love.update(dt)
--Controles
	if love.keyboard.isDown("q") then
		boy.x = boy.x - (boy.speed * dt)
	end
	if love.keyboard.isDown("d") then
		boy.x = boy.x +qq (boy.speed * dt)
	end
end

function love.draw()
		
	local colonne 
	local ligne

	for ligne = 0,12 do
	for colonne = 0, 24 do
		love.graphics.draw(imgDecor[map[ligne+1][colonne+1]], colonne*64, ligne*64)
	end
	end

	--Positionnement du vaisseau(angle, point d'origine...)
	love.graphics.draw(boy.img, boy.x, boy.y, 0, 1, 1, 0, 0)

end