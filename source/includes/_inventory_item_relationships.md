# Inventory Item Relationships

## Create Inventory Item Relationship


```shell
curl -X POST \
  https://<server-name>/api/v2/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/items/<ITEM_ID>/inventory_item_relationships \
  -H 'Authorization: Bearer your_token_here' \
  -H 'Content-Type: application/json' \
  -d '{
    "data": {
      "type": "inventory_item_relationships",
      "attributes": {
        "parent_id": <PARENT_ID>,
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

This endpoint creates a new relationship between two inventory items, identified by their respective IDs. The parameters `parent_id` and `child_id` are mutually exclusive.

### HTTP Request

`POST https://<server-name>/api/v2/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/items/<ITEM_ID>/inventory_item_relationships`

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
      "parent_id": <PARENT_ID>,
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

## Delete Inventory Item Relationship

```shell

curl -X DELETE \
  https://<server-name>/api/v2/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/items/<ITEM_ID>/inventory_item_relationships/<RELATIONSHIP_ID> \
  -H 'Authorization: Bearer your_token_here' \
  -H 'Content-Type: application/json'
```

> The above command returns an empty body with status code 200

This endpoint deletes an existing relationship between inventory items.

### HTTP Request

`DELETE https://<server-name>/api/v2/teams/<TEAM_ID>/inventories/<INVENTORY_ID>/items/<ITEM_ID>/inventory_item_relationships/<RELATIONSHIP_ID>`

### URL Parameters

| Parameter	      | Description                                              |
|-----------------|----------------------------------------------------------|
| TEAM_ID	        | The ID of the team                                       |
| INVENTORY_ID    | The ID of the inventory containing the item              |
| ITEM_ID         | The ID of the item for which to delete the relationship  |
| RELATIONSHIP_ID | The ID of the relationship to delete                     |


### Responses

 - __200 OK:__ Relationship successfully deleted.
 - __403 Forbidden:__ User does not have manage permission.
 - __404 Not Found:__ Relationship with provided ID does not exist.





__Note__: Replace _server_name_, _TEAM_ID_, _INVENTORY_ID_, _ITEM_ID_, _PARENT_ID_, _CHILD_ID_, and _RELATIONSHIP_ID_ with actual values.
