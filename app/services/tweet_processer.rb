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

    processed_tweet.gsub!('.', '')
    processed_tweet.gsub!(',', '')
    processed_tweet.gsub!('"', '')
    processed_tweet.downcase!

    self.entities.each do |ent|
	    if processed_tweet.include? ent.downcase
	    	processed_tweet.gsub!(ent.downcase + ' ', 'searchstring ')
	    	processed_tweet.gsub!(ent.downcase + '?', 'searchstring ?')
	    	processed_tweet.gsub!(ent.downcase + '!', 'searchstring !')
	    end
    end

    processed_tweet
	end

	def self.entities_contained_in_tweets(entities, text, is_squad)
		entities_array = []
		entities.each do |entity|
			if is_squad
				self.world_cup_related_strings.each do |word|
					if text.downcase.include?(entity.name.downcase + " " + word.downcase)
						entities_array << entity if text.downcase.include? entity.name.downcase
					end
				end
			else
				entities_array << entity if text.downcase.include? entity.name.downcase
			end

		end
		entities_array
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
			nunca
			surpreendeu
			é
			foi
			está
			será
			perdeu
			ganhou
			jogou
			não
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