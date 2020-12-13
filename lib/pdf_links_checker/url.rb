require "pdf_links_checker/invalid_link"
require "uri"
require "net/http"

module PdfLinksChecker
  class URL
    def initialize(pdf_link)
      @pdf_link = pdf_link
    end

    def invalid?
      begin
        uri = to_s
      rescue PdfLinksChecker::InvalidLink => e
        return false
      end

      url = URI.parse(uri)
      req = Net::HTTP.new(url.host, url.port)
      req.use_ssl = true if uri.include?("https")

      begin
        res = req.request_head(url.path)
        return true if res.code == "404"
      rescue StandardError => e
        return true
      end

      false
    end

    def to_s
      a = pdf_link[:A]
      raise PdfLinksChecker::InvalidLink.new('Invalid Link') unless a.respond_to?(:key?) && a.key?(:URI)
      a[:URI]
    end

    private

    attr_reader :pdf_link
  end
end
