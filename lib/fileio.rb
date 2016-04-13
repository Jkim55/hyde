require 'fileutils'
require './lib/file_converter'
require 'kramdown'
require 'pry'

class Fileio

  def create_source_tree_structure(filepath)
    if Dir.exist?(filepath)
      result = "Error! Directory #{filepath} already exists."
    else
      FileUtils.mkdir_p "#{filepath}/source/css"
      File.write("#{filepath}/source/css/main.css", File.read("./text/maincss.txt"))
      FileUtils.mkdir_p "#{filepath}/source/pages"
      File.write("#{filepath}/source/pages/about.md", File.read("./text/about.txt"))
      FileUtils.mkdir_p "#{filepath}/source/posts"
      File.write("#{filepath}/source/posts/2016-04-12-welcome-to-hyde.md", File.read("./text/welcome.txt"))
      FileUtils.mkdir_p "#{filepath}/source/"
      File.write("#{filepath}/source/index.md", File.read("./text/index.txt"))
      FileUtils.mkdir_p "#{filepath}/_output"
      result = "Voila! File structure created!"
    end
    puts "#{result}"
  end

  def build_output_file_structure(filepath)
    FileUtils.mkdir_p "#{filepath}/_output/css"
    # FileUtils.touch "#{filepath}/_output/css/main.css"
    FileUtils.mkdir_p "#{filepath}/_output/pages"
    # FileUtils.touch "#{filepath}/_output/pages/about.html"
    FileUtils.mkdir_p "#{filepath}/_output/posts"
    # FileUtils.touch "#{filepath}/_output/posts/2016-04-12-welcome-to-hyde.html"
    FileUtils.mkdir_p "#{filepath}/_output/"
    # FileUtils.touch "#{filepath}/_output/index.html"
    FileConverter.convert_to_html(filepath)
    result = "Voila! Output files parsed!"
    puts "#{result}"
  end

end
