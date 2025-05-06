# Inventory Items

## Get Items

```shell
curl "https://<server-name>/api/v1/teams/1/inventories/1/items"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
    "data": [
        {
            "id": "1",
            "type": "inventory_items",
            "attributes": {
                "name": "Item 1"
            }
        },
        {
            "id": "2",
            "type": "inventory_items",
            "attributes": {
                "name": "Item 2"
            },
            "relationships": {
                "inventory_cells": {
                    "data": [
                        {
                            "id": "1",
                            "type": "inventory_cells"
                        },
                        {
                            "id": "2",
                            "type": "inventory_cells"
                        }
                    ]
                }
            }
        }
    ]
    "links": {
        "self": "http://<server-name>/api/v1/teams/1/inventories/1/items?page%5Bnumber%5D=1&page%5Bsize%5D=10",
        "first": "http://<server-name>/api/v1/teams/1/inventories/1/items?page%5Bnumber%5D=1&page%5Bsize%5D=10",
        "prev": null,
        "next": "http://<server-name>/api/v1/teams/1/inventories/1/items?page%5Bnumber%5D=2&page%5Bsize%5D=10",
        "last": "http://<server-name>/api/v1/teams/1/inventories/1/items?page%5Bnumber%5D=2&page%5Bsize%5D=10"
    }
}
```

This endpoint retrieves **active** items from specific inventory. To return only **archived** items, set the `?filter[archived]=true` PATH parameter. If `?include=inventory_cells` PATH parameter is provided,
the inventory cells of the items are also included; otherwise, they are ignored.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/items(?include=<INCLUDE_CELLS>&filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>&filter[archived]=<ARCHIVED>)`

### URL Parameters

| Parameter     | Description                                                                          |
| ------------- | ------------------------------------------------------------------------------------ |
| TEAM_ID       | The ID of the team to retrieve inventory from                                        |
| INVENTORY_ID  | The ID of the inventory to retrieve items from                                       |
| INCLUDE_CELLS | if set to `inventory_cells`, inventory cells of the items are also included          |
| FROM          | If present will filter inventory items corresponding timestamp above or equals value |
| TO            | If present will filter inventory items corresponding timestamp below or equals value |
| ARCHIVED      | If set to `true` return only archived inventory items. If set to `false` return only active inventory items |

## Get Item

```shell
curl "https://<server-name>/api/v1/teams/1/inventories/1/items/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
    "data": {
        "id": "1",
        "type": "inventory_items",
        "attributes": {
            "name": "POY/3"
        },
        "relationships": {
            "inventory_cells": {
                "data": [
                    {
                        "id": "1",
                        "type": "inventory_cells"
                    },
                    {
                        "id": "2",
                        "type": "inventory_cells"
                    },
                    {
                        "id": "3",
                        "type": "inventory_cells"
                    }
                }
                ]
            }
        }
    },
    "included": [
        {
            "id": "1",
            "type": "inventory_cells",
            "attributes": {
                "value_type": "list",
                "value": {
                    "inventory_list_item_id": 1,
                    "inventory_list_item_name": "Potato leaves"
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
                    "text": "#6C159E"
                },
                "column_id": 2
            }
        },
        {
            "id": "3",
            "type": "inventory_cells",
            "attributes": {
                "value_type": "file",
                "value": {
                    "file_id": 1,
                    "file_name": <file-name>,
                    "file_size": 38157,
                    "url": <file-url>
                },
                "column_id": 3
            }
        }
    ]
}
```

This endpoint retrieves specific item from the inventory. Cells are included by default.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/items/<ID>`

### URL Parameters

| Parameter    | Description                                   |
| ------------ | --------------------------------------------- |
| TEAM_ID      | The ID of the team to retrieve inventory from |
| INVENTORY_ID | The ID of the inventory to retrieve item from |
| ID           | The ID of the item                            |

## Create Item

```shell
curl -X POST \
  https://<server-name>/api/v1/teams/1/inventories/1/items \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
   "data": {
       "type": "inventory_items",
       "attributes": {
           "name": "POY/3"
       }
   },
   "included": [
       {
           "type": "inventory_cells",
           "attributes": {
               "value": 1,
               "column_id": 1
           }
       },
       {
           "type": "inventory_cells",
           "attributes": {
               "value": "#6C159E",
               "column_id": 2
           }
       }
   ]
 }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "inventory_items",
    "attributes": {
      "name": "POY/3"
    },
    "relationships": {
      "inventory_cells": {
        "data": [
          {
            "id": "1",
            "type": "inventory_cells"
          },
          {
            "id": "2",
            "type": "inventory_cells"
          }
        ]
      }
    }
  },
  "included": [
    {
      "id": "1",
      "type": "inventory_cells",
      "attributes": {
        "value_type": "list",
        "value": {
          "inventory_list_item_id": 1,
          "inventory_list_item_name": "Potato leaves"
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
          "text": "#6C159E"
        },
        "column_id": 2
      }
    }
  ]
}
```

