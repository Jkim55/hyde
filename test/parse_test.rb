require './test/test_helper'
require './lib/parse'

class ParseTest < Minitest::Test

  def test_setup
    assert Parse.new.class
  end

  def test_we_can_collect_md_files_from_source
    p = Parse.new
    output = p.collect_md("testingfolder")
    assert_equal ["testingfolder/source/index.md",
                  "testingfolder/source/pages/about.md",
                  "testingfolder/source/posts/2016-04-12-welcome-to-hyde.md"], output
  end

  # def test_convert_markdown_to_html
  #   skip
  #   p = Parse.new
  #   output = p.convert_to_html
  #   assert_equal nil, output
  # end

end
