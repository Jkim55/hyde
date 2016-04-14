require 'pry'
require 'fileutils'
require 'kramdown'

class FileConverter
  def self.convert_to_html(filepath)
    markdown = Dir.glob("#{filepath}/source/**/*.md")
    # binding.pry
    markdown.each do |lines|
      current_file = File.read(lines)
      markdown = Kramdown::Document.new(current_file, :auto_ids => false).to_html
      lines.sub!("source","_output")
      File.write(lines, markdown)
      File.rename(lines, lines.split(".")[0] + ".html")
    end
  end

  def self.inject_erb(filepath)
    inject = Dir.glob("#{filepath}/source/**/*.md")
    inject.each do |lines|
      current_file = File.read(lines)
      erb = ERB.new(current_file).result(binding)
      File.write(lines, erb)
    end
  end
end
