# Task Tags

## Get Task Tags

```shell
curl "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/tags"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "tags",
      "attributes": {
        "name": "Drylab",
        "color": "#15369E"
      }
    }
  ],
  "links": {
    "self": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/tags?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/tags?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/tags?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all tags, that are assigned to the specific task.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/tags(?created_at[from]=<FROM>&created_at[to]=<TO>&updated_at[from]=<FROM>&updated_at[to]=<TO>)`

### URL Parameters

| Parameter     | Description                                                                             |
| ------------- | --------------------------------------------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from                                             |
| PROJECT_ID    | The ID of the project to retrieve experiment from                                       |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from                                          |
| TASK_ID       | The ID of the task to retrieve task tags from                                           |
| FROM          | If present will filter task assigned tags corresponding timestamp above or equals value |
| TO            | If present will filter task assigned tags corresponding timestamp below or equals value |

## Get Task Tag

```shell
curl "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/tags/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "tags",
    "attributes": {
      "name": "Drylab",
      "color": "#15369E"
    }
  }
}
```

This endpoint retrieves a specific tag, that is assigned to a specific task.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/tags/<TAG_ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve tag from           |
| TAG_ID        | The ID of the tag to retrieve                     |
