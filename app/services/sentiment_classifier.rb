require 'java'
require 'lib/SentimentClassifier.jar'
java_import 'SubjectivityClassifier';

class SentimentClassifier 
	def self.players_classifier
		classifier = SubjectivityClassifier.new
		classifier.makeClassificationJson("jogadores-subjetividade-NB.model", 
			"jogadores-polaridade-SVM.model", "entrada.json", "saida.json");
	end

	def self.squads_classifier
		classifier = SubjectivityClassifier.new
		classifier.makeClassificationJson("selecao-subjetividade-NB.model",
			"selecao-polaridade-SVM.model", "entrada.json", "saida.json");
	end
end