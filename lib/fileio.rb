require 'fileutils'
require 'pry'

class Fileio

  def create_new_tree_structure(filename)
    if Dir.exist?(filename)
      result = "Error! Directory #{filename} already exists."
    else
      FileUtils.mkdir_p '/Users/colinosborn/Turing/Mod1/Projects/hyde/source/css'
      FileUtils.touch '/Users/colinosborn/Turing/Mod1/Projects/hyde/source/css/main.css'
      FileUtils.mkdir_p '/Users/colinosborn/Turing/Mod1/Projects/hyde/source/pages'
      FileUtils.touch '/Users/colinosborn/Turing/Mod1/Projects/hyde/source/pages/about.markdown'
      FileUtils.mkdir_p '/Users/colinosborn/Turing/Mod1/Projects/hyde/source/posts'
      FileUtils.touch '/Users/colinosborn/Turing/Mod1/Projects/hyde/source/posts/2016-04-12-welcome-to-hyde.markdown'
      FileUtils.mkdir_p '/Users/colinosborn/Turing/Mod1/Projects/hyde/source/'
      FileUtils.touch '/Users/colinosborn/Turing/Mod1/Projects/hyde/source/index.markdown'
      FileUtils.mkdir_p '/Users/colinosborn/Turing/Mod1/Projects/hyde/_output'
      result = "Voila! File structure created!"
    end
    puts "#{result}"
  end

end











# FileUtils.mkdir_p("/source", options)
# # Dir.mkdir(filename)
# # Dir.mkdir(filename + "/_output")
# # Dir.mkdir(filename + "/source")
# # # make_sub_folders(filename + "/source")
# # make_starting_files(filename + "/source")
