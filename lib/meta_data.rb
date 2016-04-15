require 'pry'

class MetaData
  def initialize
    @values_only = values_only
  end

  def self.create_tag_hash(filepath)
    line_two = Dir.glob("#{filepath}/source/**/*.md")
    line_two.each do |lines|
      text = File.read(lines)
      if text.include?("tags:")
        a = (text.split("\n---"))[0].delete("---").strip.split(": ")
        b = a[0]
        c = a[1].delete('"').split(', ')
        tags = Hash.new
        tags[b] = c
        @values_only = tags.values.flatten
      end
    end
    format_name
  end

  def self.format_name
    underscored_words = @values_only.each do |tag|
      tag.gsub!(" ", "_")
    end
    downcased_format = underscored_words.map(&:downcase)
  end
end

 p MetaData.create_tag_hash("testproject")
