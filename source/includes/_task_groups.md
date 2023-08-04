# Task Groups

## Get Task Groups

```shell
curl "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/task_groups"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "task_groups",
      "relationships": {
        "tasks": {
          "data": [
            {
              "id": "1",
              "type": "tasks"
            },
            {
              "id": "2",
              "type": "tasks"
            },
            {
              "id": "3",
              "type": "tasks"
            }
          ]
        }
      }
    }
  ],
  "links": {
    "self": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/task_groups?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/task_groups?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/task_groups?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves task groups from specific experiment.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/task_groups(?created_at[from]=<FROM>&created_at[to]=<TO>&updated_at[from]=<FROM>&updated_at[to]=<TO>)`

### URL Parameters

| Parameter     | Description                                                                      |
| ------------- | -------------------------------------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from                                      |
| PROJECT_ID    | The ID of the project to retrieve experiment from                                |
| EXPERIMENT_ID | The ID of the experiment to retrieve task groups from                            |
| FROM          | If present will filter task groups corresponding timestamp above or equals value |
| TO            | If present will filter task groups corresponding timestamp below or equals value |

## Get Task Group

```shell
curl "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/task_groups/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "task_groups",
    "relationships": {
      "tasks": {
        "data": [
          {
            "id": "1",
            "type": "tasks"
          },
          {
            "id": "2",
            "type": "tasks"
          },
          {
            "id": "3",
            "type": "tasks"
          }
        ]
      }
    }
  },
  "included": [
    {
      "id": "1",
      "type": "tasks",
      "attributes": {
        "name": "Experiment design",
        "due_date": "2018-10-25T13:30:54.315Z",
        "description": null,
        "state": "uncompleted",
        "archived": false
      }
    },
    {
      "id": "2",
      "type": "tasks",
      "attributes": {
        "name": "Sampling biological material",
        "due_date": "2018-11-08T13:30:54.520Z",
        "description": null,
        "state": "uncompleted",
        "archived": false
      }
    },
    {
      "id": "3",
      "type": "tasks",
      "attributes": {
        "name": "RNA isolation",
        "due_date": "2018-11-22T13:30:54.594Z",
        "description": null,
        "state": "uncompleted",
        "archived": false
      }
    }
  ]
}
```

This endpoint retrieves a specific task group from a specific experiment.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/task_groups/<GROUP_ID>`

### URL Parameters

| Parameter     | Description                                          |
| ------------- | ---------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from          |
| PROJECT_ID    | The ID of the project to retrieve experiment from    |
| EXPERIMENT_ID | The ID of the experiment to retrieve task group from |
| GROUP_ID      | The ID of the task group to retrieve                 |
