require './test/test_helper'
require "./lib/builder"

class BuilderTest < Minitest::Test

  def test_setup
    assert Builder.new(nil).class
  end

  def test_we_can_store_an_input
    builder = Builder.new("test title")
    assert_equal "test title", builder.title
  end

  def test_we_can_format_our_title_tags
    builder = Builder.new("test title")
    assert_equal "<title>test title</title>", builder.format_title
  end

  def test_we_can_store_body_text
    body = "blaaaaaa bla. I'm a sentence. A simple sentence."
    builder = Builder.new("test title", body)
    assert_equal "blaaaaaa bla. I'm a sentence. A simple sentence.", builder.body
  end

  def test_we_can_format_our_body_tags
    builder = Builder.new("test title", "blaaaaaa bla. I'm a sentence. A simple sentence.")
    assert_equal "<body>blaaaaaa bla. I'm a sentence. A simple sentence.</body>", builder.format_body
  end


end
