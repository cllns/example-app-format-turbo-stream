# frozen_string_literal: true

RSpec.describe Bookshelf::Actions::Home::Index do
  let(:params) { Hash[] }

  it "works" do
    response = subject.call(params)
    expect(response).to(be_successful)
    expect(response.body).to(eq(["Turbo!"]))
    expect(response.headers["Content-Type"]).to(eq("text/vnd.turbo-stream.html; charset=utf-8"))
  end
end
