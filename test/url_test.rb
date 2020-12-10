require "test_helper"
require 'pdf_links_checker/url'
require 'pdf_links_checker/invalid_link'

describe PdfLinksChecker::URL do
  it 'returns a link uri' do
    link = {:A => { :URI => 'foo' }}
    assert_equal(PdfLinksChecker::URL.new(link).to_s, 'foo')
  end

  it 'handles if a link uri does not exist' do
    begin
    link = {:A => Object.new }
    instance = PdfLinksChecker::URL.new(link)
    instance.to_s

    fail('should not get here')
    rescue PdfLinksChecker::InvalidLink => e
      assert_equal('Invalid Link', e.message)
    else
      fail('should not get here')
    end

    assert_equal instance.invalid?, false
  end
end