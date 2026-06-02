query 50100 "Rental Analysis"
{
    Caption = 'Rental Analysis';

    elements
    {
        dataitem(RentalHeader; "Rental Header")
        {
            filter(Status; Status)
            {
                ColumnFilter = Status = const(Active);
            }

            column(Rental_No; "No.")
            {
                Caption = 'Rental No.';
            }

            column(Rental_Status; Status)
            {
                Caption = 'Rental Status';
            }

            column(Customer_No; "Customer No.")
            {
                Caption = 'Customer No.';
            }

            dataitem(RentalLine; "Rental Line")
            {
                DataItemLink = "Rental No." = RentalHeader."No.";

                column(Rental_Days; "Rental Days")
                {
                    Caption = 'Rental Days';
                }

                column(Line_Amount; "Line Amount")
                {
                    Caption = 'Line Amount';
                }

                dataitem(Bicycle; Bicycle)
                {
                    DataItemLink = "No." = RentalLine."Bicycle No.";

                    column(Bicycle_No; "No.")
                    {
                        Caption = 'Bicycle No.';
                    }

                    column(Bicycle_Description; Description)
                    {
                        Caption = 'Bicycle Description';
                    }
                }
            }
        }
    }
}