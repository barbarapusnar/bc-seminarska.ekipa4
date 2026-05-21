table 50100 "Rental Type"
{
    Caption = 'Rental Type';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }

        field(2; "Description"; Text[100])
        {
            Caption = 'Description';
        }

        field(3; "Daily Rate"; Decimal)
        {
            Caption = 'Daily Rate';
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Daily Rate" < 0 then
                    Error('Daily Rate cannot be negative.');
            end;
        }

        field(4; "Max Rental Days"; Integer)
        {
            Caption = 'Max Rental Days';

            trigger OnValidate()
            begin
                if "Max Rental Days" < 1 then
                    Error('Max Rental Days must be at least 1.');
            end;
        }

        field(5; "Requires Deposit"; Boolean)
        {
            Caption = 'Requires Deposit';
        }

        field(6; "Deposit Amount"; Decimal)
        {
            Caption = 'Deposit Amount';

            trigger OnValidate()
            begin
                if "Requires Deposit" then
                    if "Deposit Amount" <= 0 then
                        Error('Deposit Amount must be greater than 0 when deposit is required.');
            end;
        }
    }

    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
