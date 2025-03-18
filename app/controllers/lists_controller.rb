class ListsController < ApplicationController
  before_action :set_list, only: [ :show, :edit, :update, :destroy ]

  def index
    @lists = Current.user.lists
  end

  def show
  end

  def new
    @list = Current.user.lists.new
  end

  def edit
  end

  def create
    @list = Current.user.lists.new(list_params)

    if @list.save
      redirect_to lists_path, notice: "List was added successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @list.update(list_params)
      redirect_to lists_path, notice: "List was updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy

    redirect_to lists_path, notice: "List was deleted successfully"
  end

  private

  def list_params
    params.expect(list: [ :name ])
  end

  def set_list
    @list = Current.user.lists.find(params[:id])
  end
end
