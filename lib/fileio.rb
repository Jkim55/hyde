require 'fileutils'
require 'erb'
require './lib/file_converter'
require 'kramdown'
require 'pry'

class Fileio

  def create_source_tree_structure(filepath)
    if Dir.exist?(filepath)
      result = "Error! Directory #{filepath} already exists."
    else
      date = Time.now.strftime("%Y-%d-%m")

      FileUtils.mkdir_p "#{filepath}/source/css"
      File.write("#{filepath}/source/css/main.css", File.read("./text/maincss.txt"))
      FileUtils.mkdir_p "#{filepath}/source/pages"
      File.write("#{filepath}/source/pages/about.md", File.read("./text/about.txt"))
      FileUtils.mkdir_p "#{filepath}/source/posts"
      File.write("#{filepath}/source/posts/#{date}-welcome-to-hyde.md", File.read("./text/welcome.txt"))
      FileUtils.mkdir_p "#{filepath}/source/"
      File.write("#{filepath}/source/index.md", File.read("./text/index.txt"))
      FileUtils.mkdir_p "#{filepath}/source/layouts"
      File.write("#{filepath}/source/layouts/default.html.erb", File.read("./text/default.txt"))
      FileUtils.mkdir_p "#{filepath}/_output"
      result = "Voila! File structure created!"
    end
    puts "#{result}"
  end

  def build_output_file_structure(filepath)
    FileUtils.mkdir_p "#{filepath}/_output/css"
    FileUtils.cp_r("#{filepath}/source/css/main.css", "#{filepath}/_output/css/main.css" )
    FileUtils.mkdir_p "#{filepath}/_output/pages"
    FileUtils.mkdir_p "#{filepath}/_output/posts"
    FileUtils.mkdir_p "#{filepath}/_output/"
    FileConverter.convert_to_html(filepath)
    FileConverter.inject_erb(filepath)
    # FileUtils.cp_r("#{filepath}/source/layouts/default.html.erb", "#{filepath}/_output/posts )
    result = "Voila! Output files parsed into HTML!"
    puts "#{result}"
  end

end
