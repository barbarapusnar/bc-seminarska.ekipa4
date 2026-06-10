xmlport 50100 "Bicycle Import"
{
    Caption = 'Bicycle Import';
    Direction = Import;
    Format = Xml;

    schema
    {
        textelement(Bicycles)
        {
            tableelement(Bicycle; Bicycle)
            {
                XmlName = 'Bicycle';

                fieldelement(No; Bicycle."No.")
                {
                    XmlName = 'No';
                }

                fieldelement(RentalTypeCode; Bicycle."Rental Type Code")
                {
                    XmlName = 'RentalTypeCode';
                }

                fieldelement(Description; Bicycle.Description)
                {
                    XmlName = 'Description';
                }

                trigger OnBeforeInsertRecord()
                var
                    RentalType: Record "Rental Type";
                begin
                    if not RentalType.Get(Bicycle."Rental Type Code") then begin
                        currXMLport.Skip();
                        exit;
                    end;
                end;
            }
        }
    }
}