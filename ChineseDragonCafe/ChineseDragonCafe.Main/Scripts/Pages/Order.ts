
$(document).ready(function () {
    orderPage.InitiateUIEvents();
    $('#AddItemDiv').show();
});


class OrderPage {

    private ItemListNumber: number = 0;

    //This method will bind all events to the UI components.
    public InitiateUIEvents() {

        $('#AddItemToListBtn').click(function () {
            orderPage.ItemListNumber = orderPage.ItemListNumber + 1;
            orderPage.CloneRow(orderPage.ItemListNumber, $("#itemCode").val(), $("#itemDescription").val(), $("#itemQty").val(), $("#unitPrice").val(), $("#itemID").val());
        });

        $("#itemCode").focusout(function () {
            //if ($(this).val() != null || $(this).val() != "") {
            //    orderPage.GetItemPrice($(this).val());
            //}     

            if ($(this).val().length != 0) {
                orderPage.GetItemPrice($(this).val());
            }
        });

        $('#CloseOrderBtn').click(function () {
            $('#AddItemDiv').hide();
            $('#CloseOrderDev').show();
        });

        $('#CompleteOrderBtn').click(function () {
            orderPage.SaveOrder();
        });

    }

    //Save created oder to the database.
    public SaveOrder() {

        var OrderItemList = [];

        var url = "/API/Order/PlaceOrder";

        $("#newProductRecipe tr").each(function () {

            var ItemID = $(this).find(".itemID").val();
            var Qty = $(this).find(".itemQty").val();

            OrderItemList.push({
                "ID": ItemID,
                "Quantity": Qty
            });
        });

        var param = {
            OrderThrough: $('#SelectOrderThrough').find(":selected").val(),
            OrderType: $('#SelectOrderType').find(":selected").val(),
            OrderItems: OrderItemList
        };

        var data = JSON.stringify(param);

        orderPage.CallAjax(url, data, "POST", orderPage.SaveOrder_Success, orderPage.SaveOrder_Error);
    }

    //Save function success event
    public SaveOrder_Success(data) {
        alert(data);
    }

    //Save function error event
    public SaveOrder_Error(err) {
        console.log(err);
    }

    //Using this method we can clone a html table row (used for the adding items to the order table)
    public CloneRow(Index: number, itemName: string, itemDescription: string, itemQty: number, itemPrice: number, itemID) {
        try {
            var clone = $('#emptyRow').clone();

            $('.itemNumber', clone).text(Index);
            $('.itemCode', clone).text(itemName);
            $('.itemDescription', clone).text(itemDescription);
            $('.itemQty', clone).text(itemQty);
            $('.itemPrice', clone).text((itemQty * itemPrice).toString());
            $('.itemRemove', clone).html('<button onclick="orderPage.RemoveRow(this)" class="btn-link">Remove</button>');

            $('.itemID', clone).text(itemID);

            clone.appendTo("#OrderItemsTable tbody");

            orderPage.ClearFields();
            $("#itemCode").focus();
        } catch (e) {
            console.log(e);
        }
    }

    //remove self row from the order items table
    public RemoveRow(controller) {
        $($(controller).closest("tr")).remove()
    }

    //clear the fields
    public ClearFields() {
        $("#itemCode").val("");
        $("#itemID").val("");
        $("#unitPrice").val("");
        $("#itemQty").val("")
    }

    //Get item price for the calculations from the database.
    public GetItemPrice(ItemName: string) {

        var url = "/API/Order/GetMenuItem";

        var param = {
            Code: ItemName
        };
        var data = JSON.stringify(param);

        orderPage.CallAjax(url, data, "POST", orderPage.GetItemPrice_Success, orderPage.GetItemPrice_Error);
    }

    //GetPrice method's success event
    public GetItemPrice_Success(data) {
        $("#unitPrice").val(data.Price);
        $("#itemID").val(data.ID);
        $("#itemDescription").val(data.Description);
    }

    //GetPrice method's error event
    public GetItemPrice_Error(err) {
        console.log(err);
    }


    //Common method to use ajax calls in apllication
    public CallAjax(url: string, data: any, type: string, succFunc: any, errorFunc: any): void {
        $.ajax(
            {
                type: type,
                contentType: "application/json; charset=utf-8",
                url: url,
                data: data,
                dataType: "json",
                success: function (data) {
                    succFunc(data);
                },
                error: function (xhr, status, error) {
                    errorFunc(xhr);
                }
            }
        );
    }
}

var orderPage = new OrderPage();