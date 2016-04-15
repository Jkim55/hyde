require './test/test_helper'
require "./lib/meta_data"
require "./lib/generator"


class MetaDataTest < Minitest::Test
  def test_our_md_can_have_tags
    # skip
    file = Generator.new
    file.build_source_tree_structure("testproject")
    content = File.read("testproject/source/posts/2016-14-04-New-Post.md")

    assert content.include?("---\ntags:\n---\n\n#"), content
  end

  def test_our_html_post_has_tags_rendered
    file = Generator.new
    file.build_source_tree_structure("testproject")
    content = File.read("testproject/source/posts/2016-14-04-New-Post.md")

    assert_equal {"tags" => ["Italian Food", "flatbread"]}, MetaData.create_tag_hash("testproject1")
  end
end
