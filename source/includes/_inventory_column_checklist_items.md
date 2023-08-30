# Inventory Column Checklist Items

## Get Checklist Items

```shell
curl "https://<server-name>/api/v1/teams/1/inventories/1/columns/1/checklist_items"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "inventory_checklist_items",
      "attributes": {
        "data": "Item 1"
      }
    },
    {
      "id": "2",
      "type": "inventory_checklist_items",
      "attributes": {
        "data": "Item 2"
      }
    },
    {
      "id": "3",
      "type": "inventory_checklist_items",
      "attributes": {
        "data": "Item 3"
      }
    }
  ],
  "links": {
    "self": "https://<server-name>/api/v1/teams/1/inventories/1/columns/1/checklist_items?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v1/teams/1/inventories/1/columns/1/checklist_items?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v1/teams/1/inventories/1/columns/1/checklist_items?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves checklist items from specific inventory column, only valid for columns with 'checklist' data type.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/columns/<COLUMN_ID>/checklist_items(?filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter    | Description                                                                                            |
| ------------ | ------------------------------------------------------------------------------------------------------ |
| TEAM_ID      | The ID of the team to retrieve inventory from                                                          |
| INVENTORY_ID | The ID of the inventory to retrieve column from                                                        |
| COLUMN_ID    | The ID of the column(with checklist data type) in specified inventory to retrieve checklist items from |
| FROM         | If present will filter inventory column checklist items corresponding timestamp above or equals value  |
| TO           | If present will filter inventory column checklist items corresponding timestamp below or equals value  |

## Get Checklist Item

```shell
curl "https://<server-name>/api/v1/teams/1/inventories/1/columns/1/checklist_items/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "inventory_checklist_items",
    "attributes": {
      "data": "Item 1"
    }
  }
}
```

This endpoint retrieves specific checklist item from inventory column, only valid for columns with 'checklist' data type.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/columns/<COLUMN_ID>/checklist_items/<ID>`

### URL Parameters

| Parameter    | Description                                                                                            |
| ------------ | ------------------------------------------------------------------------------------------------------ |
| TEAM_ID      | The ID of the team to retrieve inventory from                                                          |
| INVENTORY_ID | The ID of the inventory to retrieve column from                                                        |
| COLUMN_ID    | The ID of the column(with checklist data type) in specified inventory to retrieve checklist items from |
| ID           | The ID of the checklist item                                                                           |

## Create Checklist Item

```shell
curl -X POST \
  https://<server-name>/api/v1/teams/1/inventories/1/columns/1/checklist_items \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
        "type": "inventory_checklist_items",
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
    "type": "inventory_checklist_items",
    "attributes": {
      "data": "Item 1"
    }
  }
}
```

This endpoint creates new checklist item in selected inventory column, only valid for columns with 'checklist' data type.

### HTTP Request

`POST https://<server-name>/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/columns/<COLUMN_ID>/checklist_items`

### URL Parameters

| Parameter    | Description                                                                                            |
| ------------ | ------------------------------------------------------------------------------------------------------ |
| TEAM_ID      | The ID of the team to retrieve inventory from                                                          |
| INVENTORY_ID | The ID of the inventory to retrieve column from                                                        |
| COLUMN_ID    | The ID of the column(with checklist data type) in specified inventory to retrieve checklist items from |

### Request body

`{
    "data": {
        "type": "inventory_checklist_items",
        "attributes": {
            "data": "Item 1"
        }
    }
}`

| Attribute | Mandatory | Description                      |
| --------- | --------- | -------------------------------- |
| data      | yes       | Text value of the checklist item |

## Update Checklist Item

```shell
curl -X PATCH \
  https://<server-name>/api/v1/teams/1/inventories/1/columns/1/checklist_items/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
        "id": "1",
        "type": "inventory_checklist_items",
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
    "type": "inventory_checklist_items",
    "attributes": {
      "data": "Item 2"
    }
  }
}
```

This endpoint updates existing checklist item in selected inventory column.
If submitted attributes are the same and no changes are made for the item, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/columns/<COLUMN_ID>/checklist_items/<ID>`

### URL Parameters

| Parameter    | Description                                                                                            |
| ------------ | ------------------------------------------------------------------------------------------------------ |
| TEAM_ID      | The ID of the team to retrieve inventory from                                                          |
| INVENTORY_ID | The ID of the inventory to retrieve column from                                                        |
| COLUMN_ID    | The ID of the column(with checklist data type) in specified inventory to retrieve checklist items from |
| ID           | The ID of the checklist item                                                                           |

### Request body

`{
    "data": {
        "id": "1",
        "type": "inventory_checklist_items",
        "attributes": {
            "data": "Item 2"
        }
    }
}`

| Attribute | Mandatory | Description                      |
| --------- | --------- | -------------------------------- |
| data      | yes       | Text value of the checklist item |

## Delete Checklist Item

```shell
curl -X DELETE \
  https://<server-name>/api/v1/teams/1/inventories/1/columns/1/checklist_items/1 \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns empty body with status code 200

This endpoint deletes specific checklist item from inventory column.

### HTTP Request

`DELETE https://<server-name>/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/columns/<COLUMN_ID>/checklist_items/<ID>`

### URL Parameters

| Parameter    | Description                                                                                            |
| ------------ | ------------------------------------------------------------------------------------------------------ |
| TEAM_ID      | The ID of the team to retrieve inventory from                                                          |
| INVENTORY_ID | The ID of the inventory to retrieve column from                                                        |
| COLUMN_ID    | The ID of the column(with checklist data type) in specified inventory to retrieve checklist items from |
| ID           | The ID of the checklist item                                                                           |
