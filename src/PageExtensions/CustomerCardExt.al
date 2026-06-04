pageextension 50100 "Customer Card Ext" extends "Customer Card"
{
    layout
    {
        addlast(content)
        {
            group("Rental Information")
            {
                Caption = 'Rental Information';

                field("Preferred Rental Type"; Rec."Preferred Rental Type") { ApplicationArea = All; }
                field("VIP Customer"; Rec."VIP Customer") { ApplicationArea = All; }
                field("Max Active Rentals"; Rec."Max Active Rentals") { ApplicationArea = All; }
            }
        }
    }
}