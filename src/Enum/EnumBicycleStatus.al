enum 50100 "Bicycle Status"
{
    Extensible = true;

    value(0; Available) { Caption = 'Available'; }
    value(1; Rented) { Caption = 'Rented'; }
    value(2; Maintenance) { Caption = 'Maintenance'; }
    value(3; Retired) { Caption = 'Retired'; }
}