# frozen_string_literal: true

module Bookshelf
  module Actions
    module Home
      class Index < Bookshelf::Action
        format :turbo_stream

        def handle(request, response)
          response.body = "Turbo!"
        end
      end
    end
  end
end
