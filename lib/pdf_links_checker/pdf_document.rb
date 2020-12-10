require "pdf_links_checker/annotations"
require "pdf_links_checker/links"
require "pdf_links_checker/page"

module PdfLinksChecker
  class PdfDocument
    def initialize(pdf_doc)
      @pdf_doc = pdf_doc
    end

    def links
      pages
        .reduce([]) { |links, page| links.concat(page.links) }
        .then { |links| Links.new(links) }
    end

    private

    def pages
      pdf_doc.pages.map { |page| Page.new(page, Annotations.new(pdf_doc)) }
    end

    attr_reader :pdf_doc
  end
end
