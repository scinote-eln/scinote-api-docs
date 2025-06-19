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
                "name": "Item 1",
                "archived": false,
                "archived_on": null
            }
        },
        {
            "id": "2",
            "type": "inventory_items",
            "attributes": {
                "name": "Item 2",
                "archived": false,
                "archived_on": null
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
            "name": "POY/3",
            "archived": false,
            "archived_on": null
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
      "name": "POY/3",
      "archived": false,
      "archived_on": null
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
      "name": "POY/3",
      "archived": false,
      "archived_on": null
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
            "name": "POY/4",
            "archived": true
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
      "name": "POY/4",
      "archived": true,
      "archived_on": "2025-12-11T13:25:53.910Z"
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

| Attribute | Mandatory | Description                                    |
| --------- | --------- | ---------------------------------------------- |
| name      | no        | Name of the item                               |
| archived  | no        | true/false, set the archived state of the item |

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

#### Filtering Inventory Items by Column Data

The `/items` endpoint supports filtering capabilities based on inventory column values. This enables users to retrieve data more precisely, using column-specific conditions related to different data types (e.g., text, number, list, file, etc.).

## Filter Items by column values

To filter by column data:
`/items?filter[inventory_column][id]=<COLUMN_ID>&filter[inventory_column][value][operator]=<OPERATOR>&filter[inventory_column][value][<PARAMETER>]=<VALUE>`

- `filter[inventory_column][id]`: The ID of the inventory column you wish to filter on.
- `filter[inventory_column][value][operator]`: Filtering logic operator (depends on column type).
- `filter[inventory_column][value][<PARAMETER>]`: The actual data you're filtering by (text, number, item_ids, dates, etc.).

> You can apply multiple column filters by repeating the structure with different keys:
> `filter[inventory_column_1]...`, `filter[inventory_column_2]...` etc.

---

#### Filter Options by Column Type

Different column types support specific operators and value parameters, as detailed below:

---

#### Text Column

Filter Parameter: text

| Operator         | Description                   |
|------------------|-------------------------------|
| contains         | Matches items containing text |
| doesnt_contain   | Excludes items containing text|

Example:
`filter[inventory_column][id]=12345&filter[inventory_column][value][operator]=contains&filter[inventory_column][value][text]=book`


---

#### Number Column

Filter Parameter(s): number or from / to

| Operator                 | Description                                  |
|--------------------------|----------------------------------------------|
| equal_to                 | Exact match                                  |
| unequal_to               | Not equal                                    |
| greater_than             | Greater than                                 |
| greater_than_or_equal_to| Greater or equal                              |
| less_than                | Less than                                    |
| less_than_or_equal_to   | Less than or equal                            |
| between                  | Between a number range (requires from & to)  |

Example:
`filter[inventory_column][id]=9923&filter[inventory_column][value][operator]=between&filter[inventory_column][value][from]=10&filter[inventory_column][value][to]=100`


---

#### File Column

Filter Parameter: text

| Operator       | Description                           |
|----------------|---------------------------------------|
| file_contains  | Matches file name or metadata         |
| file_attached  | Checks that a file is attached        |

Example:

`filter[inventory_column][id]=200&filter[inventory_column][value][operator]=file_contains&filter[inventory_column][value][text]=book`


---

#### Checklist Column

Filter Parameter: item_ids (array)

| Operator  | Description                                            |
|-----------|--------------------------------------------------------|
| any_of    | Items that contain ANY of the given checklist items   |
| all_of    | Items that contain ALL of the given checklist items   |
| none_of   | Items that contain NONE of the given checklist items  |

Example:

`filter[inventory_column][id]=4576&filter[inventory_column][value][operator]=any_of&filter[inventory_column][value][item_ids][]=12&filter[inventory_column][value][item_ids][]=23`



---

#### Date Column

Filter Parameters: `date`, or `start_date` / `end_date`

| Operator        | Description                        |
|------------------|------------------------------------|
| today            | Items with today's date            |
| yesterday        | Items matching yesterday           |
| this_month       | Items created this month           |
| last_year        | Last calendar year                 |
| equal_to         | Exact date match                   |
| greater_than     | After date                         |
| between          | Between two given dates            |

Example:

`filter[inventory_column][id]=5591&filter[inventory_column][value][operator]=between&filter[inventory_column][value][start_date]=2024-01-01&filter[inventory_column][value][end_date]=2024-03-31`



---

#### Time Column

Filter Parameters: `time`, or `start_time` / `end_time`

Similar operators apply as with date columns.

Example:

`filter[inventory_column][id]=9191&filter[inventory_column][value][operator]=greater_than&filter[inventory_column][value][time]=13:00`


---

#### DateTime / DateTime Range Columns

Filter Parameters: `datetime` or `start_datetime` / `end_datetime`

| Operator        | Description                        |
|------------------|------------------------------------|
| today            | Items posted today                 |
| last_week        | Items from last week               |
| equal_to         | Exact datetime match               |
| between          | Between two datetime ranges        |

Example:

`filter[inventory_column][id]=331&filter[inventory_column][value][operator]=between&filter[inventory_column][value][start_datetime]=2024-04-01T09:00:00Z&filter[inventory_column][value][end_datetime]=2024-05-01T17:00:00Z`


---

#### List, Status Columns

Filter Parameter: item_ids (array)

| Operator | Description                              |
|----------|------------------------------------------|
| any_of   | Includes at least one selected item      |
| none_of  | Excludes all selected items              |
| all_of   | Includes all listed items (Status only)  |

Example:

`filter[inventory_column][id]=8844&filter[inventory_column][value][operator]=any_of&filter[inventory_column][value][item_ids][]=1001&filter[inventory_column][value][item_ids][]=1002`


---

#### Stock Column

Filter Parameter(s): value, from, to

| Operator                 | Description                                  |
|--------------------------|----------------------------------------------|
| equal_to                 | Exact stock quantity                         |
| greater_than             | Stock above a value                          |
| between                  | Between a stock range (requires from & to)   |

Example:

`filter[inventory_column][id]=777&filter[inventory_column][value][operator]=greater_than&filter[inventory_column][value][value]=500`

---

#### Notes

- All filter values must match the expected type (string, number, dates, arrays).
- All dates and datetimes must be in ISO 8601 format (e.g., 2024-01-01 or 2024-06-05T14:00:00Z).
