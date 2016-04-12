require 'fileutils'
require 'pry'

class Fileio

  def create_source_tree_structure(filepath)
    if Dir.exist?(filepath)
      result = "Error! Directory #{filepath} already exists."
    else
      FileUtils.mkdir_p "#{filepath}/source/css"
      FileUtils.touch "#{filepath}/source/css/main.css"
      FileUtils.mkdir_p "#{filepath}/source/pages"
      FileUtils.touch "#{filepath}/source/pages/about.md"
      FileUtils.mkdir_p "#{filepath}/source/posts"
      FileUtils.touch "#{filepath}/source/posts/2016-04-12-welcome-to-hyde.md"
      FileUtils.mkdir_p "#{filepath}/source/"
      FileUtils.touch "#{filepath}/source/index.md"
      FileUtils.mkdir_p "#{filepath}/_output"
      result = "Voila! File structure created!"
    end
    puts "#{result}"
  end

  def create_output_file_structure(filepath)
    FileUtils.mkdir_p "#{filepath}/_output/css"
    FileUtils.touch "#{filepath}/_output/css/main.css"
    FileUtils.mkdir_p "#{filepath}/_output/pages"
    FileUtils.touch "#{filepath}/_output/pages/about.html"
    FileUtils.mkdir_p "#{filepath}/_output/posts"
    FileUtils.touch "#{filepath}/_output/posts/2016-04-12-welcome-to-hyde.html"
    FileUtils.mkdir_p "#{filepath}/_output/"
    FileUtils.touch "#{filepath}/_output/index.html"
    result = "Voila! Output files parsed!"
    puts "#{result}"
  end

end
