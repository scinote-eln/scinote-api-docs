# Inventory Column Status Items

## Get Status Items

```shell
curl "https://<server-name>/api/v1/teams/1/inventories/1/columns/1/status_items"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "inventory_status_items",
      "attributes": {
        "status": "status 1",
        "icon": "icon 1"
      }
    },
    {
      "id": "2",
      "type": "inventory_status_items",
      "attributes": {
        "status": "status 2",
        "icon": "icon 2"
      }
    },
    {
      "id": "3",
      "type": "inventory_status_items",
      "attributes": {
        "status": "status 3",
        "icon": "icon 3"
      }
    }
  ],
  "links": {
    "self": "https://<server-name>/api/v1/teams/1/inventories/1/columns/1/status_items?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v1/teams/1/inventories/1/columns/1/status_items?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v1/teams/1/inventories/1/columns/1/status_items?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves status items from specific inventory column, only valid for columns with 'status' data type.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/columns/<COLUMN_ID>/status_items(?created_at[from]=<FROM>&created_at[to]=<TO>&updated_at[from]=<FROM>&updated_at[to]=<TO>)`

### URL Parameters

| Parameter    | Description                                                                                        |
| ------------ | -------------------------------------------------------------------------------------------------- |
| TEAM_ID      | The ID of the team to retrieve inventory from                                                      |
| INVENTORY_ID | The ID of the inventory to retrieve column from                                                    |
| COLUMN_ID    | The ID of the column(with status data type) in specified inventory to retrieve status items from   |
| FROM         | If present will filter inventory column status items corresponding timestamp above or equals value |
| TO           | If present will filter inventory column status items corresponding timestamp below or equals value |

## Get Status Item

```shell
curl "https://<server-name>/api/v1/teams/1/inventories/1/columns/1/status_items/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "inventory_status_items",
    "attributes": {
      "data": "status 1",
      "icon": "icon 1"
    }
  }
}
```

This endpoint retrieves specific status item from inventory column, only valid for columns with 'status' data type.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/columns/<COLUMN_ID>/status_items/<ID>`

### URL Parameters

| Parameter    | Description                                                                                      |
| ------------ | ------------------------------------------------------------------------------------------------ |
| TEAM_ID      | The ID of the team to retrieve inventory from                                                    |
| INVENTORY_ID | The ID of the inventory to retrieve column from                                                  |
| COLUMN_ID    | The ID of the column(with status data type) in specified inventory to retrieve status items from |
| ID           | The ID of the status item                                                                        |

## Create Status Item

```shell
curl -X POST \
  https://<server-name>/api/v1/teams/1/inventories/1/columns/1/status_items \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
        "type": "inventory_status_items",
        "attributes": {
            "status": "status 1",
            "icon": "icon"
        }
    }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "inventory_status_items",
    "attributes": {
      "status": "status 1",
      "icon": "icon"
    }
  }
}
```

This endpoint creates new status item in selected inventory column, only valid for columns with 'status' data type.

### HTTP Request

`POST https://<server-name>/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/columns/<COLUMN_ID>/status_items`

### URL Parameters

| Parameter    | Description                                                                                      |
| ------------ | ------------------------------------------------------------------------------------------------ |
| TEAM_ID      | The ID of the team to retrieve inventory from                                                    |
| INVENTORY_ID | The ID of the inventory to retrieve column from                                                  |
| COLUMN_ID    | The ID of the column(with status data type) in specified inventory to retrieve status items from |

### Request body

`{
    "data": {
        "type": "inventory_status_items",
        "attributes": {
            "status": "status 1",
            "icon": "icon"
        }
    }
}`

| Attribute | Mandatory | Description             |
| --------- | --------- | ----------------------- |
| status    | yes       | Name of the status item |
| icon      | yes       | Icon of the status item |

## Update Status Item

```shell
curl -X PATCH \
  https://<server-name>/api/v1/teams/1/inventories/1/columns/1/status_items/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
        "id": "1",
        "type": "inventory_status_items",
        "attributes": {
            "status": "status 2"
        }
    }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "inventory_status_items",
    "attributes": {
      "status": "status 2",
      "icon": "icon"
    }
  }
}
```

This endpoint updates existing status item in selected inventory column.
If submitted attributes are the same and no changes are made for the item, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/columns/<COLUMN_ID>/status_items/<ID>`

### URL Parameters

| Parameter    | Description                                                                                      |
| ------------ | ------------------------------------------------------------------------------------------------ |
| TEAM_ID      | The ID of the team to retrieve inventory from                                                    |
| INVENTORY_ID | The ID of the inventory to retrieve column from                                                  |
| COLUMN_ID    | The ID of the column(with status data type) in specified inventory to retrieve status items from |
| ID           | The ID of the status item                                                                        |

### Request body

`{
    "data": {
        "id": "1",
        "type": "inventory_status_items",
        "attributes": {
            "status": "status 2"
        }
    }
}`

| Attribute | Mandatory | Description             |
| --------- | --------- | ----------------------- |
| status    | yes       | Name of the status item |

## Delete Status Item

```shell
curl -X DELETE \
  https://<server-name>/api/v1/teams/1/inventories/1/columns/1/status_items/1 \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns empty body with status code 200

This endpoint deletes specific status item from inventory column.

### HTTP Request

`DELETE https://<server-name>/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/columns/<COLUMN_ID>/status_items/<ID>`

### URL Parameters

| Parameter    | Description                                                                                      |
| ------------ | ------------------------------------------------------------------------------------------------ |
| TEAM_ID      | The ID of the team to retrieve inventory from                                                    |
| INVENTORY_ID | The ID of the inventory to retrieve column from                                                  |
| COLUMN_ID    | The ID of the column(with status data type) in specified inventory to retrieve status items from |
| ID           | The ID of the status item                                                                        |
