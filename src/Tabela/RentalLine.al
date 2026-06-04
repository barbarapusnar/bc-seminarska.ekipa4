<<<<<<< HEAD
table 50103 "Rental Line"
{
    Caption = 'Rental Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Rental No."; Code[20])
        {
            Caption = 'Rental No.';
            TableRelation = "Rental Header"."No.";
        }

        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }

        field(3; "Bicycle No."; Code[20])
        {
            Caption = 'Bicycle No.';
            TableRelation = Bicycle."No.";

            trigger OnValidate()
            var
                Bicycle: Record Bicycle;
                RentalHeader: Record "Rental Header";
                PriceList: Record "Rental Price List";
                RentalType: Record "Rental Type";

            begin
                if Bicycle.Get("Bicycle No.") then begin
                    if Bicycle.Status <> Bicycle.Status::Available then
                        Error('Bicycle %1 is not available for rental.', "Bicycle No.");
                    Description := Bicycle.Description;

                    if not RentalHeader.Get("Rental No.") then
                        Error('Rental Header %1 not found.', "Rental No.");

                    if Bicycle."Rental Type Code" = '' then
                        Error('Bicycle %1 has no Rental Type assigned.', "Bicycle No.");

                    PriceList.SetRange("Rental Type Code", Bicycle."Rental Type Code");
                    PriceList.SetFilter("Starting Date", '<=%1', RentalHeader."Rental Date");
                    PriceList.SetFilter("Ending Date", '>=%1', RentalHeader."Rental Date");

                    if PriceList.FindFirst() then
                        "Daily Rate" := PriceList."Daily Rate"
                    else begin
                        // Fallback to Rental Type base price
                        if not RentalType.Get(Bicycle."Rental Type Code") then
                            Error('No price found for Rental Type %1.', Bicycle."Rental Type Code");
                        "Daily Rate" := RentalType."Daily Rate";
                    end;

                    "Line Amount" := "Daily Rate" * "Rental Days";
                end;
            end;
        }

        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }

        field(5; "Daily Rate"; Decimal)
        {
            Caption = 'Daily Rate';
        }

        field(6; "Rental Days"; Integer)
        {
            Caption = 'Rental Days';

            trigger OnValidate()
            begin
                if "Rental Days" < 1 then
                    Error('Rental Days must be greater than 0.');
                "Line Amount" := "Daily Rate" * "Rental Days";
            end;
        }

        field(7; "Line Amount"; Decimal)
        {
            Caption = 'Line Amount';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Rental No.", "Line No.") { Clustered = true; }
    }
}
=======
table 50103 "Rental Line"
{
    Caption = 'Rental Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Rental No."; Code[20])
        {
            Caption = 'Rental No.';
            TableRelation = "Rental Header"."No.";
        }

        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }

        field(3; "Bicycle No."; Code[20])
        {
            Caption = 'Bicycle No.';
            TableRelation = Bicycle."No.";

            trigger OnValidate()
            var
                Bicycle: Record Bicycle;
            begin
                if Bicycle.Get("Bicycle No.") then begin
                    if Bicycle.Status <> Bicycle.Status::Available then
                        Error('Bicycle %1 is not available for rental.', "Bicycle No.");
                    Description := Bicycle.Description;
                    "Daily Rate" := Bicycle."Purchase Price";
                end;
            end;
        }

        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }

        field(5; "Daily Rate"; Decimal)
        {
            Caption = 'Daily Rate';
        }

        field(6; "Rental Days"; Integer)
        {
            Caption = 'Rental Days';

            trigger OnValidate()
            begin
                if "Rental Days" < 1 then
                    Error('Rental Days must be greater than 0.');
                "Line Amount" := "Daily Rate" * "Rental Days";
            end;
        }

        field(7; "Line Amount"; Decimal)
        {
            Caption = 'Line Amount';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Rental No.", "Line No.") { Clustered = true; }
    }
}

>>>>>>> bf1e63840ca6977a55f64fc506860ab3392cd86b
