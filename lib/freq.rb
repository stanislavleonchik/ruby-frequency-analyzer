require "freq/version"
require_relative '../lib/logic'

module Freq
  class Error < StandardError; end
  def self.hello
    'Hello world!'
  end
  '5. Частотный анализ текстовых файлов.
 На вход подается путь к папке с файлами в формате .txt.
 Нужно считать данные из всех файлов и вернуть список встречающихся в файлах слов,
 указав для каждого слова количество вхождений. Нужно сделать настройки для работы модуля:
 стоп-лист слов (слова, которые не учитываются при подсчете), проводить ли лемматизацию.'

  def self.analyze(path, stop_list = [], lemmatize = false)
    analyzer = TextAnalyzer.new(path, stop_list, lemmatize)
    analyzer.analyze
    puts JSON.pretty_generate(analyzer.get_word_counts)
  end

end
