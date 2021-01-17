json.datasets @datasets do |dataset|
  json.partial! "v1/datasets/dataset", datasets: dataset
end

json.partial! "v1/shared/meta", collection: @datasets
