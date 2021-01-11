class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'トレーニング' },
    { id: 3, name: 'ウォーキング' },
    { id: 4, name: '勉強' },
    { id: 5, name: '健康・美容' },
    { id: 6, name: '家事・仕事' }
  ]

  include ActiveHash::Associations
  has_many :tweets
end
