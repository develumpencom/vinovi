class ListsController < ApplicationController
  def index
    @lists = Current.user.lists
  end

  def new
    @list = Current.user.lists.new
  end

  def create
    @list = Current.user.lists.new(list_params)

    if @list.save
      redirect_to lists_path, notice: "List was added successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.expect(list: [ :name ])
  end
end
