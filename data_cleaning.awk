```
BEGIN { FS = ","; OFS = "," }
{
    split($3, order_date, "-");
    split($4, ship_date, "-");

    if (length(order_date[1]) == 4) {
        order_date[2] = "01";
        order_date[3] = "01";
    } else {
        order_date[1] = sprintf("%02d", order_date[1]);
        order_date[2] = sprintf("%02d", order_date[2]);
    }

    if (length(ship_date[1]) == 4) {
        ship_date[2] = "01";
        ship_date[3] = "01";
    } else {
        ship_date[1] = sprintf("%02d", ship_date[1]);
        ship_date[2] = sprintf("%02d", ship_date[2]);
    }

    $3 = order_date[3] "-" order_date[2] "-" order_date[1];
    $4 = ship_date[3] "-" ship_date[2] "-" ship_date[1];

    print;
}
```
