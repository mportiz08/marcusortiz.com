module Helpers
  def get_snippet(filename)
    path = "public/snippets/#{filename}"
    File.exists?(path) ? open("public/snippets/#{filename}").read : ""
  end
end
