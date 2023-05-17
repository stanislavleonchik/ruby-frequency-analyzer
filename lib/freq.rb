require "freq/version"
require 'pathname'
require 'set'
require 'json'
require 'stemma'
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

  def initialize(folder_path, stop_list=[], lemmatize=false)
      @folder_path = folder_path
      @stop_list = Set.new(stop_list)
      @lemmatize = lemmatize
      @word_counts = Hash.new(0)
  end

  def analyze
      path = Pathname.new(@folder_path)
      txt_files = path.children.select{ |file| file.extname == '.txt' }

      txt_files.each do |file|
        words = extract_words(file)
        words.each do |word|
          @word_counts[word] += 1 unless @stop_list.include?(word)
        end
      end

      @word_counts.sort_by{ |word, count| [-count, word] }
  end

  private
  def extract_words(file)
      words = []
      File.open(file, "r:UTF-8") do |f|
        f.each_line do |line|
          line_words = line.downcase.scan(/\w+/)
          line_words.map!{ |word| Stemma::stem_word(word) } if @lemmatize
          words.concat(line_words)
        end
      end
      words
  end

end
