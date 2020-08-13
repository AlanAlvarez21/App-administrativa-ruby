class SalesController < ApplicationController 

def index 
    @ventas = Sale.all
end

def new 
    @venta = Sale.create(importe: 0)
    redirect_to edit_sale_path(@venta)
end 

def edit 
    @productos_venta = @venta.sale_details
end


end 