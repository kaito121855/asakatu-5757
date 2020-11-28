class EndMinute < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '00' },
    { id: 3, name: '05' },
    { id: 4, name: 10 },
    { id: 5, name: 15 },
    { id: 6, name: 20 },
    { id: 7, name: 25 },
    { id: 8, name: 30 },
    { id: 9, name: 35 },
    { id: 11, name: 40 },
    { id: 12, name: 45 },
    { id: 13, name: 55 }
  ]

    include ActiveHash::Associations
    has_many :tweets

  end
