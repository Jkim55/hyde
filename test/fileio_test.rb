require "./lib/fileio"
require './test/test_helper'

class FileioTest < Minitest::Test

  #TODO Test for Edge cases, Change File Paths

  def test_we_can_write_some_files
    assert Fileio.new.class
  end

  # def teardown
  # skip
  #   FileUtils.rm_rf(@file_path) if File.directory?(@file_path)
  # end

  def test_we_can_source_create_tree_structure
    file = Fileio.new
    file.create_source_tree_structure("/Users/colinosborn/Turing/Mod1/Projects/hyde/blah")
  end

  def test_we_can_create_output_files
    file = Fileio.new
    file.create_output_file_structure("/Users/colinosborn/Turing/Mod1/Projects/hyde/blah")
  end

end
