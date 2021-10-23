<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hondiOrder.aspx.cs" Inherits="_1231843_Adrian_Mikula_Midterm.hondiOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hondi Order Page</title>
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <form id="orderForm" runat="server">

            <div class="container-child">
                  <h3>Car Informations</h3>

                <table>

                    <tr>
                        <td>Your City : </td>

                        <td>
                            <asp:TextBox ID="TxtCity" runat="server" class="text"></asp:TextBox>
                        </td>
                        <td class="errorMessage">
                            <asp:RequiredFieldValidator ID="CityFieldValidator" runat="server" ErrorMessage="City has no value" ControlToValidate="TxtCity"></asp:RequiredFieldValidator> 
                        </td>
                    </tr>
                    <tr>
                        <td>Zip Code : </td>

                        <td>
                            <asp:TextBox ID="TxtZipCode" runat="server" class="text"></asp:TextBox>
                        </td>
                        <td class="errorMessage">
                            <asp:RequiredFieldValidator ID="ZipCodeValidator" runat="server" ErrorMessage="Zip Code has no value" ControlToValidate="TxtZipCode"></asp:RequiredFieldValidator> 
                        </td>
                    </tr>
                    <tr>
                        <td>Select Car model </td>
                        <td>
                              <asp:DropDownList ID="CarModelDropDownList"  runat="server">
                                  <asp:ListItem>Civoc(+$25000)</asp:ListItem>
                                   <asp:ListItem>DR-V(+$30000)</asp:ListItem>
                                   <asp:ListItem>Appord(+$33000)</asp:ListItem>
                                   <asp:ListItem>Cilot(+$45000)</asp:ListItem>
                                   <asp:ListItem>Odyrrey(+$54000)</asp:ListItem>
                              </asp:DropDownList>
                             
                        </td>
                          <td class="errorMessage">
                            <asp:RequiredFieldValidator ID="CarModelValidator" runat="server" ErrorMessage="Select a car model " ControlToValidate="CarModelDropDownList"></asp:RequiredFieldValidator>     
                        </td>
                    </tr>
                    <tr>
                        <td>Interior Color </td>
                        <td>
                            <asp:ListBox ID="IntColorListBox" runat="server">
                                <asp:ListItem>White(Free)</asp:ListItem>
                                 <asp:ListItem>Dark(+$300)</asp:ListItem>
                                 <asp:ListItem>Pearl(+$900)</asp:ListItem>
                            </asp:ListBox>
                        </td>
                         <td class="errorMessage">
                            <asp:RequiredFieldValidator ID="IntColorValidator" runat="server" ErrorMessage="Please select an interior color" ControlToValidate="IntColorListBox"></asp:RequiredFieldValidator>
                             </td>

                    </tr>
                    <tr>
                        <td>Accessories </td>
                        <td>
                            <asp:CheckBoxList ID="AccessoriesList" runat="server">
                                 <asp:ListItem>AeroKit(+$1300)</asp:ListItem>
                                 <asp:ListItem>Film(+$600)</asp:ListItem>
                                 <asp:ListItem>Cold Wheather(+$900)</asp:ListItem>
                                 <asp:ListItem>Hondi Emblem(+$150)</asp:ListItem>
                                <asp:ListItem>Snow Tire Package(+1800)</asp:ListItem>
                               </asp:CheckBoxList>
                        </td>
      
                    </tr>
                    <tr>
                        <td>Warranty </td>
                        <td>
                          <asp:RadioButtonList ID="WarrantyList" runat="server">
                                <asp:ListItem>3 years(included)</asp:ListItem>
                                 <asp:ListItem>5 Years (+$1000)</asp:ListItem>
                                 <asp:ListItem>7 years (+$1500)</asp:ListItem>
                          </asp:RadioButtonList>
                        </td>
                         <td class="errorMessage">
                            <asp:RequiredFieldValidator ID="WarrantyValidator" runat="server" ErrorMessage="Select a warranty" ControlToValidate="WarrantyList"></asp:RequiredFieldValidator>
                             </td>
                    </tr>
                    <tr>
                        <td>Dealer contact you by phone?</td>
                        <td>
                            <asp:CheckBox ID="CheckBoxPhone" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="lblPhone" runat="server" Text="Phone Number"></asp:Label> </td>
                        <td>
                            <asp:TextBox ID="TxtPhone" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                  <asp:Button ID="Button2" runat="server" Text="Submit" OnClick="Button2_Click" />
                <asp:Button ID="Button1" runat="server" Text="Conclude" OnClick="Button1_Click" />
            </div> 
     </form>
        
        <div class="container-child">
            <div class="container-child">
                <h3>Price Resume</h3>
            <table>
                <tr>
                        <td><asp:Label ID="Label1" runat="server" Text="Car Price" Visible="false"></asp:Label></td>
                        <td> <asp:Label ID="lblPrice" runat="server" Text=""></asp:Label> </td>
                    </tr>
                      <tr>
                         <td><asp:Label ID="Label2" runat="server" Text="Interior Color" Visible="false"></asp:Label></td>
                        <td> <asp:Label ID="lblInteriorColor" runat="server" Text=""></asp:Label> </td>
                    </tr>
                      <tr>
                        <td><asp:Label ID="Label3" runat="server" Text="Accessories" Visible="false"></asp:Label></td>
                        <td> <asp:Label ID="lblAccessories" runat="server" Text=""></asp:Label> </td>
                    </tr>
                      <tr>
                         <td><asp:Label ID="Label4" runat="server" Text="Warranty" Visible="false"></asp:Label></td>
                        <td> <asp:Label ID="lblWarranty" runat="server" Text=""></asp:Label> </td>
                    </tr>
                    <tr>
                         <td><asp:Label ID="Label5" runat="server" Text="Total Without Taxes" Visible="false"></asp:Label></td>
                        <td>
                              <asp:Label ID="lblSubTotal" runat="server" Text=""></asp:Label> 
                        </td>
                    </tr>
                    <tr>
                      <td><asp:Label ID="Label6" runat="server" Text="Total Without Taxes" Visible="false"></asp:Label></td>
                        <td>
                              <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label> 
                        </td>
                    </tr>
            </table>
        </div>
          <h3>Final Information</h3>
          <asp:Label ID="FinalInfo1" runat="server" Text=""></asp:Label><br />
          <asp:Label ID="FinalInfo2" runat="server" Text=""></asp:Label><br />
          <asp:Label ID="FinalInfo3" runat="server" Text=""></asp:Label>
      </div>
    </div> 
</body>
</html>
