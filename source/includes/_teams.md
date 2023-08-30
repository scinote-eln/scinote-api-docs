# Teams

## Get All Teams

```shell
curl "https://<server-name>/api/v1/teams"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "teams",
      "attributes": {
        "name": "Team 1",
        "description": "This is team 1",
        "space_taken": 805809574
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
      "type": "teams",
      "attributes": {
        "name": "Team 2",
        "description": "This is team 2",
        "space_taken": 24370008357
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
    "self": "https://<server-name>/api/v1/teams?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v1/teams?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v1/teams?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all teams user is member of.

### HTTP Request

`GET https://<server-name>/api/v1/teams(?filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

| Parameter | Description                                                                |
| --------- | -------------------------------------------------------------------------- |
| FROM      | If present will filter teams corresponding timestamp above or equals value |
| TO        | If present will filter teams corresponding timestamp below or equals value |

## Get a Specific Team

```shell
curl "https://<server-name>/api/v1/teams/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
    "data": {
        "id": "1",
        "type": "teams",
        "attributes": {
            "name": "Team 1",
            "description": "This is team 1",
            "space_taken": 805809574
        }
    },
    "relationships": {
        "created_by": {
            "data": {
                "id": "1",
                "type": "users"
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

This endpoint retrieves a specific team.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<ID>`

### URL Parameters

| Parameter | Description                    |
| --------- | ------------------------------ |
| ID        | The ID of the team to retrieve |
