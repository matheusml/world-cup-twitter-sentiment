#encoding: utf-8

class TweetProcesser
	def self.preprocess(text)
		username_regex = /@([a-z0-9_]+)/i
		url_regex = /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/

		tweet_array = text.split(" ")
    processed_tweet = String.new
    tweet_array.each do |token|
      if self.stop_words.include?(token.downcase)
        processed_tweet += "stopword "
      elsif username_regex.match(token)
        processed_tweet += "username "
      elsif url_regex.match(token)
        processed_tweet += "url "
      else
        processed_tweet += "#{token} "
      end
    end

    processed_tweet.downcase!
    self.entities.each do |ent|
	    if processed_tweet.include? ent.downcase
	    	processed_tweet.gsub!(ent.downcase, 'searchstring ')
	    end
    end

    processed_tweet
	end

	def self.keep_tweet?(text, entities, is_squad)
		if is_squad
			entities.each do |entity|
				self.world_cup_related_strings.each do |word|
					if text.downcase.include?(entity.downcase + " " + word.downcase)
						return true
					end
				end
			end

			false
		else
			true
		end		
	end

	def self.entities
		entities = []
		Player.all.each do |p|
			entities << p.name
		end
		Squad.all.each do |s|
			entities << s.name
		end
		entities
	end

	def self.world_cup_related_strings
		%W{
			é
			foi
			está
			será
			perdeu
			perde
			ganhou
			ganha
			jogou
			joga
			não
			empatou
			empata
			arrebentou
			arrebenta
			mandoumanda
			venceu
			vence
			vai
			vem		
		}
	end

	
	def self.stop_words
		stop_words = %w{
		  de
		  a
		  o
		  que
		  e
		  eh
		  do
		  da
		  em
		  um
		  para
		  pra
		  pois
		  com
		  nao
		  uma
		  os
		  no
		  se
		  na
		  por
		  mais
		  as
		  dos
		  como
		  mas
		  foi
		  ao
		  ele
		  das
		  tem
		  seu
		  sua
		  ou
		  ser
		  quando
		  muito
		  ha
		  nos
		  ja
		  esta
		  eu
		  tambem
		  so
		  pelo
		  pela
		  ate
		  isso
		  ela
		  entre
		  era
		  depois
		  sem
		  mesmo
		  aos
		  ter
		  seus
		  quem
		  nas
		  me
		  esse
		  eles
		  estao
		  voce
		  tinha
		  foram
		  essa
		  num
		  nem
		  suas
		  meu
		  minha
		  numa
		  pelos
		  elas
		  havia
		  seja
		  qual
		  sera
		  tenho
		  lhe
		  deles
		  essas
		  esses
		  pelas
		  este
		  fosse
		  dele
		  tu
		  te
		  voces
		  vos
		  lhes
		  meus
		  minhas
		  teu
		  tua
		  teus
		  tuas
		  nosso
		  nossa
		  nossos
		  nossas
		  dela
		  delas
		  esta
		  estes
		  estas
		  aquele
		  aquela
		  aqueles
		  aquelas
		  isto
		  aquilo
		  daquilo
		  estou
		  esta
		  estamos
		  estao
		  estive
		  esteve
		  estivemos
		  estiveram
		  estava
		  estavamos
		  estavam
		  estivera
		  estiveramos
		  esteja
		  estejamos
		  estejam
		  estivesse
		  estivessemos
		  estivessem
		  estiver
		  estivermos
		  estiverem
		  hei
		  ha
		  havemos
		  hao
		  houve
		  houvemos
		  houveram
		  houvera
		  houveramos
		  haja
		  hajamos
		  hajam
		  houvesse
		  houvessemos
		  houvessem
		  houver
		  houvermos
		  houverem
		  houverei
		  houvera
		  houveremos
		  houverao
		  houveria
		  houveriamos
		  houveriam
		  sou
		  somos
		  sao
		  era
		  eramos
		  eram
		  fui
		  foi
		  fomos
		  foram
		  fora
		  foramos
		  seja
		  sejamos
		  sejam
		  fosse
		  fossemos
		  fossem
		  for
		  formos
		  forem
		  serei
		  sera
		  seremos
		  serao
		  seria
		  seriamos
		  seriam
		  tenho
		  tem
		  temos
		  tinha
		  tinhamos
		  tinham
		  tive
		  teve
		  tivemos
		  tiveram
		  tivera
		  tiveramos
		  tenha
		  tenhamos
		  tenham
		  tivesse
		  tivessemos
		  tivessem
		  tiver
		  tivermos
		  tiverem
		  terei
		  tera
		  teremos
		  terao
		  teria
		  teriamos
		  teriam
		}
	end
end