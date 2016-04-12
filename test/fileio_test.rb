require "./lib/fileio"
require './test/test_helper'

class FileioTest < Minitest::Test

  def test_we_can_write_some_files
    assert Fileio.new.class
  end

  def test_we_create_tree_structure
    file = Fileio.new
    file.create_new_tree_structure("my-sweet-blog")
  end

  # def teardown
  # skip
  #   FileUtils.rm_rf(@file_path) if File.directory?(@file_path)
  # end


end
