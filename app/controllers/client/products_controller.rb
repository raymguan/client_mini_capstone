class Client::ProductsController < ApplicationController

  def index
    client_params = {
      search: params[:search],
      price_sort: params[:price_sort]
    }
    response = Unirest.get("http://localhost:3000/api/products", parameters: client_params)
    @products = response.body
    render "index.html.erb"
  end

  def show
    respnse = Unirest.get("http://localhost:3000/api/products/#{params[:id]})")
      @products = response.body
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    products_params = {
      name: params[:name],
      price: params[:price],
      description: params[:description ],
      image_url: params[:image_url]
    }
    product = Unirest.post("http://localhost:3000/api/products", parameters: product_params).body
    flash[:success] = "Product successfully created!"
    redirect_to "/client/products/#{product['id']}"
  end

  def edit
    response = Unirest.get("http://localhost:3000/api/products/#{params[:id]}")
    @product = response.body
    render 'edit.html.erb'
  end

 def update
    products_params = {
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image_url: params[:image_url]
    }
    product = Unirest.patch("http://localhost:3000/api/products/#{params[:id]}", parameters: product_params).body
    flash[:success] = "Product successfully updated!"
    redirect_to "/client/products/#{product['id']}"
  end

  def destroy
    product_id = params[:id]
    response = Unirest.delete("http://localhost:3000/api/products/#{product_id}").body
    flash[:danger] = "Recipe successfully obliterated!"
    redirect_to "/client/products"
  end

end
