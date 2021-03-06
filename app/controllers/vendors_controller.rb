class VendorsController < ApplicationController
  def index
    @vendors = Vendor.order(name: :asc)
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def products
    @vendor = Vendor.find(params[:id])
  end

  def sales
    @vendor = Vendor.find(params[:id])
  end

  # methods for making a NEW (not yet existing) Vendor
  def new
    # give them a shell and invite them to fill out the data.  Allows introspection into the object in the view!
    @vendor = Vendor.new
    @market_name = Market.find(params[:market_id]).name
  end

  def create
    @vendor = Vendor.new(vendor_create_params[:vendor])
    #any validation?
    if @vendor.save
      redirect_to root_path
    else
      render :new
    end
  end

  # methods for updating a Vendor that already EXISTS
  def edit
    @vendor = Vendor.find(params[:id])
    @market_name = Market.find(@vendor.market_id).name
  end

  def update
    @vendor = Vendor.update(params[:id], vendor_edit_params[:vendor])

    if @vendor.save
      redirect_to root_path
    else
      render :edit
    end
  end

  # delete a Vendor
  def destroy
    @vendor = Vendor.delete(params[:id]) # need a private method?
    redirect_to root_path
  end

  private
  def vendor_create_params
    params.permit(vendor: [:name, :no_employees])
  end

  def vendor_edit_params
    params.permit(vendor: [:name, :no_employees])
  end
end
