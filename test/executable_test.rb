# frozen_string_literal: true

require "test_helper"

describe "pdf link checker" do
  it "checks pdf links" do
    path = File.expand_path("exe/pdf_links_checker")
    output = `bundle exec #{path} test/test.pdf`
    _(output).must_include "Working links: 1 of 2"
    _(output).must_include "https://not-a-chance-that-this-is-a-working-link.com/"
  end
end
