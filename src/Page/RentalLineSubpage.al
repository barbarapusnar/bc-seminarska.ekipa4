<<<<<<< HEAD
page 50106 "Rental Line Subpage"
{
    PageType = ListPart;
    SourceTable = "Rental Line";
    Caption = 'Rental Lines';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.") { ApplicationArea = All; }
                field("Bicycle No."; Rec."Bicycle No.") { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field("Daily Rate"; Rec."Daily Rate") { ApplicationArea = All; }
                field("Rental Days"; Rec."Rental Days") { ApplicationArea = All; }
                field("Line Amount"; Rec."Line Amount") { ApplicationArea = All; }
            }
        }
    }
=======
page 50106 "Rental Line Subpage"
{
    PageType = ListPart;
    SourceTable = "Rental Line";
    Caption = 'Rental Lines';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.") { ApplicationArea = All; }
                field("Bicycle No."; Rec."Bicycle No.") { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field("Daily Rate"; Rec."Daily Rate") { ApplicationArea = All; }
                field("Rental Days"; Rec."Rental Days") { ApplicationArea = All; }
                field("Line Amount"; Rec."Line Amount") { ApplicationArea = All; }
            }
        }
    }
>>>>>>> bf1e63840ca6977a55f64fc506860ab3392cd86b
}