# frozen_string_literal: true

module API
  module V1
    class ContactsController < API::BaseController # :nodoc:
      def index
        render json: Contact.all
      end

      def show
        render_jsonapi_response(Contact.find(params[:id]))
      end

      def update
        contact = Contact.find(params[:id])
        contact.update!(permitted_params)
        render_jsonapi_response(contact)
      end

      def block
        contact = Contact.find(params[:id])
        contact.blocked = true
        contact.save

        render_jsonapi_response(contact)
      end

      def unblock
        contact = Contact.find(params[:id])
        contact.blocked = false
        contact.save

        render_jsonapi_response(contact)
      end

      private

      def permitted_params
        params.permit(:notes, :blocked)
      end
    end
  end
end
