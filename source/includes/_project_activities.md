# Project Activities

## Get Project Activities

```shell
curl "http://<server-name>/api/v1/teams/1/projects/1/activities"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "activities",
      "attributes": {
        "type_of": "create_module",
        "message": "<p>Admin created task New task.</p>"
      },
      "relationships": {
        "project": {
          "data": {
            "id": "1",
            "type": "projects"
          }
        },
        "subject": {
          "data": {
            "id": "10",
            "type": "tasks"
          }
        },
        "user": {
          "data": {
            "id": "1",
            "type": "users"
          }
        }
      }
    },
    {
      "id": "2",
      "type": "activities",
      "attributes": {
        "type_of": "update_protocol_in_task_from_repository",
        "message": "<p>Admin updated protocol on task New Task with version from Protocol repository Main Repository.</p>"
      },
      "relationships": {
        "project": {
          "data": {
            "id": "1",
            "type": "projects"
          }
        },
        "subject": {
          "data": {
            "id": "11",
            "type": "protocols"
          }
        },
        "user": {
          "data": {
            "id": "1",
            "type": "users"
          }
        }
      }
    }
  ],
  "links": {
    "self": "http://<server-name>/api/v1/teams/1/projects/1/activities?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "http://<server-name>/api/v1/teams/1/projects/1/activities?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": "http://<server-name>/api/v1/teams/1/projects/1/activities?page%5Bnumber%5D=2&page%5Bsize%5D=10",
    "last": "http://<server-name>/api/v1/teams/1/projects/1/activities?page%5Bnumber%5D=8&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all activities from specific project.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/activities(?filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter  | Description                                                                             |
| ---------- | --------------------------------------------------------------------------------------- |
| TEAM_ID    | The ID of the team to retrieve project from                                             |
| PROJECT_ID | The ID of the project to retrieve activities from                                       |
| FROM       | If present will filter project activities corresponding timestamp above or equals value |
| TO         | If present will filter project activities corresponding timestamp below or equals value |
