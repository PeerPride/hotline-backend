# frozen_string_literal: true

module API
  module V1
    class ContactphonesController < API::BaseController # :nodoc:
      def index
        render json: ContactPhone.all
      end

      def show
        render_jsonapi_response(ContactPhone.find(params[:id]))
      end

      def update
        contactphone = ContactPhone.find(params[:id])
        contactphone.update!(permitted_params)
        render_jsonapi_response(contactphone)
      end

      def reassign
        contactphone = ContactPhone.find(params[:id])
        contactphone.contact_id = params[:contact_id]
        contactphone.save
        render_jsonapi_response(contactphone)
      end

      private

      def permitted_params
        params.permit(:contact_id)
      end
    end
  end
end
