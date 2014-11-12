class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :band_id, :title
end
