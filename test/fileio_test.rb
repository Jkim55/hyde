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
    file.create_source_tree_structure("testingfolder/source")
    assert File.exist?("testingfolder/source")
  end

  def test_we_can_build_output_files
    file = Fileio.new
    file.build_output_file_structure("testingfolder/_output")
    assert File.exist?("testingfolder/_output")
  end

  def test_we_can_convert_md_to_html
    skip # must call build
    file = Fileio.new
    output = file.build_output_file_structure("testingfolder")
    content = File.read("testingfolder/_output/index.html")
    assert_equal "<h1>Welcome to your new fucking blog!</h1>\n<p>It’s better than word press because, you made that shit!!!</p>\n\n<h1>Pizza</h1>\n", content
  end
end
