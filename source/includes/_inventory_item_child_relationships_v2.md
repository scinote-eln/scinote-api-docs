# Inventory Item Child Relationships V2

## Get Inventory Item Child Relationships

```shell
curl \
  https://<server-name>/api/v2/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/items/<ITEM_ID>/child_relationships \
  -H 'Authorization: Bearer your_token_here' \
  -H 'Content-Type: application/json'
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "inventory_item_relationships",
      "relationships": {
        "parent": {
          "data": {
            "id": "1",
            "type": "inventory_items"
          }
        },
        "child": {
          "data": {
            "id": "2",
            "type": "inventory_items"
          }
        },
        "created_by": {
          "data": {
            "id": "1",
            "type": "users"
          }
        },
        "last_modified_by": {
          "data": {
            "id": "1",
            "type": "users"
          }
        }
      }
    },
    {
      "id": "2",
      "type": "inventory_item_relationships",
      "relationships": {
        "parent": {
          "data": {
            "id": "2",
            "type": "inventory_items"
          }
        },
        "child": {
          "data": {
            "id": "1",
            "type": "inventory_items"
          }
        },
        "created_by": {
          "data": {
            "id": "1",
            "type": "users"
          }
        },
        "last_modified_by": {
          "data": {
            "id": "1",
            "type": "users"
          }
        }
      }
    }
  ],
  "links": {
    "self": "https://<server-name>/api/v1/teams/1/inventories/1/items/1/child_relationships?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v1/teams/1/inventories/1/items/1/child_relationships?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v1/teams/1/inventories/1/items/1/child_relationships?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all child relationships from the specified inventory item.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/items/<ITEM_ID>/child_relationships`

### URL Parameters

| Parameter	      | Description                                              |
|-----------------|----------------------------------------------------------|
| TEAM_ID	        | The ID of the team                                       |
| INVENTORY_ID    | The ID of the inventory containing the item              |
| ITEM_ID         | The ID of the item for which to delete the relationship  |

## Get Inventory Item Child Relationship

```shell
curl \
  https://<server-name>/api/v2/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/items/<ITEM_ID>/child_relationships/<ID> \
  -H 'Authorization: Bearer your_token_here' \
  -H 'Content-Type: application/json'
```

> The above command returns JSON structured like this:

```json
{
    "data": {
      "id": "1",
      "type": "inventory_item_relationships",
      "relationships": {
        "parent": {
          "data": {
            "id": "1",
            "type": "inventory_items"
          }
        },
        "child": {
          "data": {
            "id": "2",
            "type": "inventory_items"
          }
        },
        "created_by": {
          "data": {
            "id": "1",
            "type": "users"
          }
        },
        "last_modified_by": {
          "data": {
            "id": "1",
            "type": "users"
          }
        }
      }
    }
}
```

This endpoint retrieves a specific child relationship from the specified inventory item.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/items/<ITEM_ID>/child_relationships/<ID>`

### URL Parameters

| Parameter	      | Description                                              |
|-----------------|----------------------------------------------------------|
| TEAM_ID	        | The ID of the team                                       |
| INVENTORY_ID    | The ID of the inventory containing the item              |
| ITEM_ID         | The ID of the item for which to delete the relationship  |
| ID              | The ID of the relationship to show                       |

## Create Inventory Item Child Relationship


```shell
curl -X POST \
  https://<server-name>/api/v2/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/items/<ITEM_ID>/child_relationships \
  -H 'Authorization: Bearer your_token_here' \
  -H 'Content-Type: application/json' \
  -d '{
    "data": {
      "type": "inventory_item_relationships",
      "attributes": {
        "child_id": <CHILD_ID>
      }
    }
  }'
```

>The above command returns JSON structured like this:

```json
{
  {
    "data": {
      "id": "49",
      "type": "inventory_item_relationships",
      "relationships": {
        "parent": {
          "data": {
            "id": "1",
            "type": "inventory_items"
          }
        },
        "child": {
          "data": {
            "id": "2",
            "type": "inventory_items"
          }
        },
        "created_by": {
          "data": {
            "id": "1",
            "type": "users"
          }
        },
        "last_modified_by": {
          "data": {
            "id": "1",
            "type": "users"
          }
        }
      }
    }
  }
}
```

This endpoint creates a new child relationship with selected inventory item, identified by CHILD_ID attribute.

### HTTP Request

`POST https://<server-name>/api/v2/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/items/<ITEM_ID>/child_relationships`

### URL Parameters

| Parameter	   | Description                                              |
|--------------|----------------------------------------------------------|
| TEAM_ID	     | The ID of the team                                       |
| INVENTORY_ID | The ID of the inventory containing the item              |
| ITEM_ID      | The ID of the item for which to create the relationship  |

### Request Body

`
{
  "data": {
    "type": "inventory_item_relationships",
    "attributes": {
      "child_id": <CHILD_ID>
    }
  }
}
`

### Responses

 - __201 Created:__ Relationship successfully created.
 - __400 Bad Request:__ Invalid or mutually exclusive parameters provided.
 - __403 Forbidden:__ User does not have manage permission.
 - __404 Not Found:__ Specified inventory item not found.

## Delete Inventory Item Child Relationship

```shell
curl -X DELETE \
  https://<server-name>/api/v2/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/items/<ITEM_ID>/child_relationships/<ID> \
  -H 'Authorization: Bearer your_token_here' \
  -H 'Content-Type: application/json'
```

> The above command returns an empty body with status code 200

This endpoint deletes an existing relationship between inventory items.

### HTTP Request

`DELETE https://<server-name>/api/v2/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/items/<ITEM_ID>/child_relationships/<ID>`

### URL Parameters

| Parameter	      | Description                                              |
|-----------------|----------------------------------------------------------|
| TEAM_ID	        | The ID of the team                                       |
| INVENTORY_ID    | The ID of the inventory containing the item              |
| ITEM_ID         | The ID of the item for which to delete the relationship  |
| ID              | The ID of the relationship to delete                     |


### Responses

 - __200 OK:__ Relationship successfully deleted.
 - __403 Forbidden:__ User does not have manage permission.
 - __404 Not Found:__ Relationship with provided ID does not exist.





__Note__: Replace _server_name_, _TEAM_ID_, _INVENTORY_ID_, _ITEM_ID_, _CHILD_ID_, and _ID_ with actual values.
