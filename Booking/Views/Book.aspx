<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Book.aspx.cs" Inherits="Booking.Views.Book" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/resorts.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <link rel="stylesheet"
        id="theme_link"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.1.2/lux/bootstrap.min.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">Booking.com</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarColor01">
                        <ul class="navbar-nav me-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="Booking.aspx">Resorts</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <div class="container">
                <div class="row">
                    <asp:Repeater ID="repResort" runat="server">
                        <ItemTemplate>
                            <div class="card m-2" style="width: 18rem">
                                <h5 class="card-title"><%# Eval("Name")%></h5>
                                <img src="<%# Eval("Photo")%>" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <p class="card-text"><%# Eval("Description")%></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <%--BOOK--%>
                    <div class="card m-2" style="width: 30rem">
                        <div class="card-header">
                            Save your Book!
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col">
                                        <label for="checkin" class="form-label mt-4">Checkin</label>
                                    </div>
                                    <div class="col">                                        
                                         <asp:Calendar class="form-control" ID="calCheckin" runat="server">
                                        </asp:Calendar>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col">
                                        <label for="checkout" class="form-label mt-4">Checkout</label>
                                    </div>
                                    <div class="col">
                                        <asp:Calendar class="form-control" ID="calCheckOut" runat="server" 
                                            OnSelectionChanged="calCheckOut_SelectionChanged">
                                        </asp:Calendar>                                        
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="adults" class="form-label mt-4">Adults</label>
                                <asp:DropDownList class="form-select" AutoPostBack="true" ID="dropDownAdult" runat="server" OnSelectedIndexChanged="dropDownAdult_SelectedIndexChanged">
                                    <asp:ListItem Text="1" Value="1" />
                                    <asp:ListItem Text="2" Value="2" />
                                    <asp:ListItem Text="3" Value="3" />
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label for="kids" class="form-label mt-4">Kids</label>

                                <asp:DropDownList AutoPostBack="true" class="form-select" ID="dropDownKids" runat="server" OnSelectedIndexChanged="dropDownKids_SelectedIndexChanged">
                                    <asp:ListItem Text="0" Value="0" />
                                    <asp:ListItem Text="1" Value="1" />
                                    <asp:ListItem Text="2" Value="2" />
                                    <asp:ListItem Text="3" Value="3" />
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <div class="col text-center">
                                    <label for="adults" class="form-label mt-4">No credit card needed</label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--DETAILS--%>
                    <div class="card m-2" style="width: 30rem">
                        <div class="card-header">
                            Details
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col">
                                        <label for="checkin" class="form-label mt-4">Nights</label>
                                    </div>
                                    <div class="col-6">
                                        <div class="input-group mb-3">
                                            <span class="input-group-text">
                                                <label id="lblNights" runat="server"></label>
                                            </span>
                                            <span class="input-group-text">x $<label id="lblPrice" runat="server"></label></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="divExtraMember" runat="server" class="form-group" hidden="hidden">
                                <div class="row">
                                    <div class="col">
                                        <label for="checkin" class="form-label mt-4">Extra member</label>
                                    </div>
                                    <div class="col-6">
                                        <div class="input-group mb-3">
                                            <span class="input-group-text">$</span>
                                            <span class="input-group-text">
                                                <label id="lblExtraMemberCost" runat="server"></label>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col">
                                        <label for="checkin" class="form-label mt-4">Cost</label>
                                    </div>
                                    <div class="col-6">
                                        <div class="input-group mb-3">
                                            <span class="input-group-text">$</span>
                                            <span class="input-group-text">
                                                <label id="lblCost" runat="server"></label>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col">
                                        <label for="checkin" class="form-label mt-4">Cleaning tax</label>
                                    </div>
                                    <div class="col-6">
                                        <div class="input-group mb-3">
                                            <span class="input-group-text">$</span>
                                            <span class="input-group-text">20</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col">
                                        <label for="checkin" class="form-label mt-4">Service tax</label>
                                    </div>
                                    <div class="col-6">
                                        <div class="input-group mb-3">
                                            <span class="input-group-text">$</span>
                                            <span class="input-group-text">10</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr />
                            <div class="form-group">
                                <div class="row">
                                    <div class="col">
                                        <label for="checkin" class="form-label mt-4">Total</label>
                                    </div>
                                    <div class="col-6">
                                        <div class="input-group mb-3">
                                            <span class="input-group-text">$</span>
                                            <span class="input-group-text">
                                                <label id="lblTotal" runat="server"></label>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <button id="btnSave" class="btn btn-primary" runat="server" onserverclick="btnSave_ServerClick">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
