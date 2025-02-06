# Task Inventory Items

## Get Task Inventory Items

```shell
curl "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/2/items"
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
        "name": "BOX/1",
        "archived": false,
        "created_at": "2021-03-12T19:44:10.627Z",
        "updated_at": "2022-03-24T13:33:21.291Z",
        "stock_consumption": "130.0" // present if item contains a stock cell
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
        },
        "inventory": {
          "data": {
            "id": "1",
            "type": "inventories"
          }
        }
      }
    },
    {
      "id": "2",
      "type": "inventory_items",
      "attributes": {
        "name": "BOX/2"
      },
      "relationships": {
        "inventory_cells": {
          "data": [
            {
              "id": "3",
              "type": "inventory_cells"
            },
            {
              "id": "4",
              "type": "inventory_cells"
            }
          ]
        },
        "inventory": {
          "data": {
            "id": "1",
            "type": "inventories"
          }
        }
      }
    }
  ],
  "links": {
    "self": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/2/items?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/2/items?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/2/items?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all Inventory Items, that are assigned to the specified task.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/items(?filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter     | Description                                                                                        |
| ------------- | -------------------------------------------------------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from                                                        |
| PROJECT_ID    | The ID of the project to retrieve experiment from                                                  |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from                                                     |
| TASK_ID       | The ID of the task to retrieve inventory items from                                                |
| FROM          | If present will filter task assigned inventory items corresponding timestamp above or equals value |
| TO            | If present will filter task assigned inventory items corresponding timestamp below or equals value |

## Get Task Inventory Item

```shell
curl "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/2/items/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "inventory_items",
    "attributes": {
      "name": "BOX/1",
      "archived": false,
      "created_at": "2021-03-12T19:44:10.627Z",
      "updated_at": "2022-03-24T13:33:21.291Z",
      "stock_consumption": "130.0" // present if item contains a stock cell
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
      },
      "inventory": {
        "data": {
          "id": "1",
          "type": "inventories"
        }
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
        "value_type": "list",
        "value": {
          "inventory_list_item_id": 6,
          "inventory_list_item_name": "Seed"
        },
        "column_id": 2
      }
    },
    {
      "id": "1",
      "type": "inventories",
      "attributes": {
        "name": "Samples"
      },
      "relationships": {
        "created_by": {
          "data": {
            "id": "1",
            "type": "users"
          }
        }
      }
    }
  ]
}
```

This endpoint retrieves a specific inventory item, that is assigned to the specific task.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/items/<ITEM_ID>`

### URL Parameters

| Parameter     | Description                                        |
| ------------- | -------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from        |
| PROJECT_ID    | The ID of the project to retrieve experiment from  |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from     |
| TASK_ID       | The ID of the task to retrieve inventory item from |
| ITEM_ID       | The ID of the inventory item to retrieve           |


## Create Task Inventory Item

```shell
curl 'http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/2/items' \
  -H 'Authorization: Bearer qwerty123456...' \
  -d '{
    "data": {
      "type": "inventory_items",
      "attributes": {
        "item_id": 1
      }
    }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "inventory_items",
      "attributes": {
        "name": "BOX/1",
        "archived": false,
        "created_at": "2021-03-12T19:44:10.627Z",
        "updated_at": "2022-03-24T13:33:21.291Z",
        "stock_consumption": "130.0" // present if item contains a stock cell
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
        },
        "inventory": {
          "data": {
            "id": "1",
            "type": "inventories"
          }
        }
      }
    },
    {
      "id": "2",
      "type": "inventory_items",
      "attributes": {
        "name": "BOX/2"
      },
      "relationships": {
        "inventory_cells": {
          "data": [
            {
              "id": "3",
              "type": "inventory_cells"
            },
            {
              "id": "4",
              "type": "inventory_cells"
            }
          ]
        },
        "inventory": {
          "data": {
            "id": "1",
            "type": "inventories"
          }
        }
      }
    }
  ],
  "links": {
    "self": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/2/items?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/2/items?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/2/items?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint assign inventory item to the specified task.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/items(?include=<INCLUDES>)`

### URL Parameters

| Parameter     | Description                                                                                        |
| ------------- | -------------------------------------------------------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from                                                        |
| PROJECT_ID    | The ID of the project to retrieve experiment from                                                  |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from                                                     |
| TASK_ID       | The ID of the task to assign inventory item                                                        |
| INCLUDES      | Can set to include `inventory_cells` data                                                          |

> Request body

```json
{
  "data": {
    "type": "inventory_items",
    "attributes": {
      "item_id": 1
    }
  }
}
```

### Inventory item attributes

| Attribute                 | Mandatory | Description                                                                          |
| ------------------------- | --------- | ------------------------------------------------------------------------------------ |
| item_id                   | yes       | The ID of the inventory item to assing task                                          |


## Update Task Inventory Item

```shell
curl -X POST \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/2/items/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
	"data": {
		"type": "inventory_items",
		"attributes": {
			"stock_consumption": 100.0,
      "stock_consumption_comment": "Some comment"
		}
	}
}'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "inventory_items",
    "attributes": {
      "name": "BOX/1",
      "archived": false,
      "created_at": "2021-03-12T19:44:10.627Z",
      "updated_at": "2022-03-24T13:33:21.291Z",
      "stock_consumption": "100.0"
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
      },
      "inventory": {
        "data": {
          "id": "1",
          "type": "inventories"
        }
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
        "value_type": "list",
        "value": {
          "inventory_list_item_id": 6,
          "inventory_list_item_name": "Seed"
        },
        "column_id": 2
      }
    },
    {
      "id": "1",
      "type": "inventories",
      "attributes": {
        "name": "Samples"
      },
      "relationships": {
        "created_by": {
          "data": {
            "id": "1",
            "type": "users"
          }
        }
      }
    }
  ]
}
```

This endpoint updates a specific inventory item, that is assigned to the specific task.

### HTTP Request

`PATCH https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/items/<ITEM_ID>`

### URL Parameters

| Parameter     | Description                                        |
| ------------- | -------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from        |
| PROJECT_ID    | The ID of the project to retrieve experiment from  |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from     |
| TASK_ID       | The ID of the task to retrieve inventory item from |
| ITEM_ID       | The ID of the inventory item to retrieve           |

> Request body

```json
{
  "data": {
    "type": "inventory_items",
    "attributes": {
      "stock_consumption": 100.0,
      "stock_consumption_comment": "Some comment"
    }
  }
}
```

### Inventory item attributes

| Attribute                 | Mandatory | Description                                                                          |
| ------------------------- | --------- | ------------------------------------------------------------------------------------ |
| stock_consumption         | yes       | Stock consumption to be set on the item.                                             |
| stock_consumption_comment | no        | Stock consumption comment to be set on the item. This will be recorded in the ledger |

## Delete Task Inventory Item

```shell
curl -X DELETE \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/2/items/1 \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns empty body with status code 200

This endpoint deletes specific assigned inventory item from the task.

### HTTP Request

`DELETE https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/items/<ID>`

### URL Parameters

| Parameter     | Description                                                                                        |
| ------------- | -------------------------------------------------------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from                                                        |
| PROJECT_ID    | The ID of the project to retrieve experiment from                                                  |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from                                                     |
| TASK_ID       | The ID of the task to assigned inventory item                                                      |
| ID            | The ID of the inventory item to assigned task                                                      |

