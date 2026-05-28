codeunit 50100 "Rental Management"
{
    procedure StartRental(var RentalHeader: Record "Rental Header")
    var
        RentalLine: Record "Rental Line";
        Bicycle: Record Bicycle;
    begin
        if RentalHeader.Status <> RentalHeader.Status::Open then
            Error('Rental must have status Open to start.');

        RentalLine.SetRange("Rental No.", RentalHeader."No.");
        if RentalLine.IsEmpty() then
            Error('Rental must have at least one line.');

        RentalLine.FindSet();
        repeat
            if not Bicycle.Get(RentalLine."Bicycle No.") then
                Error('Bicycle %1 does not exist.', RentalLine."Bicycle No.");
            if Bicycle.Status <> Bicycle.Status::Available then
                Error('Bicycle %1 is not available.', RentalLine."Bicycle No.");
        until RentalLine.Next() = 0;

        RentalLine.FindSet();
        repeat
            Bicycle.Get(RentalLine."Bicycle No.");
            Bicycle.Status := Bicycle.Status::Rented;
            Bicycle.Modify();
        until RentalLine.Next() = 0;

        RentalHeader.Status := RentalHeader.Status::Active;
        RentalHeader.Modify();
    end;

    procedure ProcessReturn(var RentalHeader: Record "Rental Header")
    var
        RentalLine: Record "Rental Line";
        Bicycle: Record Bicycle;
    begin
        if RentalHeader.Status <> RentalHeader.Status::Active then
            Error('Rental must have status Active to process return.');

        RentalLine.SetRange("Rental No.", RentalHeader."No.");
        if RentalLine.IsEmpty() then
            Error('Rental must have at least one line.');

        RentalLine.FindSet();
        repeat
            if not Bicycle.Get(RentalLine."Bicycle No.") then
                Error('Bicycle %1 does not exist.', RentalLine."Bicycle No.");
        until RentalLine.Next() = 0;

        RentalLine.FindSet();
        repeat
            Bicycle.Get(RentalLine."Bicycle No.");
            Bicycle.Status := Bicycle.Status::Available;
            Bicycle.Modify();
        until RentalLine.Next() = 0;

        RentalHeader."Actual Return Date" := Today;
        RentalHeader.Status := RentalHeader.Status::Returned;
        RentalHeader.Modify();
    end;
}