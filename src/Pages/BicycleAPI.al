page 50109 "Bicycle API"
{
    PageType = API;
    APIPublisher = 'defaultpublisher';
    APIGroup = 'bicycle';
    APIVersion = 'v1.0';
    EntityName = 'bicycle';
    EntitySetName = 'bicycles';
    SourceTable = Bicycle;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(no; Rec."No.") { Caption = 'No.'; }
                field(description; Rec.Description) { Caption = 'Description'; }
                field(status; Rec.Status ) { Caption = 'Status'; }
                field(rentalTypeCode; Rec."Rental Type Code") { Caption = 'Rental Type'; }
            }
        }
    }
}