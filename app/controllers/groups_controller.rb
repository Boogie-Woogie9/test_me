class GroupsController < ApplicationController
  before_action :set_group, only: %i[ destroy ]
  before_action :current_group_params, only: %i[ submit_group ]

  def new
    @group = Group.new
  end

  def index
    new()
    @mentor = Mentor.find(current_mentor.id)
    @groups = Group.joins(:groups_mentors)
              .where(groups_mentors: { mentor_id: @mentor.id })
    current_group = @groups.first
    # @students ||= submit_form()
  end 

  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Группа успешно удалена" }
      format.json { head :no_content }
    end
  end

  def submit_form
    @mentor = Mentor.find(current_mentor.id)
    @group = Group.new(group_params)
    @mentor.groups << @group
    if @group.save
      redirect_to groups_path, notice: 'Группа успешно добавлена'
    else
      redirect_to groups_path, notice: 'Ваш аккаунт успешно удален'
    end
  end

  def submit_group
    @current_group = Group.find(current_group_params[:id])
    if !@current_group.nil?
      @students = Student.joins(group: { groups_mentors: :mentor })
        .where(mentors: { id: current_mentor.id }).where(groups: {id: @current_group.id})
    else
      current_group = @groups.first
      @students ||= Student.joins(group: { groups_mentors: :mentor })
                .where(mentors: { id: @mentor.id }).where(groups: {id: current_group.id})
    end 
    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end

  def submit
    selected_group_id = params[:group][:id]
  end
 
  private

  def group_params
    params.require(:group).permit(:group_name)
  end

  def current_group_params
    params.require(:group).permit(:id)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
