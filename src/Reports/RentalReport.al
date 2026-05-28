/*report 50104 "Rental Report"
{
    caption = 'Pregled izposoj po strankah';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = Word;
    WordLayout = 'src/Reports/RentalReport.docx';

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(Customer_No; "No.") { }
            column(Customer_Name; Name) { }

            dataitem(RentalHeader; "Rental Header")
            {
                DataItemLink = "Customer No." = Customer."No.";

                column(Bycicle_No; "Bycicle No.") { }
                column(Line_Description; Description) { }
                column(Rental_Days; "Rental Days") { }
                column(Daily_Rate; "Daily Rate") { }
                column(Line_Amount; "Line Amount") { }
            }
        }
    }
}

requestpage
{
    layout
    {
        area(content)
        {
            group(Options)
            {}
        }
    }
}*/