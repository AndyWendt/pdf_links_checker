module PdfLinksChecker
  class Annotations
    def initialize(pdf_doc)
      @objects = pdf_doc.objects
    end

    def find(references)
      lookup_all(references)
    end

    def lookup_all(refs)
      refs = *refs
      refs.map { |ref| lookup(ref) }
    end

    def lookup(ref)
      object = objects[ref]
      return object unless object.is_a?(Array)

      lookup_all(object)
    end

    private

    attr_reader :objects
  end
end