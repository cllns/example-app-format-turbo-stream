# frozen_string_literal: true

module Bookshelf
  module Actions
    module Home
      class Index < Bookshelf::Action
        def handle(request, response)
          response.body = "
            Turbo?
            <form action=\"/posts\" method=\"POST\">
              <input type=\"submit\">
            </form>
          "
        end
      end
    end
  end
end
