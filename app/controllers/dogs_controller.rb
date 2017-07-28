class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end
end
