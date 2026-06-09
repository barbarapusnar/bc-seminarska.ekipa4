page 50107 "Rental Price List"
{
    PageType = List;
    SourceTable = "Rental Price List";
    Caption = 'Rental Price List';
    CardPageId = "Rental Price Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code) { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field("Rental Type Code"; Rec."Rental Type Code") { ApplicationArea = All; }
                field("Starting Date"; Rec."Starting Date") { ApplicationArea = All; }
                field("Ending Date"; Rec."Ending Date") { ApplicationArea = All; }
                field("Daily Rate"; Rec."Daily Rate") { ApplicationArea = All; }
            }
        }
    }
}
