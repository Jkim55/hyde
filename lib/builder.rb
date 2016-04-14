class Builder
  attr_accessor :title, :body

  def initialize(title, body)
    @title = title
    @body = body
  end

  def self.execute
    format_title
    format_body
  end

  def format_title
    title = "<title>#{title}</title>"
  end

  def format_body
    body = "<body>#{body}</body>"
  end
end
