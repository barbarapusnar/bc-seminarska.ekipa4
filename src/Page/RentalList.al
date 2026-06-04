page 50104 "Rental List"
{
    PageType = List;
    SourceTable = "Rental Header";
    Caption = 'Rentals';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.") { ApplicationArea = All; }
                field("Customer No."; Rec."Customer No.") { ApplicationArea = All; }
                field("Rental Date"; Rec."Rental Date") { ApplicationArea = All; }
                field("Expected Return Date"; Rec."Expected Return Date") { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
                field("Total Amount"; Rec."Total Amount") { ApplicationArea = All; }
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
                RunObject = page "Rental Card";
                RunPageLink = "No." = field("No.");
            }
        }
    }
}

