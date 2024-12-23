class MaintenanceCarServicesController < ApplicationController
  before_action :set_maintenance_car_service, only: %i[ show edit update destroy ]
  before_action :set_car, only: [ :new, :create ]
  before_action :set_is_nested_url, only: [ :new, :edit ]
  before_action :set_car_list, only: [ :new, :edit ]


  # GET /maintenance_car_services or /maintenance_car_services.json
  def index
    @maintenance_car_services = MaintenanceCarService.all

    # Filtrar por estado
    if params[:status].present?
      @maintenance_car_services = @maintenance_car_services.where(status: params[:status])
    end

    # Filtrar por número de placa del auto
    if params[:plate_number].present?
      @maintenance_car_services = @maintenance_car_services.joins(:car).where(cars: { plate_number: params[:plate_number] })
    end
  end

  # GET /maintenance_car_services/1 or /maintenance_car_services/1.json
  def show
  end

  # GET /maintenance_car_services/new
  def new
    if @car
      @maintenance_car_service = MaintenanceCarService.new(car: @car)
    else
      # Si no hay car_id, simplemente creamos el servicio de mantenimiento sin asociarlo a un carro
      @maintenance_car_service = MaintenanceCarService.new
    end
  end

  # GET /maintenance_car_services/1/edit
  def edit
  end

  # POST /maintenance_car_services or /maintenance_car_services.json
  def create
    if @car
      @maintenance_car_service = MaintenanceCarService.new(maintenance_car_service_params.merge(car_id: @car.id))
    else
      @maintenance_car_service = MaintenanceCarService.new(maintenance_car_service_params)
    end

    respond_to do |format|
      if @maintenance_car_service.save
        format.html { redirect_to @maintenance_car_service, notice: "Maintenance car service was successfully created." }
        format.json { render :show, status: :created, location: @maintenance_car_service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance_car_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance_car_services/1 or /maintenance_car_services/1.json
  def update
    puts @maintenance_car_service.inspect
    respond_to do |format|
      if @maintenance_car_service.update(maintenance_car_service_params)
        format.html { redirect_to @maintenance_car_service, notice: "Maintenance car service was successfully updated." }
        format.json { render :show, status: :ok, location: @maintenance_car_service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintenance_car_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance_car_services/1 or /maintenance_car_services/1.json
  def destroy
    @maintenance_car_service.destroy!

    respond_to do |format|
      format.html { redirect_to maintenance_car_services_path, status: :see_other, notice: "Maintenance car service was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_car_service
      @maintenance_car_service = MaintenanceCarService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def maintenance_car_service_params
      params.require(:maintenance_car_service).permit(:description, :date, :status, :car_id)
    end

    def set_car
      if params[:car_id].present?
        @car = Car.find(params[:car_id])
      end
    end

    def set_is_nested_url
      @is_nested_url = request.path.include?("/cars/")
    end

    def set_car_list
      @car_list = Car.all.pluck(:id)
    end
end
