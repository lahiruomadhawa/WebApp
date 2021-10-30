$(document).ready(function () {
    orderPage.InitiateUIEvents();
    $('#AddItemDiv').show();
});
var OrderPage = /** @class */ (function () {
    function OrderPage() {
        this.ItemListNumber = 0;
    }
    //This method will bind all events to the UI components.
    OrderPage.prototype.InitiateUIEvents = function () {
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
    };
    //Save created oder to the database.
    OrderPage.prototype.SaveOrder = function () {
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
    };
    //Save function success event
    OrderPage.prototype.SaveOrder_Success = function (data) {
        alert(data);
    };
    //Save function error event
    OrderPage.prototype.SaveOrder_Error = function (err) {
        console.log(err);
    };
    //Using this method we can clone a html table row (used for the adding items to the order table)
    OrderPage.prototype.CloneRow = function (Index, itemName, itemDescription, itemQty, itemPrice, itemID) {
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
        }
        catch (e) {
            console.log(e);
        }
    };
    //remove self row from the order items table
    OrderPage.prototype.RemoveRow = function (controller) {
        $($(controller).closest("tr")).remove();
    };
    //clear the fields
    OrderPage.prototype.ClearFields = function () {
        $("#itemCode").val("");
        $("#itemID").val("");
        $("#unitPrice").val("");
        $("#itemQty").val("");
    };
    //Get item price for the calculations from the database.
    OrderPage.prototype.GetItemPrice = function (ItemName) {
        var url = "/API/Order/GetMenuItem";
        var param = {
            Code: ItemName
        };
        var data = JSON.stringify(param);
        orderPage.CallAjax(url, data, "POST", orderPage.GetItemPrice_Success, orderPage.GetItemPrice_Error);
    };
    //GetPrice method's success event
    OrderPage.prototype.GetItemPrice_Success = function (data) {
        $("#unitPrice").val(data.Price);
        $("#itemID").val(data.ID);
        $("#itemDescription").val(data.Description);
    };
    //GetPrice method's error event
    OrderPage.prototype.GetItemPrice_Error = function (err) {
        console.log(err);
    };
    //Common method to use ajax calls in apllication
    OrderPage.prototype.CallAjax = function (url, data, type, succFunc, errorFunc) {
        $.ajax({
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
        });
    };
    return OrderPage;
}());
var orderPage = new OrderPage();
//# sourceMappingURL=Order.js.map