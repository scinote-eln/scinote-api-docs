# Protocol templates

## Get Protocol templates

```shell
curl "https://<server-name>/api/v1/teams/1/protocol_templates"
  -H "Authorization: Bearer qwerty123456..."
```
> The above command returns JSON structured like this:

```json
{
  "data":[
    {
      "id": "2",
      "type": "protocols",
      "attributes":{
        "name": "Protocol name",
        "authors": null,
        "description": null,
        "protocol_type": "in_repository_published_version",
        "created_at":"2023-03-27T12:32:41.387Z",
        "updated_at":"2023-03-27T12:33:23.481Z",
        "version_number": 1,
        "version_comment": "",
        "published_on": "2023-03-22T13:48:58.226Z",
        "archived": false
      },
      "relationships": {
        "parent": {
          "data": {
            "id": "1",
            "type": "protocols"
          }
        },
        "linked_tasks": {
          "data": [
            {
              "id": "1",
              "type": "tasks"
            }
          ]
        },
        "published_by": {
          "data": {
            "id": "1",
            "type": "users"
          }
        }
      }
    }
  ],
  "links":{
    "self":"http://<server-name>/api/v1/teams/1/protocol_templates/?page%5Bnumber%5D=1\u0026page%5Bsize%5D=10",
    "first":"http://<server-name>/api/v1/teams/1/protocol_templates/?page%5Bnumber%5D=1\u0026page%5Bsize%5D=10",
    "prev":null,
    "next":"http://<server-name>/api/v1/teams/1/protocol_templates/?page%5Bnumber%5D=2\u0026page%5Bsize%5D=10",
    "last":"http://<server-name>/api/v1/teams/1/protocol_templates/?page%5Bnumber%5D=3\u0026page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all protocol templates from the specified team.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/protocol_templates`

### URL Parameters

Parameter | Description
--------- | -----------
TEAM_ID | The ID of the team to retrieve project from


## Get Protocol template

```shell
curl "https://<server-name>/api/v1/teams/1/protocol_templates/1"
  -H "Authorization: Bearer qwerty123456..."
```
> The above command returns JSON structured like this:

```json
{
  "data":{
    "id": "2",
    "type": "protocols",
    "attributes":{
      "name": "Protocol name",
      "authors": null,
      "description": null,
      "protocol_type": "in_repository_published_version",
      "created_at":"2023-03-27T12:32:41.387Z",
      "updated_at":"2023-03-27T12:33:23.481Z",
      "version_number": 1,
      "version_comment": "",
      "published_on": "2023-03-22T13:48:58.226Z",
      "archived": false
    },
    "relationships": {
      "parent": {
        "data": {
          "id": "1",
          "type": "protocols"
        }
      },
      "linked_tasks": {
        "data": [
          {
            "id": "1",
            "type": "tasks"
          }
        ]
      },
      "published_by": {
        "data": {
          "id": "1",
          "type": "users"
        }
      }
    }
  }
}
```

This endpoint retrieves all protocol templates from the specified team.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/protocol_templates/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
TEAM_ID | The ID of the team to retrieve project from
ID      | The ID of the protocol template
