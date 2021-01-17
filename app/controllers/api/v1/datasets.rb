module API
  module V1
    class Datasets < Grape::API
      include API::V1::Concerns::Controller
      before { authenticate_api_call }

      resources :datasets do
       
        desc "List of datasets"
        get "", jbuilder: Datasets.view_path("datasets/index") do
          datasets  = list_scope
          @datasets = paginate(datasets)
        end
        
        desc "Show Dataset"
        params do
          requires :id, type: Integer
        end
        get "/:id", jbuilder: Datasets.view_path("datasets/show") do
          @dataset = Dataset.find(params[:id])
        end

        desc "Delete Dataset"
        params do
          requires :id, type: Integer
        end
        delete "/:id" do
          @dataset = Dataset.find(params[:id])
          @dataset.destroy!
          {}
        end

        desc "Create new Dataset"
        params do
          requires :dataset, type: Hash do
            requires :temperature, type: Float
            requires :recorded_at, type: DateTime
          end
        end
        post "", jbuilder: Datasets.view_path("datasets/show") do
          @dataset = Dataset.create(params[:dataset])
        end

        desc "Get Variance"       
        get "/variance", jbuilder: Datasets.view_path("datasets/show") do
        end
      end
    end
  end
end        