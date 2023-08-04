# Inventories

## Get Inventories

```shell
curl "https://<server-name>/api/v1/teams/1/inventories"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "inventories",
      "attributes": {
        "name": "Inventory 1"
      },
      "relationships": {
        "created_by": {
          "data": {
            "id": "1",
            "type": "users"
          }
        }
      }
    },
    {
      "id": "2",
      "type": "inventories",
      "attributes": {
        "name": "Inventory 2"
      },
      "relationships": {
        "created_by": {
          "data": {
            "id": "2",
            "type": "users"
          }
        }
      }
    }
  ],
  "links": {
    "self": "https://<server-name>/api/v1/teams/1/inventories?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v1/teams/1/inventories?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v1/teams/1/inventories?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all **active** inventories from the specified team.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/inventories(?created_at[from]=<FROM>&created_at[to]=<TO>&updated_at[from]=<FROM>&updated_at[to]=<TO>)`

### URL Parameters

| Parameter | Description                                                                      |
| --------- | -------------------------------------------------------------------------------- |
| TEAM_ID   | The ID of the team to retrieve inventories from                                  |
| FROM      | If present will filter inventories corresponding timestamp above or equals value |
| TO        | If present will filter inventories corresponding timestamp below or equals value |

## Get Inventory

```shell
curl "https://<server-name>/api/v1/teams/1/inventories/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
    "data": {
        "id": "1",
        "type": "inventories",
        "attributes": {
            "name": "Inventory 1"
        },
        "relationships": {
            "created_by": {
                "data": {
                    "id": "1",
                    "type": "users"
                }
            }
        }
    },
    "included": [
        {
            "id": "1",
            "type": "users",
            "attributes": {
                <user-attributes>
            }
        }
    ]
}
```

This endpoint retrieves a specific inventory.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/inventories/<ID>`

### URL Parameters

| Parameter | Description                                   |
| --------- | --------------------------------------------- |
| TEAM_ID   | The ID of the team to retrieve inventory from |
| ID        | The ID of the inventory to retrieve           |

## Create Inventory

```shell
curl -X POST \
  https://<server-name>/api/v1/teams/1/inventories \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
        "type": "inventories",
        "attributes": {
            "name": "Samples"
        }
    }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "inventories",
    "attributes": {
      "name": "Samples"
    }
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
```

This endpoint creates new inventory in the team.

### HTTP Request

`POST https://<server-name>/api/v1/teams/<TEAM_ID>/inventories`

### URL Parameters

| Parameter | Description                                   |
| --------- | --------------------------------------------- |
| TEAM_ID   | The ID of the team to retrieve inventory from |

> Request body

```json
{
  "data": {
    "type": "inventories",
    "attributes": {
      "name": "Samples"
    }
  }
}
```

### Inventory attributes

| Attribute | Mandatory | Description        |
| --------- | --------- | ------------------ |
| name      | yes       | Name of the column |

## Update Inventory

```shell
curl -X PATCH \
  https://<server-name>/api/v1/teams/1/inventories/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
        "id": "1",
        "type": "inventories",
        "attributes": {
            "name": "Samples 2"
        }
    }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "inventories",
    "attributes": {
      "name": "Samples 2"
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
}
```

This endpoint updates existing inventory in the selected team.
If submitted attributes are the same and no changes are made for the inventory, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v1/teams/<TEAM_ID>/inventories/<ID>`

### URL Parameters

| Parameter | Description                                   |
| --------- | --------------------------------------------- |
| TEAM_ID   | The ID of the team to retrieve inventory from |
| ID        | The ID of the inventory                       |

### Request body

```json
{
  "data": {
    "id": "1",
    "type": "inventories",
    "attributes": {
      "name": "Samples 2"
    }
  }
}
```

### Inventory attributes

| Attribute | Mandatory | Description           |
| --------- | --------- | --------------------- |
| name      | yes       | Name of the inventory |

## Delete Inventory

```shell
curl -X DELETE \
  https://<server-name>/api/v1/teams/1/inventories/1 \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns empty body with status code 200

This endpoint deletes specific inventory.

### HTTP Request

`DELETE https://<server-name>/api/v1/teams/<TEAM_ID>/inventories/<ID>`

### URL Parameters

| Parameter | Description                                   |
| --------- | --------------------------------------------- |
| TEAM_ID   | The ID of the team to retrieve inventory from |
| ID        | The ID of the inventory                       |
