class PatientsController < ApplicationController

    before_action :set_patient, only: %i[ show edit update destroy ]

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
        if @patient.save
            flash[:notice] = "Post successfully created"
            redirect_to @patient
        else
            render :new, status: :unprocessable_entity   
        end
    end

    def edit
    end

    def update
        if @patient.update(patient_params)
            flash[:notice] = "Update successfully created"
            redirect_to @patient
        else
            render :new, status: :unprocessable_entity
        end  
    end

    def destroy
        @patient.destroy
        redirect_to patients_path, status: :see_other
    end

    def dashboard
        @patients_dashboard = Patient.group_by_day(:created_at).count
    end

   private

   def set_patient
    @patient = Patient.find_by_id(params[:id])
   end

    def patient_params
       params.require(:patient).permit(:name, :age, :height, :weight, :gender)
    end
end
