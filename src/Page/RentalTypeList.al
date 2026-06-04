<<<<<<< HEAD
page 50100 "Rental Type List"
{
    PageType = List;
    SourceTable = "Rental Type";
    Caption = 'Rental Types';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code) { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field("Daily Rate"; Rec."Daily Rate") { ApplicationArea = All; }
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
                RunObject = page "Rental Type Card";
                RunPageLink = Code = field(Code);
            }
        }
    }
=======
page 50100 "Rental Type List"
{
    PageType = List;
    SourceTable = "Rental Type";
    Caption = 'Rental Types';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code) { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field("Daily Rate"; Rec."Daily Rate") { ApplicationArea = All; }
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
                RunObject = page "Rental Type Card";
                RunPageLink = Code = field(Code);
            }
        }
    }
>>>>>>> bf1e63840ca6977a55f64fc506860ab3392cd86b
}