# frozen_string_literal: true

RSpec.describe Bookshelf::Actions::Home::Index do
  it "works as turbo_stream" do
    response = subject.call({"HTTP_ACCEPT" => "text/vnd.turbo-stream.html"})
    expect(response).to(be_successful)
    expect(response.body).to(eq(["Turbo!"]))
    expect(response.headers["Content-Type"]).to(eq("text/vnd.turbo-stream.html; charset=utf-8"))
  end

  it "works as html" do
    response = subject.call({}) # Could set as {"HTTP_ACCEPT" => "text/html"}, but it's the default so not needed
    expect(response).to(be_successful)
    expect(response.body).to(eq(["Turbo!"]))
    expect(response.headers["Content-Type"]).to(eq("text/html; charset=utf-8"))
  end
end
