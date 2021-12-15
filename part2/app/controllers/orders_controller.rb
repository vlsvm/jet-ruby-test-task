require_relative '../helpers/Package.rb'
class OrdersController < ApplicationController
    def new
        @order = Order.new
    end

    def show
        @order = Order.find(params[:id])
    end

    def create
        package = Package.new(order_params['weight'],order_params['lenght'],order_params['width'],
            order_params['height'],order_params['from'],order_params['to'])

        params = order_params;
        params['price'] = package.price;
        params['distance'] = package.distance;
        @order = Order.new(params)
        if @order.save
          redirect_to @order
        else
          render :new, status: :unprocessable_entity
        end
    end

    private
    def order_params  
        params.require(:order).permit(:first_name, :last_name, :patronymic, :phone_number, :email, 
            :weight, :lenght, :width, :height, :from, :to)
    end
end
