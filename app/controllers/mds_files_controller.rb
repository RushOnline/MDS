class MdsFilesController < ApplicationController
  # GET /mds_files
  # GET /mds_files.json
  def index
    @mds_files = MdsFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mds_files }
    end
  end

  # GET /mds_files/1
  # GET /mds_files/1.json
  def show
    @mds_file = MdsFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mds_file }
    end
  end

  # GET /mds_files/new
  # GET /mds_files/new.json
  def new
    @mds_file = MdsFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mds_file }
    end
  end

  # GET /mds_files/1/edit
  def edit
    @mds_file = MdsFile.find(params[:id])
  end

  # POST /mds_files
  # POST /mds_files.json
  def create
    @mds_file = MdsFile.new(params[:mds_file])

    respond_to do |format|
      if @mds_file.save
        format.html { redirect_to @mds_file, notice: 'Mds file was successfully created.' }
        format.json { render json: @mds_file, status: :created, location: @mds_file }
      else
        format.html { render action: "new" }
        format.json { render json: @mds_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mds_files/1
  # PUT /mds_files/1.json
  def update
    @mds_file = MdsFile.find(params[:id])

    respond_to do |format|
      if @mds_file.update_attributes(params[:mds_file])
        format.html { redirect_to @mds_file, notice: 'Mds file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mds_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mds_files/1
  # DELETE /mds_files/1.json
  def destroy
    @mds_file = MdsFile.find(params[:id])
    @mds_file.destroy

    respond_to do |format|
      format.html { redirect_to mds_files_url }
      format.json { head :no_content }
    end
  end
end
