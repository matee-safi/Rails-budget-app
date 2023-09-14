class EntitiesController < ApplicationController
  before_action :authenticate_user!

  # GET /entities/new
  def new
    @group = Group.find(params[:group_id])
    @entity = Entity.new
  end

  # POST /entities or /entities.json
  def create
    @group = Group.find(params[:group_id])
    @entity = @group.entities.new(entity_params)
    @entity.author = current_user
    @entity.save

    respond_to do |format|
      if @entity.save
        format.html { redirect_to group_url(@group), notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def entity_params
    params.require(:entity).permit(:name, :amount, :created_at, :group_id)
  end
end
