class RightsController < ApplicationController

  def new
    @roles = Role.all
  end

  def create

  end

  def destroy
    right = Right.find(params[:id])
    right.delete
    redirect_to :back
  end

  def edit
    @role = Role.find(params[:id])
    @rights = @role.rights
  end

  def update

  end

  def add_roles
    # return render json: params
    role = Role.find(params[:role])
    if params[:student].present?
      temp = params[:student].keys
      temp.each do |t|
        if role.rights.where("value = ? ", t).empty?
          right = role.rights.new
          right.name = role
          right.value = t
          right.save
        end
      end
    end

    if params[:employee].present?
      temp = params[:employee].keys
      temp.each do |t|
        if role.rights.where("value = ? ", t).empty?
          right = role.rights.new
          right.name = role
          right.value = t
          right.save
        end
      end
    end

    if params[:leave].present?
      temp = params[:leave].keys
      temp.each do |t|
        if role.rights.where("value = ? ", t).empty?
          right = role.rights.new
          right.name = role
          right.value = t
          right.save
        end
      end
    end

    if params[:sattendence].present?
      temp = params[:sattendence].keys
      temp.each do |t|
        if role.rights.where("value = ? ", t).empty?
          right = role.rights.new
          right.name = role
          right.value = t
          right.save
        end
      end
    end

    if params[:eattendence].present?
      temp = params[:eattendence].keys
      temp.each do |t|
        if role.rights.where("value = ? ", t).empty?
          right = role.rights.new
          right.name = role
          right.value = t
          right.save
        end
      end
    end

    if params[:prequest].present?
      temp = params[:prequest].keys
      temp.each do |t|
        if role.rights.where("value = ? ", t).empty?
          right = role.rights.new
          right.name = role
          right.value = t
          right.save
        end
      end
    end

    if params[:fee].present?
      temp = params[:fee].keys
      temp.each do |t|
        if role.rights.where("value = ? ", t).empty?
          right = role.rights.new
          right.name = role
          right.value = t
          right.save
        end
      end
    end

    if params[:subject].present?
      temp = params[:subject].keys
      temp.each do |t|
        if role.rights.where("value = ? ", t).empty?
          right = role.rights.new
          right.name = role
          right.value = t
          right.save
        end
      end
    end

    if params[:grade].present?
      temp = params[:grade].keys
      temp.each do |t|
        if role.rights.where("value = ? ", t).empty?
          right = role.rights.new
          right.name = role
          right.value = t
          right.save
        end
      end
    end

    if params[:transport].present?
      temp = params[:transport].keys
      temp.each do |t|
        if role.rights.where("value = ? ", t).empty?
          right = role.rights.new
          right.name = role
          right.value = t
          right.save
        end
      end
    end

    if params[:bookshop].present?
      temp = params[:bookshop].keys
      temp.each do |t|
        if role.rights.where("value = ? ", t).empty?
          right = role.rights.new
          right.name = role
          right.value = t
          right.save
        end
      end
    end

    if params[:exam].present?
      temp = params[:exam].keys
      temp.each do |t|
        if role.rights.where("value = ? ", t).empty?
          right = role.rights.new
          right.name = role
          right.value = t
          right.save
        end
      end
    end
    redirect_to new_right_path, notice: "Rights Editted Successfully"
  end

end
