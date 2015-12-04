PageObject::PageFactory.routes = {
    :default => [[HomePage, :select_puppy],
                 [DetailsPage, :add_to_cart],
                 [ShoppingCartPage, :proceed_to_checkout],
                 [CheckOutPage, :checkout]
    ]
}

PageObject::PageFactory.route_data = {
    :default => :default1
}