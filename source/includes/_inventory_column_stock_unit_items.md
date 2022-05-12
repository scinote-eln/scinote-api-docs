# Inventory Column Stock Unit Items

## Get Stock Unit Items

```shell
curl "https://<server-name>/api/v1/teams/1/inventories/1/columns/1/stock_unit_items"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
    "data": [
        {
            "id": "1",
            "type": "inventory_stock_unit_items",
            "attributes": {
                "data": "Item 1"
            }
        },
        {
            "id": "2",
            "type": "inventory_stock_unit_items",
            "attributes": {
                "data": "Item 2"
            }
        },
        {
            "id": "3",
            "type": "inventory_stock_unit_items",
            "attributes": {
                "data": "Item 3"
            }
        }
    ],
    "links": {
        "self": "https://<server-name>/api/v1/teams/1/inventories/1/columns/1/stock_unit_items?page%5Bnumber%5D=1&page%5Bsize%5D=10",
        "first": "https://<server-name>/api/v1/teams/1/inventories/1/columns/1/stock_unit_items?page%5Bnumber%5D=1&page%5Bsize%5D=10",
        "prev": null,
        "next": null,
        "last": "https://<server-name>/api/v1/teams/1/inventories/1/columns/1/stock_unit_items?page%5Bnumber%5D=1&page%5Bsize%5D=10"
    }
}
```

This endpoint retrieves stock unit items from specific inventory column, only valid for columns with 'stock' data type.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/columns/<COLUMN_ID>/stock_unit_items`

### URL Parameters

Parameter | Description
--------- | -----------
TEAM_ID | The ID of the team to retrieve inventory from
INVENTORY_ID | The ID of the inventory to retrieve column from
COLUMN_ID | The ID of the column(with stock data type) in specified inventory to retrieve stock unit items from

## Get Stock Unit Item

```shell
curl "https://<server-name>/api/v1/teams/1/inventories/1/columns/1/stock_unit_items/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
    "data": {
        "id": "1",
        "type": "inventory_stock_unit_items",
        "attributes": {
            "data": "Item 1"
        }
    }
}
```

This endpoint retrieves specific stock unit item from inventory column, only valid for columns with 'stock' data type.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/columns/<COLUMN_ID>/stock_unit_items/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
TEAM_ID | The ID of the team to retrieve inventory from
INVENTORY_ID | The ID of the inventory to retrieve column from
COLUMN_ID | The ID of the column(with stock data type) in specified inventory to retrieve stock unit items from
ID | The ID of the stock unit item

## Create Stock Unit Item

```shell
curl -X POST \
  https://<server-name>/api/v1/teams/1/inventories/1/columns/1/stock_unit_items \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
        "type": "inventory_stock_unit_items",
        "attributes": {
            "data": "Item 1"
        }
    }
  }'
```

> The above command returns JSON structured like this:

```json
{
    "data": {
        "id": "1",
        "type": "inventory_stock_unit_items",
        "attributes": {
            "data": "Item 1"
        }
    }
}
```

This endpoint creates new stock unit item in selected inventory column, only valid for columns with 'stock' data type.

### HTTP Request

`POST https://<server-name>/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/columns/<COLUMN_ID>/stock_unit_items`

### URL Parameters

Parameter | Description
--------- | -----------
TEAM_ID | The ID of the team to retrieve inventory from
INVENTORY_ID | The ID of the inventory to retrieve column from
COLUMN_ID | The ID of the column(with stock data type) in specified inventory to retrieve stock unit items from

### Request body

`{
    "data": {
        "type": "inventory_stock_unit_items",
        "attributes": {
            "data": "Item 1"
        }
    }
}`

Attribute | Mandatory| Description
--------- | -------- | -----------
data | yes | Text value of the stock unit item

## Update Stock Unit Item

```shell
curl -X PATCH \
  https://<server-name>/api/v1/teams/1/inventories/1/columns/1/stock_unit_items/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
        "id": "1",
        "type": "inventory_stock_unit_items",
        "attributes": {
            "data": "Item 2"
        }
    }
  }'
```

> The above command returns JSON structured like this:

```json
{
    "data": {
        "id": "1",
        "type": "inventory_stock_unit_items",
        "attributes": {
            "data": "Item 2"
        }
    }
}
```

This endpoint updates existing stock unit item in selected inventory column.
If submitted attributes are the same and no changes are made for the item, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/columns/<COLUMN_ID>/stock_unit_items/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
TEAM_ID | The ID of the team to retrieve inventory from
INVENTORY_ID | The ID of the inventory to retrieve column from
COLUMN_ID | The ID of the column(with stock data type) in specified inventory to retrieve stock unit items from
ID | The ID of the stock unit item

### Request body

`{
    "data": {
        "id": "1",
        "type": "inventory_stock_unit_items",
        "attributes": {
            "data": "Item 2"
        }
    }
}`

Attribute | Mandatory| Description
--------- | -------- | -----------
data | yes | Text value of the stock unit item

## Delete Stock Unit Item

```shell
curl -X DELETE \
  https://<server-name>/api/v1/teams/1/inventories/1/columns/1/stock_unit_items/1 \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns empty body with status code 200

This endpoint deletes specific stock unit item from inventory column.

### HTTP Request

`DELETE https://<server-name>/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/columns/<COLUMN_ID>/stock_unit_items/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
TEAM_ID | The ID of the team to retrieve inventory from
INVENTORY_ID | The ID of the inventory to retrieve column from
COLUMN_ID | The ID of the column(with stock data type) in specified inventory to retrieve stock unit items from
ID | The ID of the stock unit item
