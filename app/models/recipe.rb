#Placeholder for a model
class Recipe < ActiveRecord::Base

  @@all = []

  attr_accessor :name, :ingredients, :cook_time

  def initialize(name, ingredients, cook_time)
    @name = name
    @ingredients = ingredients
    @cook_time = cook_time
    @@all << self
  end

  def self.all
    @@all
  end

end
