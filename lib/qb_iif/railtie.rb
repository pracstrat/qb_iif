require 'rails'

module QbIif
  class Railtie < ::Rails::Railtie
    initializer 'qb_iif' do
      ::ActiveSupport.on_load(:action_view) do
        unless ::Mime::Type.lookup_by_extension(:iif)
          ::Mime::Type.register "application/qbooks", :iif,
            %w(application/qbookspro text/iif)
        end

        require 'qb_iif/rails/template_handler'
        require 'qb_iif/rails/renderer'
      end
    end
  end
end
