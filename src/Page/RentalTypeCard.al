page 50101 "Rental Type Card"
{
    PageType = Card;
    SourceTable = "Rental Type";
    Caption = 'Rental Type';

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Code; Rec.Code) { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field("Daily Rate"; Rec."Daily Rate") { ApplicationArea = All; }
                field("Max Rental Days"; Rec."Max Rental Days") { ApplicationArea = All; }
                field("Requires Deposit"; Rec."Requires Deposit") { ApplicationArea = All; }
                field("Deposit Amount"; Rec."Deposit Amount") { ApplicationArea = All; }
            }
        }
    }
}