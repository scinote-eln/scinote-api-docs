# Inventory Cells

## Get Cells

```shell
curl "https://server-name/api/v1/teams/1/inventories/1/items/1/cells"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
    "data": [
        {
            "id": "1",
            "type": "inventory_cells",
            "attributes": {
                "value_type": "list",
                "value": {
                    "inventory_list_item_id": 1,
                    "inventory_list_item_name": "Potato bug (2)"
                },
                "column_id": 1
            }
        },
        {
            "id": "2",
            "type": "inventory_cells",
            "attributes": {
                "value_type": "text",
                "value": {
                    "text": "new text"
                },
                "column_id": 2
            }
        }
    ],
    "links": {
        "self": "https://server-name/api/v1/teams/1/inventories/1/items/1/cells?page%5Bnumber%5D=1&page%5Bsize%5D=10",
        "first": "https://server-name/api/v1/teams/1/inventories/1/items/1/cells?page%5Bnumber%5D=1&page%5Bsize%5D=10",
        "prev": null,
        "next": null,
        "last": "https://server-name/api/v1/teams/1/inventories/1/items/1/cells?page%5Bnumber%5D=1&page%5Bsize%5D=10"
    }
}
```

This endpoint retrieves cells from specific inventory. Cells can have such types: text, list, file.

### HTTP Request

`GET https://server-name/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/items/<ITEM_ID>/cells`

### URL Parameters

Parameter | Description
--------- | -----------
TEAM_ID | The ID of the team to retrieve inventory from
INVENTORY_ID | The ID of the inventory
ITEM_ID | The ID of the inventory item

## Get Cell

```shell
curl "https://server-name/api/v1/teams/1/inventories/1/items/1/cells/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
    "data": {
        "id": "1",
        "type": "inventory_cells",
        "attributes": {
            "value_type": "list",
            "value": {
                "inventory_list_item_id": 1,
                "inventory_list_item_name": "Potato bug (2)"
            },
            "column_id": 1
        }
    }
}
```

This endpoint retrieves specific cell from the inventory item.

### HTTP Request

`GET https://server-name/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/items/<ITEM_ID>/cells/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
TEAM_ID | The ID of the team to retrieve inventory from
INVENTORY_ID | The ID of the inventory
ITEM_ID | The ID of the inventory item
ID | The ID of the cell

## Create Cell

```shell
curl -X POST \
  https://server-name/api/v1/teams/1/inventories/1/items/1/cells \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
   "data": {
     "type": "inventory_cells",
       "attributes": {
           "value": "new text 1",
           "column_id": 1
       }
    }
  }'
```

> The above command returns JSON structured like this:

```json
{
    "data": {
        "id": "1",
        "type": "inventory_cells",
        "attributes": {
          "value_type": "text",
          "value": {
              "text": "new text 1"
          },
          "column_id": 1
        }
    }
}
```

This endpoint creates new cell in the inventory item.

### HTTP Request

`POST https://server-name/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/items/<ITEM_ID>/cells`

### URL Parameters

Parameter | Description
--------- | -----------
TEAM_ID | The ID of the team to retrieve inventory from
INVENTORY_ID | The ID of the inventory
ITEM_ID | The ID of the inventory item

> Request body

```json
{
    "data": {
    	"type": "inventory_cells",
        "attributes": {
            "value": "new text 1",
            "column_id": 1
        }
    }
}
```

### Inventory cell attributes

Attribute | Mandatory| Description
--------- | -------- | -----------
value | yes | value of the cell, type depends on the column.
column_id | yes | ID of the column

### Inventory cell value attribute format

Column data type | Format of the value
--------- | -----------
text | string containing textual value
number | string containing number value
list | id of the inventory list item from the selected column
checklist | an array of ids of the inventory checklist items from the selected column
status | id of the status item from the selected column
file | hash containing 2 attributes: file_name and file_data. File data is base64 encoded file content in such format: "data:text/plain;base64,dGVzdAo=", mime type should match file content.
date | string containing date in the format "DD.MM.YYYY".
time | string containing time in the format "HH:mm".
date_time | string containing date and time in the format "DD.MM.YYYY HH:mm".
date_range | hash containing 2 attributes: start_time and end_time. Start_time and end_time are strings containing date in the format "DD.MM.YYYY".
time_range | hash containing 2 attributes: start_time and end_time. Start_time and end_time are strings containing time in the format "HH:mm".
date_time_range | hash containing 2 attributes: start_time and end_time. Start_time and end_time are strings containing date and time in the format "DD.MM.YYY HH:mm".

## Update Cell

```shell
curl -X PATCH \
  https://server-name/api/v1/teams/1/inventories/1/items/1/cells/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
    	"id": 1,
    	"type": "inventory_cells",
        "attributes": {
            "value": "new text 2",
            "column_id": 1
        }
    }
}'
```

> The above command returns JSON structured like this:

```json
{
    "data": {
        "id": "1",
        "type": "inventory_cells",
        "attributes": {
            "value_type": "text",
            "value": {
                "text": "new text 2"
            },
            "column_id": 1
        }
    }
}
```

This endpoint updates existing cell in selected inventory item.
If submitted attributes are the same and no changes are made for the cell, server returns empty body with response code 204.

### HTTP Request

`PATCH https://server-name/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/items/<ITEM_ID>/cells/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
TEAM_ID | The ID of the team to retrieve inventory from
INVENTORY_ID | The ID of the inventory
ITEM_ID | The ID of the inventory item
ID | The ID of the cell

> Request body

```json
{
    "data": {
    	"id": 1,
    	"type": "inventory_cells",
        "attributes": {
            "value": "new text 2",
            "column_id": 1
        }
    }
}
```

### Inventory cell attributes

Attribute | Mandatory| Description
--------- | -------- | -----------
value | yes | value of the cell, type depends on the column.
column_id | yes | ID of the column

### Inventory cell value attribute format

Column data type | Format of the value
--------- | -----------
text | string containing textual value
number | string containing number value
list | id of the inventory list item from the selected column
checklist | an array of ids of the inventory checklist items from the selected column
status | id of the status item from the selected column
file | hash containing 2 attributes: file_name and file_data. File data is base64 encoded file content in such format: "data:text/plain;base64,dGVzdAo=", mime type should match file content.
date | string containing date in the format "DD.MM.YYYY".
time | string containing time in the format "HH:mm".
date_time | string containing date and time in the format "DD.MM.YYYY HH:mm".
date_range | hash containing 2 attributes: start_time and end_time. Start_time and end_time are strings containing date in the format "DD.MM.YYYY".
time_range | hash containing 2 attributes: start_time and end_time. Start_time and end_time are strings containing time in the format "HH:mm".
date_time_range | hash containing 2 attributes: start_time and end_time. Start_time and end_time are strings containing date and time in the format "DD.MM.YYY HH:mm".


## Delete Cell

```shell
curl -X DELETE \
  https://server-name/api/v1/teams/1/inventories/1/items/1/cells/1 \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns empty body with status code 200

This endpoint deletes specific cell from the inventory item.

### HTTP Request

`DELETE https://server-name/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/items/<ITEM_ID>/cells/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
TEAM_ID | The ID of the team to retrieve inventory from
INVENTORY_ID | The ID of the inventory to retrieve item from
ITEM_ID | The ID of the item
ID | The ID of the cell
