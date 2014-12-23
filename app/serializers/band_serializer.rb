class BandSerializer < ActiveModel::Serializer
  attributes :id, :name, :total

  has_many :albums, embed: :ids
end
