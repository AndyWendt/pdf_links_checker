require "pdf_links_checker/annotations"
require "pdf_links_checker/links"
require "pdf_links_checker/page"
require "pdf-reader"

module PdfLinksChecker
  class PdfDocument
    def self.from(file_path)
      path = File.expand_path(file_path)
      doc = PDF::Reader.new(path)

      self.new(doc)
    end

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
