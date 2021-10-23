using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;


namespace _1231843_Adrian_Mikula_Midterm
{
    public partial class hondiOrder : System.Web.UI.Page
    {
        double SubTotal = 0;
        double Total = 0;
        double AccessoryTotal = 0;
        // double PriceCarModel = 0;
        // double PriceInteriorColor = 0;
        double WarrantyPrice = 0;
        double GST = 0;
        double QST = 0;

        string PurchasedAccessories = "";
        string selectedAccessories = " ";
        double AccessoriesPrice = 0;
        string selectedWarranty = "";
        string CarModel = "";
        string CarInteriorColor = "";
        string info = "";
        string info2 = "";
        string WarrantyType = "";

        double PriceCarModel = 0;
        double PriceColor = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            ifChecked();

        }

        protected void ifChecked()
        {
            if (CheckBoxPhone.Checked)
            {
                lblPhone.Style.Add("visibility", "none");
                TxtPhone.Style.Add("visibility", "none");
            }
            else
            {
                TxtPhone.Style.Add("visibility", "hidden");
                lblPhone.Style.Add("visibility", "hidden");
            }





        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                CarModel = Regex.Match(CarModelDropDownList.SelectedValue, @"^[a-zA-Z]+").Value;
                CarInteriorColor = Regex.Match(IntColorListBox.SelectedValue, @"^[a-zA-Z]+").Value;
                lblPrice.Text = Regex.Match(CarModelDropDownList.SelectedValue, @"\d+").Value;


                FinalInfo1.Text = "Congratulations in obtaining your new " + CarModel + " in " + TxtCity.Text + ", " + TxtZipCode.Text + ".";
                foreach (ListItem lst in AccessoriesList.Items)
                {
                    if (lst.Selected == true)
                    {
                        PurchasedAccessories = Regex.Match(lst.Text, @"^[a-zA-Z]+").Value;

                        info += PurchasedAccessories + ", ";
                        FinalInfo2.Text = "<br />" + "Your car comes with " + info + " accessories.";
                    }

                }
                foreach (ListItem lst in WarrantyList.Items)
                {
                    if (WarrantyList.SelectedIndex == 0)
                    {
                        WarrantyPrice = 0;
                        lblWarranty.Text = "0";
                        WarrantyType = "3 years";
                    }
                    if (WarrantyList.SelectedIndex == 1)
                    {
                        WarrantyPrice = 1000;
                        lblWarranty.Text = "1000";
                        WarrantyType = "5 years";
                    }
                    if (WarrantyList.SelectedIndex == 2)
                    {
                        WarrantyPrice = 1500;
                        lblWarranty.Text = "1500";
                        WarrantyType = "7 years";
                    }
                    if (lst.Selected == true)
                    {
                        selectedWarranty = WarrantyType;

                        FinalInfo3.Text = "<br />" + "You choosed " + selectedWarranty + " of warranty and your assigned dealer will contact you by phone at " + TxtPhone.Text + ".";
                    }

                }


            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //grab the info 
                Car car = new Car();
                car.City = TxtCity.Text;
                car.ZipCode = TxtZipCode.Text;
                car.CarModel = CarModelDropDownList.SelectedItem.Text;
                car.InteriorColor = IntColorListBox.SelectedItem.Text;
                car.Accessories = AccessoriesList.SelectedItem.Text;
                car.Warranty = WarrantyList.SelectedItem.Text;

                //displaying stuff




                lblPrice.Text = Regex.Match(CarModelDropDownList.SelectedValue, @"\d+").Value;
                lblInteriorColor.Text = Regex.Match(IntColorListBox.SelectedValue, @"\d+").Value;
                //lblAccessories.Text = Regex.Match(AccessoriesList.SelectedValue, @"\d+").Value;

                




                    //calculate the price
                    if (CarModelDropDownList.SelectedIndex == 0)
                    {
                        lblPrice.Text = "$25000";
                        PriceCarModel = 25000;


                    }
                    if (CarModelDropDownList.SelectedIndex == 1)
                    {
                        lblPrice.Text = "$30000";
                        PriceCarModel = 30000;

                    }
                    if (CarModelDropDownList.SelectedIndex == 2)
                    {
                        lblPrice.Text = "$33000";
                        PriceCarModel = 33000;
                    }
                    if (CarModelDropDownList.SelectedIndex == 3)
                    {
                        lblPrice.Text = "$45000";
                        PriceCarModel = 45000;
                    }
                    if (CarModelDropDownList.SelectedIndex == 4)
                    {
                        lblPrice.Text = "$54000";
                        PriceCarModel = 54000;
                    }

                    if (WarrantyList.SelectedIndex == 0)
                    {
                        WarrantyPrice = 0;
                        lblWarranty.Text = "0";
                        WarrantyType = "3 years";
                    }
                    if (WarrantyList.SelectedIndex == 1)
                    {
                        WarrantyPrice = 1000;
                        lblWarranty.Text = "1000";
                        WarrantyType = "5 years";
                    }
                    if (WarrantyList.SelectedIndex == 2)
                    {
                        WarrantyPrice = 1500;
                        lblWarranty.Text = "1500";
                        WarrantyType = "7 years";
                    }

                    if (IntColorListBox.SelectedIndex == 0)
                    {

                        lblInteriorColor.Text = "0";
                        PriceColor = 0;

                    }
                    if (WarrantyList.SelectedIndex == 1)
                    {

                        lblInteriorColor.Text = "300";
                        PriceColor = 300;

                    }
                    if (WarrantyList.SelectedIndex == 2)
                    {

                        lblInteriorColor.Text = "900";
                        PriceColor = 900;

                    }



                    foreach (ListItem lst in AccessoriesList.Items)
                    {
                        if (lst.Selected == true)
                        {
                            selectedAccessories = Regex.Match(lst.Text, @"\d+").Value;
                            lblAccessories.Text += selectedAccessories + "<br />";


                        }

                    }





                    //Calculate the Price



                    SubTotal = PriceCarModel + PriceColor + Convert.ToDouble(selectedAccessories) + WarrantyPrice;

                    lblSubTotal.Text = SubTotal.ToString();


                    GST = SubTotal * 0.05;
                    QST = SubTotal * 0.0975;

                    Total = SubTotal + GST + QST;

                    lblTotal.Text = Total.ToString();

                    
                }
            }
        }
    }