This endpoint creates new item in the inventory, cells can be also added in 'included' section.

### HTTP Request

`POST https://<server-name>/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/items`

### URL Parameters

| Parameter    | Description                                   |
| ------------ | --------------------------------------------- |
| TEAM_ID      | The ID of the team to retrieve inventory from |
| INVENTORY_ID | The ID of the inventory                       |

> Request body

```json
{
  "data": {
    "type": "inventory_items",
    "attributes": {
      "name": "POY/3"
    }
  },
  "included": [
    {
      "type": "inventory_cells",
      "attributes": {
        "value": 1,
        "column_id": 1
      }
    },
    {
      "type": "inventory_cells",
      "attributes": {
        "value": "#6C159E",
        "column_id": 2
      }
    }
  ]
}
```

### Inventory item attributes

| Attribute | Mandatory | Description      |
| --------- | --------- | ---------------- |
| name      | yes       | Name of the item |

### Inventory cell attributes

| Attribute | Mandatory | Description                                 |
| --------- | --------- | ------------------------------------------- |
| value     | yes       | Content of the cell, depends on column type |
| column_id | yes       | ID of the column                            |

## Update Item

```shell
curl -X PATCH \
  https://<server-name>/api/v1/teams/1/inventories/1/items/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
        "id": "1",
        "type": "inventory_items",
        "attributes": {
            "name": "POY/4"
        }
    },
    "included": [
        {
            "id": "1",
            "type": "inventory_cells",
            "attributes": {
                "value": 2,
                "column_id": 1
            }
        },
        {
            "id": "2",
            "type": "inventory_cells",
            "attributes": {
                "value": "#6C159D",
                "column_id": 2
            }
        }
    ]
}'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "inventory_items",
    "attributes": {
      "name": "POY/4"
    },
    "relationships": {
      "inventory_cells": {
        "data": [
          {
            "id": "1",
            "type": "inventory_cells"
          },
          {
            "id": "2",
            "type": "inventory_cells"
          }
        ]
      }
    }
  },
  "included": [
    {
      "id": "1",
      "type": "inventory_cells",
      "attributes": {
        "value_type": "list",
        "value": {
          "inventory_list_item_id": 2,
          "inventory_list_item_name": "Tea leaves (1)"
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
          "text": "#6C159D"
        },
        "column_id": 2
      }
    }
  ]
}
```

This endpoint updates existing item in selected inventory.
Also existing cells can be updated by adding them to 'included' section.
If submitted attributes are the same and no changes are made for the item, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/items/<ID>`

### URL Parameters

| Parameter    | Description                                   |
| ------------ | --------------------------------------------- |
| TEAM_ID      | The ID of the team to retrieve inventory from |
| INVENTORY_ID | The ID of the inventory to retrieve item from |
| ID           | The ID of the item                            |

> Request body

```json
{
  "data": {
    "id": "1",
    "type": "inventory_items",
    "attributes": {
      "name": "POY/4"
    }
  },
  "included": [
    {
      "id": "1",
      "type": "inventory_cells",
      "attributes": {
        "value": 2,
        "column_id": 1
      }
    },
    {
      "id": "2",
      "type": "inventory_cells",
      "attributes": {
        "value": "#6C159D",
        "column_id": 2
      }
    }
  ]
}
```

### Inventory item attributes

| Attribute | Mandatory | Description      |
| --------- | --------- | ---------------- |
| name      | no        | Name of the item |

### Inventory cell attributes

| Attribute | Mandatory | Description                                 |
| --------- | --------- | ------------------------------------------- |
| value     | yes       | Content of the cell, depends on column type |
| column_id | yes       | ID of the column                            |

## Delete Item

```shell
curl -X DELETE \
  https://<server-name>/api/v1/teams/1/inventories/1/items/1 \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns empty body with status code 200

This endpoint deletes specific item from the inventory.

### HTTP Request

`DELETE https://<server-name>/api/v1/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/items/<ID>`

### URL Parameters

| Parameter    | Description                                   |
| ------------ | --------------------------------------------- |
| TEAM_ID      | The ID of the team to retrieve inventory from |
| INVENTORY_ID | The ID of the inventory to retrieve item from |
| ID           | The ID of the item                            |
