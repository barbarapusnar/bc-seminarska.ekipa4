table 50103 "Rental Line"
{
    Caption = 'Rental Line';
    DataClassification = ToBeClassified

    fields
    {
        field(1; "Rental No."; Code[20])
        {
            Caption = 'Rental No.';
            TableRelation = "Rental Header"."No.";
        }


    }
}
