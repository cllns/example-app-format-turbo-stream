# frozen_string_literal: true

require "hanami"

module Bookshelf
  class App < Hanami::App
    config.actions.formats.add :html
    config.actions.formats.add :form, "application/x-www-form-urlencoded"
    config.actions.formats.add :turbo_stream, "text/vnd.turbo-stream.html"
  end
end
