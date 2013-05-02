class VictimsController < ApplicationController
  # GET /victims
  # GET /victims.json
  def index
    @victims = connected_user.victims.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @victims }
    end
  end

  # GET /victims/1
  # GET /victims/1.json
  def show
    @victim = connected_user.victims.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @victim }
    end
  end

  # GET /victims/new
  # GET /victims/new.json
  def new
    @victim = Victim.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @victim }
    end
  end

  # GET /victims/1/edit
  def edit
    @victim = connected_user.victims.find(params[:id])
  end

  # POST /victims
  # POST /victims.json
  def create
    @victim = Victim.new(params[:victim])
  
    respond_to do |format|
      if @victim.save
        format.html { redirect_to @victim, notice: 'Yeni kurban olusturuldu.' }
        format.json { render json: @victim, status: :created, location: @victim }
      else
        format.html { render action: "new" }
        format.json { render json: @victim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /victims/1
  # PUT /victims/1.json
  def update
    @victim = connected_user.victims.find(params[:id])

    respond_to do |format|
      if @victim.update_attributes(params[:victim])
        format.html { redirect_to @victim, notice: 'Victim was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @victim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /victims/1
  # DELETE /victims/1.json
  def destroy
    @victim = connected_user.victims.find(params[:id])
    @victim.destroy

    respond_to do |format|
      format.html { redirect_to victims_url }
      format.json { head :no_content }
    end
  end
end
