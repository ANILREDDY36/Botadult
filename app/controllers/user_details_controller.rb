class UserDetailsController < ApplicationController
	def index
		@userdetail = UserDetail.find_or_initialize_by(user_id: current_user.id)
	end
	def show
    @userdetail = current_user.user_detail
	end
	def new
		@userdetail = current_user.build_user_detail
	end
	def edit
	  @userdetails = current_user.user_detail
	end
	def create
	  @userdetails = UserDetail.new(userdetails)
	  @userdetails.user = current_user
    respond_to do |format|
      if @userdetails.save
        format.html { redirect_to user_details_path, notice: 'Userdetails were successfully created.' }
        format.json { render :show, status: :created, location: @userdetails }
        format.js
      else
        format.html { render :new }
        format.json { render json: @userdetails.errors, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

	def update
    @userdetail = current_user.user_detail
    respond_to do |format|
	    if @userdetail.update(userdetails)
	      format.html { redirect_to user_details_path, notice: 'Userdetails were successfully updated.' }
	      format.json { render :show, status: :ok, location: @userdetails }
	    else
	      format.html { render :edit }
	      format.json { render json: @userdetails.errors, status: :unprocessable_entity }
	    end
  	end
  end

	private
		def userdetails
      params.require(:user_detail).permit(:user_name, :birthday, :contact_number, :city, :state, :country, :medical_status_date_checked, :medical_status_result, :medical_status, :proof_type, :proof_type_front, :proof_type_back, :profile)
		end
end
