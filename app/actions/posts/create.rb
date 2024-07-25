# frozen_string_literal: true

module Bookshelf
  module Actions
    module Posts
      class Create < Bookshelf::Action
        def handle(request, response)
          response.body = "Query has been submitted!"
        end
      end
    end
  end
end
