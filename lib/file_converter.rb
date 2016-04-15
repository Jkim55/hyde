require 'pry'
require 'fileutils'
require 'kramdown'

class FileConverter
  def self.convert_to_html(filepath)
    markdown = Dir.glob("#{filepath}/source/**/*.md")
    markdown.each do |lines|
      current_file = File.read(lines)
      markdown = Kramdown::Document.new(current_file, :auto_ids => false).to_html
      lines.sub!("source","_output")
      File.write(lines, markdown)
      File.rename(lines, lines.split(".")[0] + ".html")
    end
  end

  def self.reformat(filepath)
    files = Dir.glob("#{filepath}/_output/**/*.html")
    files.each do |file|
      content = File.read(file)
      erb = ERB.new(File.read("#{filepath}/source/layouts/default.html.erb")).result(binding)
      File.write(file, erb)
    end
  end

    def self.title(filepath)
      files = Dir.glob("#{filepath}/_output/**/*.html.erb")
      files.each do |file|
        title = 
      end
    end
end
