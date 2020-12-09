module PdfLinksChecker
  class Page
    def initialize(pdf_page, annotations)
      @pdf_page = pdf_page
      @annotations = annotations
    end

    def links
      find_links
    end

    private

    def find_links
      references = (pdf_page.attributes[:Annots] || [])
      annotations.find(references).flatten.select{ |object| link?(object) }
    end

    def link?(object)
      object[:Type] == :Annot && [:Link].include?(object[:Subtype])
    end

    attr_reader :pdf_page, :annotations
  end
end