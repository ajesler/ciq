class Manifest
  attr_reader :app_name, :app_id, :app_type, :supported_products

  def initialize(app_name, app_id, app_type, supported_products)
    @app_name = app_name
    @app_id = app_id
    @app_type = app_type
    @supported_products = supported_products
  end
end
