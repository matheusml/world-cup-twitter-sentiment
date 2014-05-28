require 'java'
require 'lib/SentimentClassifier.jar'
#java_import 'SentimentClassifier';
java_import 'SubjectivityClassifier';

class SentimentClassifier 
	def self.players_classifier
		classifier = SubjectivityClassifier.new
		classifier.makeClassificationJson("jogadores-subjetividade-SVM.model", 
			"jogadores-polaridade-NB.model", "entrada.json", "saida.json");
	end

	def self.squad_classifier
		classifier = SentimentClassifier.new
		classifier.makeClassificationJson("selecao-subjetividade-SVM.model",
			"selecao-polaridade-NB.model", "entrada.json", "saida.json");
	end
end