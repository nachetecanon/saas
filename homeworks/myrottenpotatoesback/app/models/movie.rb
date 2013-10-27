class Movie < ActiveRecord::Base
  def self.all_ratings
    res=Array.new
    self.select('rating').group('rating').order(:rating).each do |t|
      res<< t.rating.to_s
    end
    res
  end
end
