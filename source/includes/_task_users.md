# Task Users

## Get Task Users

```shell
curl "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/users"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "users",
      "attributes": {
        "full_name": "Admin",
        "initials": "A",
        "email": "admin@scinote.net",
        "avatar_url": "http://example.com/avatar.png",
        "avatar_file_size": 16181,
        "avatar_file_name": "avatar.png"
      }
    }
  ],
  "links": {
    "self": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/users?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/users?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/users?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all users that are assigned to a specified task.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/users(?created_at[from]=<FROM>&created_at[to]=<TO>]&updated_at[from]=<FROM>&updated_at[to]=<TO>)`

### URL Parameters

| Parameter     | Description                                                                              |
| ------------- | ---------------------------------------------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from                                              |
| PROJECT_ID    | The ID of the project to retrieve experiment from                                        |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from                                           |
| TASK_ID       | The ID of the task to retrieve users from                                                |
| FROM          | If present will filter task assigned users corresponding timestamp above or equals value |
| TO            | If present will filter task assigned users corresponding timestamp below or equals value |

## Get Task User

```shell
curl "http://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/users/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "users",
    "attributes": {
      "full_name": "Admin",
      "initials": "A",
      "email": "admin@scinote.net",
      "avatar_url": "http://example.com/avatar.png",
      "avatar_file_size": 16181,
      "avatar_file_name": "avatar.png"
    }
  }
}
```

This endpoint retrieves a specific user that is assigned to a specified task.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/users/<USER_ID>`

### URL Parameters

| Parameter     | Description                                       |
| ------------- | ------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from       |
| PROJECT_ID    | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from    |
| TASK_ID       | The ID of the task to retrieve user from          |
| USER_ID       | The ID of the user to retrieve                    |
