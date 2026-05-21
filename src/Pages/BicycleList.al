page 50102 "Bicycle List"
{
    PageType = List;
    SourceTable = Bicycle;
    Caption = 'Bicycles';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.") { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field("Rental Type Code"; Rec."Rental Type Code") { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Card)
            {
                Caption = 'Open Card';
                ApplicationArea = All;
                RunObject = page "Bicycle Card";
                RunPageLink = "No." = field("No.");
            }
        }
    }
}