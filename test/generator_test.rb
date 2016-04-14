require "./lib/Generator"
require './test/test_helper'

#TODO Test for Edge cases, Change File Paths
#TODO Ask about File testing and Iteration 2

class GeneratorTest < Minitest::Test
  def test_we_can_write_some_files
    assert Generator.new.class
  end

  def test_we_can_source_create_tree_structure
    file = Generator.new
    file.build_source_tree_structure("testfolder1")
    assert Dir.exist?("testfolder1")
  end

  def test_we_can_build_output_files
    file = Generator.new
    file.build_source_tree_structure("testfolder2")
    file.build_output_tree_structure("testfolder2")
    assert Dir.exist?("testfolder2")
  end

  def test_we_can_convert_md_to_html
    file = Generator.new
    file.build_source_tree_structure("testfolder3")
    file.build_output_tree_structure("testfolder3")
    output = file.build_output_tree_structure("testfolder3")
    content = File.read("testfolder3/_output/index.html")

    assert content.include?("<!DOCTYPE html>\n<html>\n  <head>\n")
  end

  def test_we_are_copying_css_file_from_source_to_output
    file = Generator.new
    file.build_source_tree_structure("testfolder4")
    file.build_output_tree_structure("testfolder4")
    output = file.build_output_tree_structure("testfolder4")
    content = File.read("testfolder4/_output/CSS/main.css")

    assert content.include?("body {\n    background-color: yellow;")
  end

  def teardown
    FileUtils.rm_rf("testfolder1") if File.directory?("testfolder1")
    FileUtils.rm_rf("testfolder2") if File.directory?("testfolder2")
    FileUtils.rm_rf("testfolder3") if File.directory?("testfolder3")
    FileUtils.rm_rf("testfolder4") if File.directory?("testfolder4")
  end
end
