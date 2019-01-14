love.graphics.setDefaultFilter("nearest")

--Chargement des images de la map
imgDecor = {}

	
	imgDecor[1] = love.graphics.newImage("img/herbe.png")
	imgDecor[2] = love.graphics.newImage("img/terre.png")
	background_grass = love.graphics.newImage("img/bg_Grasslands.png")
--Caractéristique du personnage
boy = {}
	boy.x = 0
	boy.y = 672*2
	boy.vx = 0
	boy.vy = 0
	boy.speed = 500
	boy.ground = boy.y -- ceci fait atterir le personnage sur la plateforme
	boy.jump_height = -300 -- Chaque fois que le personnage saute, il peut atteindre cette hauteur.
  	boy.gravity = -500   -- Chaque fois que le personnage tombe, il descendra à ce rythme.
	boy.img = love.graphics.newImage("img/perso.png ")
	


function love.load()

	-- je charge le son dans le load par exemple
Grasslands_theme = love.audio.newSource("musiques/Grasslands Theme.mp3","stream")
-- "static" charge le son intégralement dans la mémoire
-- "stream" le charge au fur et a mesure qu'il le lit, genre pour une musique
-- et ensuite je le joue
love.audio.play(Grasslands_theme)
Grasslands_theme:setVolume(0.5)
--Variables largeur et hauteur
	largeur = love.graphics.getWidth() * 2
	hauteur = love.graphics.getHeight() * 2
	
--Réglage de la fenêtre (Icone, titre et dimensions)
	local imgData = love.image.newImageData( "img/icon.png" )
	love.window.setTitle("GameboyLand")
	love.window.setIcon( imgData )
	love.window.setMode(1600, 840)
--La map
	map = {}
		map[1]  =  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[2]  =  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[3]  =  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[4]  =  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[5]  =  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[6]  =  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[7]  =  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[8]  =  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[9]  =  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[10] =  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[11] =  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[12]  = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[13]  = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[14]  = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[15]  = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[16]  = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[17]  = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[18]  = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[19]  = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[20]  = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[21]  = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[22]  = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[23]  = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[24]  = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
		map[25] =  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
		map[26] =  {2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2}

end

function love.update(dt)
--Ceci sert à mettre des controles
  if love.keyboard.isDown("d") then --Lorsque le joueur maintient "d" enfoncé
    
    -- Ceci s'assure que le personnage ne passe pas le bord droit de la fenêtre de jeu.
    if boy.x < (love.graphics.getWidth() * 2 - boy.img:getWidth()*1.8) then
    	boy.x = boy.x + (boy.speed * dt) --Le joueur se déplace vers la droite
    end
  elseif love.keyboard.isDown("q") then--Lorsque le joueur maintient "q" enfoncé
    
    -- Ceci s'assure que le personnage ne passe pas le bord gauche de la fenêtre de jeu. 
    if boy.x > 0 then
    boy.x = boy.x - (boy.speed * dt)--Le joueur se déplace vers la gauche
    end
  end
  
  
  -- Ceci est responsable du saut de joueur. 
  
  if love.keyboard.isDown("space") then --Lorsque le joueur maintient "espace" enfoncé
    
    -- Le jeu vérifie si le joueur est au sol. Rappelez - vous que lorsque le joueur est sur le terrain, l' axe Y Vitesse = 0.
    if boy.vy == 0 then
      boy.vy = boy.jump_height -- La vélocité de l'axe Y du joueur est réglée sur sa hauteur de saut. 
    end
  end  
  
  -- Ceci est en charge de la physique du saut.
  if boy.vy ~= 0 then  -- Le jeu vérifie si le joueur a "sauté" et quitté le sol. 
    boy.y = boy.y + boy.vy * dt -- Ceci rend le caractère ascendant / sauté.
    boy.vy = boy.vy - boy.gravity * dt -- Ceci applique la gravité au personnage. 
	end 
  


-- C'est responsable de la collision, en s'assurant que le personnage atterrit sur le sol.
if boy.y > boy.ground then -- Le jeu vérifie si le joueur a sauté.
  boy.vy = 0 -- La vitesse de l'axe des ordonnées est remise à 0, ce qui signifie que le personnage est à nouveau au sol.
  boy.y = boy.ground -- La vélocité de l'axe des ordonnées est remise à 0, ce qui signifie que le personnage est à nouveau au sol.
  end
end

function love.draw()
			
	love.graphics.scale(0.5, 0.5)

	local colonne 
	local ligne

	for ligne = 24,25 do
	for colonne = 0, 49 do
		love.graphics.draw(imgDecor[map[ligne+1][colonne+1]], colonne*64, ligne*64)
	end
	end

	--Positionnement du vaisseau(angle, point d'origine...)
	love.graphics.draw(background_grass, 0, 0,0,3.2,3)
	love.graphics.draw(boy.img, boy.x, boy.y, 0, 2, 2, 0, 0)


end