require 'pry'
require 'fileutils'
require 'kramdown'

class FileConverter
  def self.convert_to_html(filepath)
    # binding.pry
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

  def self.reformat(filepath)
      this = Dir.glob("#{filepath}/_output/**/*.html")
      this.each do |files|
        content = File.read(files)
        erb = ERB.new(File.read("#{filepath}/source/layouts/default.html.erb")).result(binding)
        File.write(files, erb)
      end
    end
end
