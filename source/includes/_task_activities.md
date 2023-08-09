# Task Activities

## Get Task Activities

```shell
curl "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/activities"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "3",
      "type": "activities",
      "attributes": {
        "type_of": "export_protocol_from_task",
        "message": "<p>Admin exported protocol from task Sampling biological material</p>"
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
            "id": "2",
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
      "id": "4",
      "type": "activities",
      "attributes": {
        "type_of": "add_result",
        "message": "<p>Admin added file result (example.png).</p>"
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
            "id": "12",
            "type": "results"
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
    "self": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/activities?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/activities?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/activities?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all activities from specific task.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/activities(?filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter     | Description                                                                          |
| ------------- | ------------------------------------------------------------------------------------ |
| TEAM_ID       | The ID of the team to retrieve project from                                          |
| PROJECT_ID    | The ID of the project to retrieve experiment from                                    |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from                                       |
| TASK_ID       | The ID of the task to retrieve activities from                                       |
| FROM          | If present will filter task activities corresponding timestamp above or equals value |
| TO            | If present will filter task activities corresponding timestamp below or equals value |
