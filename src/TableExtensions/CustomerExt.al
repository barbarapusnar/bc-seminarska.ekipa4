tableextension 50100 "Customer Ext" extends Customer
{
    fields
    {
        field(50100; "Preferred Rental Type"; Code[20])
        {
            Caption = 'Preferred Rental Type';
            DataClassification = ToBeClassified;
            TableRelation = "Rental Type".Code;
        }

        field(50101; "VIP Customer"; Boolean)
        {
            Caption = 'VIP Customer';
            DataClassification = ToBeClassified;
        }

        field(50102; "Max Active Rentals"; Integer)
        {
            Caption = 'Max Active Rentals';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Max Active Rentals" < 0 then
                    Error('Max Active Rentals must be 0 or greater.');
            end;
        }
    }
}