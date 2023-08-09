# Protocols

## Get Protocols

```shell
curl "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "protocols",
      "attributes": {
        "name": null,
        "authors": null,
        "description": null,
        "protocol_type": "unlinked"
      }
    }
  ],
  "links": {
    "self": "http://localhost:3000/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "http://localhost:3000/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "http://localhost:3000/api/v1/teams/1/projects/1/experiments/1/tasks/1/protocols?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves protocols that are assigned to a specific task.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols(?filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter     | Description                                                                                  |
| ------------- | -------------------------------------------------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from                                                  |
| PROJECT_ID    | The ID of the project to retrieve experiment from                                            |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from                                               |
| TASK_ID       | The ID of the task to retrieve protocols from                                                |
| FROM          | If present will filter task assigned protocols corresponding timestamp above or equals value |
| TO            | If present will filter task assigned protocols corresponding timestamp below or equals value |
