class SalesController < ApplicationController
  helper_method :purchase, :redirect
  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    @sale = Sale.find(params[:id])
  end

  # GET /sales/new
  # GET /sales/new.json
  def new
    @sale = Sale.new
  end
  
  def checkout
  end
  # GET /sales/1/edit
  def edit
    @sale = Sale.find(params[:id])
  end

  # POST /sales
  # POST /sales.json
  def create
    x = add(params[:sale])
    @sale = current_user.sales.new(x)
      if @sale.save
        @sale.users << current_user
        @sale.books << Book.find(@sale.book_id)
        @sale.owner_id = current_user.id
        @sale.save
        flash[:success] = "Post created!"
        redirect_to @sale
      else
        render 'new'
      end
    
  end

  # PUT /sales/1
  # PUT /sales/1.json
  def update
    @sale = Sale.find(params[:id])

    respond_to do |format|
      if @sale.update_attributes(params[:sale])
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def purchase
    @sale = Sale.find(params[:id])
    if @sale.charity!= ""
      redirect_to checkout_path
    else
      if @sale.user_id == nil
        @sale.user_id = current_user.id
        @sale.save
        flash[:success] = "Please find the contact details below to purchase this product!"
        redirect_to User.find(@sale.owner_id)
      else
        redirect_to root_path
      end
    end
  end

  def redirect
    redirect_to root_path
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    current_user.sales.find(params[:id]).destroy
    flash[:success] = "Post destroyed"
    redirect_to users_path
  end
end
