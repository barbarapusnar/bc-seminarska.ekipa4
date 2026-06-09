page 50103 "Bicycle Card"
{
    PageType = Card;
    SourceTable = Bicycle;
    Caption = 'Bicycle';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.") { ApplicationArea = All; }
                field("Rental Type Code"; Rec."Rental Type Code") { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
            }

            group(Purchase)
            {
                field("Purchase Date"; Rec."Purchase Date") { ApplicationArea = All; }
                field("Purchase Price"; Rec."Purchase Price") { ApplicationArea = All; }
            }

            group(Service)
            {
                field("Last Service Date"; Rec."Last Service Date") { ApplicationArea = All; }
                field("Current Location"; Rec."Current Location") { ApplicationArea = All; }
            }
        }
    }
}