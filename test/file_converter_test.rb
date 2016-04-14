require './test/test_helper'
require './lib/fileio'
require './lib/file_converter'

class FileConverterTest < Minitest::Test

  def test_setup
    assert FileConverter.new.class
  end

# How to test that it exists
  def test_we_can_convert_md_to_html_for_output
    file = Fileio.new
    file.build_source_tree_structure("testproject")
    file.build_output_tree_structure("testproject")
    # output = FileConverter.convert_to_html("testproject")

    assert_equal File.exist?("/testproject/output/index.html")
    assert_equal File.exist?("/testproject/output/about.html")
    assert_equal File.exist?("/testproject/output/2016-04-12-welcome-to-hyde.html")
  end
end
