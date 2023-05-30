# frozen_string_literal: true

require 'pathname'
require 'set'
require 'json'

class TextAnalyzer
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
        # line_words.map!{ |word| Stemma::stem_word(word) } if @lemmatize
        words.concat(line_words)
      end
    end
    words
  end
end
