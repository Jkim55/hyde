require 'fileutils'
require 'erb'
require './lib/file_converter'
# require './lib/event_manager'
require './lib/meta_data'
require 'kramdown'
require 'pry'

class Generator
  def build_source_tree_structure(filepath)
    if Dir.exist?(filepath)
      result = "Error! Directory #{filepath} already exists."
    else
      generate_source_folders(filepath)
      generate_source_files(filepath)
      result = "Voila! File structure generated!"
    end
    puts "#{result}"
  end

  def generate_source_folders(filepath)
    FileUtils.mkdir_p "#{filepath}/source/"
    FileUtils.mkdir_p "#{filepath}/source/css"
    FileUtils.mkdir_p "#{filepath}/source/pages"
    FileUtils.mkdir_p "#{filepath}/source/posts"
    FileUtils.mkdir_p "#{filepath}/source/layouts"
    FileUtils.mkdir_p "#{filepath}/_output"
  end

  def generate_source_files(filepath)
    date = Time.now.strftime("%Y-%d-%m")
    File.write("#{filepath}/source/css/main.css", File.read("./text/maincss.txt"))
    File.write("#{filepath}/source/pages/about.md", File.read("./text/about.txt"))
    File.write("#{filepath}/source/posts/#{date}-welcome-to-hyde.md", File.read("./text/welcome.txt"))
    File.write("#{filepath}/source/index.md", File.read("./text/default.txt"))
    File.write("#{filepath}/source/layouts/default.html.erb", File.read("./text/default.txt"))
  end


  def build_output_tree_structure(filepath)
    create_output_folders(filepath)
    copy_source_files_to_output(filepath)
    MetaData.create_tag_hash(filepath)
    MetaData.tag_file_name_gather(filepath)
    FileConverter.convert_to_html(filepath)
    FileConverter.reformat(filepath)

    result = "Voila! Output files parsed into HTML!"
    puts "#{result}"
  end

  def create_output_folders(filepath)
    FileUtils.mkdir_p "#{filepath}/_output/css"
    FileUtils.mkdir_p "#{filepath}/_output/pages"
    FileUtils.mkdir_p "#{filepath}/_output/tags"
    FileUtils.mkdir_p "#{filepath}/_output/posts"
    FileUtils.mkdir_p "#{filepath}/_output/"
  end

  def copy_source_files_to_output(filepath)
    FileUtils.cp_r("#{filepath}/source/css/main.css", "#{filepath}/_output/css/main.css" )
  end
end
