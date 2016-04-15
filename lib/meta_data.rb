require 'pry'

class MetaData
  def initialize
    all_tag_hashes = {}
  end

  def self.create_tag_hash(filepath)
    line_two = Dir.glob("#{filepath}/source/**/*.md")
    until line_two.empty?
      line_two.each do |lines|
        text = File.read(lines)
        if text.include?("tags:")
          a = (text.split("\n---"))[0].delete("---").strip.split(": ")
          b = a[0]
          c = a[1].split(', ')
          tags = Hash.new
          tags[b] = c
          @values_only = tags.values.flatten
        end
      end
      line_two.pop
      format_name  # snake_cased & downcased array
      tag_file_name_gather(filepath)
      # format_name.each do |tag|
        # t = {:t@values_onlyag =>"link"}
      end
      # hash_tag = {}
      # create me a new hash for every tag and assign filepath as value
      # merge in key => val pair into all_tag_hash
    end
  # outside this loop method:
  # all_tag_hash will collect every single key-val pair for every post created
  # define a seperate method that will merge key_val pairs with the same key name within a hash (name of hash is key name)
    # if hash with key name does not exist, create new hash
    # if hash with key name exists, then take key-val and add to existing hash for that key

  def self.format_name
    underscored_words = @values_only.each do |tag|
      tag.gsub!(" ", "_")
    end
    downcased_format = underscored_words.map(&:downcase)
  end

  def self.tag_file_name_gather(filepath)
    unless format_name.empty?
    format_name.each do |tag_name|
      File.write("#{filepath}/_output/tags/#{tag_name}.html", "#{tag_name}")
      end
    end
  end
end
  # def self.link_to_post(filepath)
  #   .each do |tag|
  #     File.write("#{filepath}/_output/tags/#{tag_name}.html", )
