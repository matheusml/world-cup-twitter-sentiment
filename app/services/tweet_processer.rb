#encoding: utf-8

class TweetProcesser
	def self.preprocess(text)
		username_regex = /@([a-z0-9_]+)/i
		hashtag_regex = /#([a-z0-9_]+)/i

		tweet_array = text.split(" ")
    processed_tweet = String.new
    tweet_array.each do |token|
      if self.stop_words.include?(token.downcase)
        processed_tweet += " "
      elsif token.include?('RT')
        processed_tweet += " "	  
      elsif username_regex.match(token)
        processed_tweet += " "
      elsif hashtag_regex.match(token)
        processed_tweet += " "
      else
        processed_tweet += "#{token} "
      end
    end

    processed_tweet.gsub!('.', '')
    processed_tweet.gsub!(',', '')
    processed_tweet.gsub!('"', '')
    processed_tweet.gsub!('!', '')

    processed_tweet.downcase!

    self.entities.each do |ent|
	    if processed_tweet.include? ent.downcase
	    	processed_tweet.gsub!(ent.downcase + ' ', 'searchstring ')
	    end
    end

    self.remove_latin_caracteres(processed_tweet)
	end

	def self.remove_latin_caracteres(text)
		text.gsub('ç','c').gsub('ã','a').gsub('à','a')
			  .gsub('á','a').gsub('í','i').gsub('ú','u')
			  .gsub('õ','o').gsub('ò','o').gsub('ó','o')
			  .gsub('ẽ','e').gsub('è','e').gsub('é','e')  		  	
  end

	def self.keep_tweet?(text)
		!text.include?('http') && !text.include?('?') && 
		text.length <= 85 
	end

	def self.entities_contained_in_tweets(entities, text)
		entities_array = []
		entities.each do |entity|
			entities_array << entity if text.downcase.include? entity.name.downcase
		end

		entities_array
	end

	def self.tweet_contains_world_cup_related_words?(text, entities)
		entities.each do |entity|
			self.world_cup_related_strings.each do |word|
				if text.downcase.include?(entity.downcase + " " + word.downcase)
					return true
				end
			end
		end

		false
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
			nao
			não
			nunca
			jamais
			surpreendeu
			é
			foi
			está
			será
			perdeu
			ganhou
			jogou
			empatou
			arrebentou
			mandou
			venceu
			vai
			vem		
		}
	end

	
	def self.stop_words
		stop_words = %w{
		  vc
			qnd
			msm
			de
			a
			à
			o
			que
			e
			é
			eh
			do
			da
			em
			um
			para
			pra
			pois
			com
			uma
			os
			no
			se
			na
			por
			mais
			as
			às
			dos
			como
			mas
			foi
			ao
			ele
			das
			tem
			têm
			seu
			sua
			ou
			ser
			quando
			muito
			ha
			há
			nos
			nós
			ja
			já
			esta
			está
			eu
			tambem
			também
			so
			só
			pelo
			pela
			ate
			até
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
			estão
			voce
			você
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
			será
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
			vocês
			vos
			vós
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
			àquele
			àquela
			àqueles
			àquelas
			isto
			aquilo
			daquilo
			estou
			esta
			está
			estamos
			estao
			estão
			estive
			esteve
			estivemos
			estiveram
			estava
			estavamos
			estávamos
			estavam
			estivera
			estiveramos
			esteja
			estejamos
			estejam
			estivesse
			estivessemos
			estivéssemos
			estivessem
			estiver
			estivermos
			estiverem
			hei
			ha
			há
			havemos
			hao
			hão
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
			houverão
			houveria
			houveriamos
			houveríamos
			houveriam
			sou
			somos
			sao
			são
			era
			eramos
			éramos
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
			será
			seremos
			serao
			serão
			seria
			seriamos
			seriam
			tenho
			tem
			têm
			temos
			tinha
			tinhamos
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
			tivéssemos
			tivessem
			tiver
			tivermos
			tiverem
			terei
			tera
			terá
			teremos
			terao
			terão
			teria
			teriamos
			teriam
		}
	end
end