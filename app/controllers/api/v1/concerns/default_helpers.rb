# frozen_string_literal: true
module API::V1
  module Concerns
    module DefaultHelpers
      extend ActiveSupport::Concern
     
      included do
        helpers do  
          def validate_token
            @token ||= begin
              token = headers["X-Authentication-Token"]
              if token.present?
                Token.find_by(auth_token: token)
              end  
            end
          end

          def authenticate_api_call
            raise(APIError.new(400, "Invalid Request", "Invalid Token")) unless validate_token 
          end

          def declared_params
            @declared_params ||= declared(params, include_missing: false)
          end
        end
      end
    end
  end
end
