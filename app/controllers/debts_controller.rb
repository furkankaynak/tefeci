class DebtsController < ApplicationController
  # GET /debts
  # GET /debts.json
  def index
    if params[:status]
      @debts = connected_user.debts.find_all_by_status(params[:status])
    else
      @debts = connected_user.debts.all
     end
     
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @debts }
    end
  end
  
  # GET /debts/1
  # GET /debts/1.json
  def show
    @debt = connected_user.debts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @debt }
    end
  end

  # GET /debts/new
  # GET /debts/new.json
  def new
    @debt = Debt.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @debt }
    end
  end

  # GET /debts/1/edit
  def edit
    @debt = connected_user.debts.find(params[:id])
  end

  # POST /debts
  # POST /debts.json
  def create
    @debt = Debt.new(params[:debt])
   
    respond_to do |format|
      if @debt.save
        format.html { redirect_to @debt, notice: 'Kurban olusturuldu.' }
        format.json { render json: @debt, status: :created, location: @debt }
      else
        format.html { render action: "new" }
        format.json { render json: @debt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /debts/1
  # PUT /debts/1.json
  def update
    @debt = connected_user.debts.find(params[:id])
    values = params[:debt]
    respond_to do |format|
      
      if values[:amount].to_i < @debt.amount && values[:status] == "paid"
        values[:amount] = (@debt.amount - values[:amount].to_i).to_s
        values[:status] = "not_paid"
      elsif  values[:amount].to_i > @debt.amount && values[:status] == "paid"
        format.html { render action: "edit" }
        format.json { render json: @debt.errors, status: :unprocessable_entity }
      elsif values[:amount].to_i > @debt.amount && values[:status] == "not_paid"
        values[:amount] = (@debt.amount + values[:amount].to_i).to_s
      else
        
      end
      
      if @debt.update_attributes(values)
        format.html { redirect_to @debt, notice: 'Borc Guncellendi.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @debt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /debts/1
  # DELETE /debts/1.json
  def destroy
    @debt = connected_user.debts.find(params[:id])
    @debt.destroy
    
    redirect_to debts_path(:status => 'not_paid')
  end
end
