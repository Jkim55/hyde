require 'pry'
require 'fileutils'
require 'kramdown'

class Parse

  def self.collect_md(filepath)
    markdown = Dir.glob("#{filepath}/source/**/*.md")
    markdown.each do |lines|
      current_file = File.read(lines)
      markdown = Kramdown::Document.new(current_file, :auto_ids => false).to_html
      lines.sub!("source","_output")
      File.write(lines, markdown)
      File.rename(lines, lines.split(".")[0] + ".html")
    end
  end
end
