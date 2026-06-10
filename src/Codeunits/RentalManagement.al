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

    procedure CreateSalesInvoice(var RentalHeader: Record "Rental Header")
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        RentalLine: Record "Rental Line";
        LineNo: Integer;
    begin
        SalesHeader.Init();
        SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
        SalesHeader."Sell-to Customer No." := RentalHeader."Customer No.";
        SalesHeader."Posting Date" := Today;
        SalesHeader.Insert(true);

        LineNo := 10000;
        RentalLine.SetRange("Rental No.", RentalHeader."No.");
        if RentalLine.FindSet() then
            repeat
                SalesLine.Init();
                SalesLine."Document Type" := SalesHeader."Document Type";
                SalesLine."Document No." := SalesHeader."No.";
                SalesLine."Line No." := LineNo;
                SalesLine.Type := SalesLine.Type::Item;
                SalesLine."No." := 'RENTAL';
                SalesLine.Description := RentalLine.Description;
                SalesLine.Quantity := RentalLine."Rental Days";
                SalesLine."Unit Price" := RentalLine."Daily Rate";
                SalesLine.Insert(true);
                LineNo += 10000;
            until RentalLine.Next() = 0;

        Message('Sales Invoice %1 created successfully.', SalesHeader."No.");
    end;

    local procedure CheckMaxActiveRentals(CustomerNo: Code[20])
    var
        RentalHeader: Record "Rental Header";
        Customer: Record Customer;
        ActiveCount: Integer;
    begin
        if not Customer.Get(CustomerNo) then
            exit;

        if Customer."Max Active Rentals" = 0 then
            exit;

        RentalHeader.SetRange("Customer No.", CustomerNo);
        RentalHeader.SetRange(Status, RentalHeader.Status::Active);
        ActiveCount := RentalHeader.Count();

        if ActiveCount >= Customer."Max Active Rentals" then
            Error('Stranka je že dosegla maksimalno dovoljeno število aktivnih izposoj.');
    end;
}