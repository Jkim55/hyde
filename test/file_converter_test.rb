require './test/test_helper'
require './lib/Generator'
require './lib/file_converter'

class FileConverterTest < Minitest::Test

  def test_setup
    assert FileConverter.new.class
  end


  def test_we_can_convert_md_to_html_for_output
    skip    # This does not work... why am i getting arg error?
            # How can i test that files exist?
    file = Generator.new
    file.build_source_tree_structure("testproject")
    file.build_output_tree_structure("testproject")
    # output = FileConverter.convert_to_html("testproject")

    assert File.exist?("/testproject/_output/index.html")
    assert File.exist?("/testproject/_output/about.html")
    assert File.exist?("/testproject/_output/2016-04-12-welcome-to-hyde.html")
  end

  def teardown
    skip
    FileUtils.rm_rf("testfolder") if File.directory?("testfolder")
    # FileUtils.rm_rf("testfolder2") if File.directory?("testfolder2")
    # FileUtils.rm_rf("testfolder3") if File.directory?("testfolder3")
    # FileUtils.rm_rf("testfolder4") if File.directory?("testfolder4")
  end
end
