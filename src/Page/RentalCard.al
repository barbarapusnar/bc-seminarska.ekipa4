<<<<<<< HEAD
page 50105 "Rental Card"
{
    PageType = Card;
    SourceTable = "Rental Header";
    Caption = 'Rental';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.") { ApplicationArea = All; }
                field("Customer No."; Rec."Customer No.") { ApplicationArea = All; }
                field("Rental Date"; Rec."Rental Date") { ApplicationArea = All; }
                field("Expected Return Date"; Rec."Expected Return Date") { ApplicationArea = All; }
                field("Actual Return Date"; Rec."Actual Return Date") { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
                field("Total Amount"; Rec."Total Amount") { ApplicationArea = All; }
            }

            part(RentalLines; "Rental Line Subpage")
            {
                ApplicationArea = All;
                SubPageLink = "Rental No." = field("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(StartRental)
            {
                Caption = 'Start Rental';
                ApplicationArea = All;

                trigger OnAction()
                var
                    RentalMgt: Codeunit "Rental Management";
                begin
                    RentalMgt.StartRental(Rec);
                end;
            }

            action(ProcessReturn)
            {
                Caption = 'Process Return';
                ApplicationArea = All;

                trigger OnAction()
                var
                    RentalMgt: Codeunit "Rental Management";
                begin
                    RentalMgt.ProcessReturn(Rec);
                end;
            }
        }
    }
=======
page 50105 "Rental Card"
{
    PageType = Card;
    SourceTable = "Rental Header";
    Caption = 'Rental';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.") { ApplicationArea = All; }
                field("Customer No."; Rec."Customer No.") { ApplicationArea = All; }
                field("Rental Date"; Rec."Rental Date") { ApplicationArea = All; }
                field("Expected Return Date"; Rec."Expected Return Date") { ApplicationArea = All; }
                field("Actual Return Date"; Rec."Actual Return Date") { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
                field("Total Amount"; Rec."Total Amount") { ApplicationArea = All; }
            }

            part(RentalLines; "Rental Line Subpage")
            {
                ApplicationArea = All;
                SubPageLink = "Rental No." = field("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(StartRental)
            {
                Caption = 'Start Rental';
                ApplicationArea = All;

                trigger OnAction()
                var
                    RentalMgt: Codeunit "Rental Management";
                begin
                    RentalMgt.StartRental(Rec);
                end;
            }

            action(ProcessReturn)
            {
                Caption = 'Process Return';
                ApplicationArea = All;

                trigger OnAction()
                var
                    RentalMgt: Codeunit "Rental Management";
                begin
                    RentalMgt.ProcessReturn(Rec);
                end;
            }
        }
    }
>>>>>>> bf1e63840ca6977a55f64fc506860ab3392cd86b
}