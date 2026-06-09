table 50101 Bicycle
{
    Caption = 'Bicycle';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20]) { }

        field(2; "Rental Type Code"; Code[20])
        {
            TableRelation = "Rental Type".Code;
        }

        field(3; Description; Text[100]) { }

        field(4; Status; Enum "Bicycle Status") { }

        field(5; "Purchase Date"; Date) { }

        field(6; "Purchase Price"; Decimal) { }

        field(7; "Current Location"; Text[50]) { }

        field(8; "Last Service Date"; Date) { }
    }

    keys
    {
        key(PK; "No.") { Clustered = true; }
    }
}