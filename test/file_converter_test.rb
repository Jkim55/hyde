require './test/test_helper'
require './lib/file_converter'

class FileConverterTest < Minitest::Test

  def test_setup
    assert FileConverter.new.class
  end

  def test_we_can_rewrite_files_to_output_folder
    output = FileConverter.convert_to_html("testingfolder")
    assert_equal ["testingfolder/_output/index.md",
                  "testingfolder/_output/pages/about.md",
                  "testingfolder/_output/posts/2016-04-12-welcome-to-hyde.md"], output
  end
end
