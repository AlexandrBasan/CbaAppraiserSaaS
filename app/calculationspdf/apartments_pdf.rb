require "prawn/measurement_extensions"
class ApartmentsPdf < Prawn::Document
  include Rails.application.routes.url_helpers
  include ActionDispatch::Routing::PolymorphicRoutes

  end
