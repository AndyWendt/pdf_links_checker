require "pdf_links_checker/url"

module PdfLinksChecker
  class Links
    attr_reader :invalid

    def initialize(links_array)
      @urls= links_array.map { |link| PdfLinksChecker::URL.new(link) }
      @invalid = @urls.select { |url| url.invalid? }
    end

    def total_count
      urls.count
    end

    def valid_count
      total_count - invalid.count
    end

    private

    attr_reader :urls
  end
end
