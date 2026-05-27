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
}