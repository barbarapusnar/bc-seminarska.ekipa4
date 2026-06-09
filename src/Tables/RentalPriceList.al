table 50104 "Rental Price List"
{
    Caption = 'Rental Price List';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }

        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }

        field(3; "Rental Type Code"; Code[20])
        {
            Caption = 'Rental Type Code';
            NotBlank = true;
            TableRelation = "Rental Type".Code;
        }

        field(4; "Starting Date"; Date)
        {
            Caption = 'Starting Date';

            trigger OnValidate()
            begin
                ValidateDates();
                CheckOverLap();
            end;
        }

        field(5; "Ending Date"; Date)
        {
            Caption = 'Ending Date';

            trigger OnValidate()
            begin
                ValidateDates();
                CheckOverLap();
            end;
        } 

        field(6; "Daily Rate"; Decimal)
        {
            Caption = 'Daily Rate';
            MinValue = 0;
        }
    }

    keys
    {
        key(PK; Code) { Clustered = true; }
    }

    local procedure ValidateDates()
    begin
        if ("Starting Date" <> 0D) and ("Ending Date" <> 0D) then
            if "Starting Date" > "Ending Date" then
                Error('Starting Date must be earlier than or equal to Ending Date.')
    end;

    local procedure CheckOverLap()
    var
        PriceList: Record "Rental Price List";
    begin
        if ("Rental Type Code" = '') or ("Starting Date" = 0D) or ("Ending Date" = 0D) then
            exit;

        PriceList.SetRange("Rental Type Code", "Rental Type Code");
        if PriceList.FindSet() then
            repeat
                if PriceList.Code <> Code then
                    if (PriceList."Starting Date" <= "Ending Date") and
                        (PriceList."Ending Date" >= "Starting Date") then
                        Error('A price list for this Rental Type already exists in this period');
            until PriceList.Next() = 0;
    end;
}