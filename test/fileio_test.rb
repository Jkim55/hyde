require "./lib/fileio"
require './test/test_helper'

class FileioTest < Minitest::Test

  #TODO Test for Edge cases, Change File Paths
  #TODO Ask about File testing and Iteration 2
  #TODO ARGV -- Grabbing multiple words to form one string title ie, My-juicy-post

  def test_we_can_write_some_files
    assert Fileio.new.class
  end

  # def teardown
  # skip
  #   FileUtils.rm_rf("testingfolder") if File.directory?("testingfolder")
  # end

  def test_we_can_source_create_tree_structure
    skip
    file = Fileio.new
    file.create_source_tree_structure("testingfolder/source")
    assert File.exist?("testingfolder/source")
  end

  def test_we_can_build_output_files
    skip
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

  def test_we_are_copying_css_file_from_source_to_output
    skip # must call build
    file = Fileio.new
    output = file.build_output_file_structure("testingfolder")
    content = File.read("testingfolder/_output/CSS/main.css")
    assert_equal "body {\n background-color: yellow;\n}\n h1 {\n background-color: #00ff00;\n} \n p {\n background-color: 798FB2;\n}", content
  end
end
