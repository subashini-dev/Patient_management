class PatientsController < ApplicationController

    def index
        @patients = Patient.all
    end

    def show
        @patient = Patient.find(params[:id])
    end

    def new
        @patient = Patient.new
    end

    def create
        @patient = Patient.new(patient_params)
        flash[:notice] = "Post successfully created"
        if @patient.save
            redirect_to @patient
        else
            render :new, status: :unprocessable_entity   
        end
    end

    def edit
        @patient = Patient.find(params[:id])
    end

    def update
        @patient = Patient.new(patient_params)
        flash[:notice] = "Update successfully created"
        if @patient.update(patient_params)
            redirect_to @patient
        else
            render :new, status: :unprocessable_entity
        end  
    end

    def destroy
        @patient = Patient.find(params[:id])
        @patient.destroy
    
        redirect_to patients_path, status: :see_other
    end

    def dashboard
        @patients_dashboard = Patient.group_by_day(:created_at).count
    end

   private

    def patient_params
       params.require(:patient).permit(:name, :age, :height, :weight, :gender)
    end
end
