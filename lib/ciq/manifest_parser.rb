require "nokogiri"

module Ciq
  class ManifestParser
    XMLNS = { iq: "http://www.garmin.com/xml/connectiq" }

    attr_reader :manifest_filepath

    def parse
      if !File.exists?(manifest_filepath)
        raise Ciq::CiqError.new("Manifest file is not present, expecting #{manifest_filepath}")
      end

      @xml_doc = File.open(manifest_filepath) { |f| Nokogiri::XML(f) }

      app_name = application[:name]
      app_id = application[:id]
      app_type = application[:type]
      supported_products = products

      Manifest.new(app_name, app_id, app_type, supported_products)
    end

    private

    def manifest_filepath
      "manifest.xml"
    end

    def products
      application.xpath("iq:products/iq:product/@id", XMLNS).to_a.map(&:content)
    end

    def application
      @application = @xml_doc.at_xpath("iq:manifest/iq:application", XMLNS)
    end
  end
end
