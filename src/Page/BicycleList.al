<<<<<<< HEAD
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
=======
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
>>>>>>> bf1e63840ca6977a55f64fc506860ab3392cd86b
}