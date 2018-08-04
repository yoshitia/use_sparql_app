
class PersonController < ApplicationController
  def index
		@idol = ImasSparql.all
  end

  def show
  end
end
