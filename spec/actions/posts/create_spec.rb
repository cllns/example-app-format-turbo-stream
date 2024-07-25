# frozen_string_literal: true

RSpec.describe Bookshelf::Actions::Posts::Create do
  it "works as turbo_stream" do
    response = subject.call({"HTTP_ACCEPT" => "text/vnd.turbo-stream.html"})
    expect(response).to(be_successful)
    expect(response.body.first).to(include("Query has been submitted!"))
    expect(response.headers["Content-Type"]).to(eq("text/vnd.turbo-stream.html; charset=utf-8"))
  end

  it "works as html" do
    response = subject.call({}) # Could set as {"HTTP_ACCEPT" => "text/html"}, but it's the default so not needed
    expect(response).to(be_successful)
    expect(response.body).to(eq(["Query has been submitted!"]))
    expect(response.headers["Content-Type"]).to(eq("text/html; charset=utf-8"))
  end

  it "works as form data" do
    # This fails if `config.actions.formats.add :form, "application/x-www-form-urlencoded"`
    # is removed from config/app.rb
    response = subject.call({"CONTENT_TYPE" => "application/x-www-form-urlencoded"})
    expect(response).to(be_successful)
    expect(response.body).to(eq(["Query has been submitted!"]))
    expect(response.headers["Content-Type"]).to(eq("text/html; charset=utf-8"))
  end

  it "works as form data, with accepts turbo-stream and returns turbo stream" do
    response = subject.call(
      {
        "CONTENT_TYPE" => "application/x-www-form-urlencoded",
        "HTTP_ACCEPT" => "text/vnd.turbo-stream.html"
      }
    )
    expect(response).to(be_successful)
    expect(response.body).to(eq(["Query has been submitted!"]))
    expect(response.headers["Content-Type"]).to(eq("text/vnd.turbo-stream.html; charset=utf-8"))
  end
end
