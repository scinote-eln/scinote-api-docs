# Task Assignment

## Get Task Assignments

```shell
curl "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/task_assignments"
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
        "full_name": "Sample User",
        "initials": "SU",
        "email": "sample@example.com",
        "created_at": "2022-05-26T12:47:01.586Z",
        "updated_at": "2022-05-27T08:19:54.704Z"
      }
    }
  ],
  "links": {
    "self": "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/task_assignments?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/task_assignments?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/task_assignments?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all users who are assigned to the specified task.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/task_assignments(?created_at[from]=<FROM>&created_at[to]=<TO>&updated_at[from]=<FROM>&updated_at[to]=<TO>)`

### URL Parameters

| Parameter     | Description                                                                              |
| ------------- | ---------------------------------------------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from                                              |
| PROJECT_ID    | The ID of the project to retrieve users from                                             |
| EXPERIMENT_ID | The ID of the experiment to retrieve users from                                          |
| TASK_ID       | The ID of the task to retrieve users from                                                |
| FROM          | If present will filter task assigned users corresponding timestamp above or equals value |
| TO            | If present will filter task assigned users corresponding timestamp below or equals value |

## Create Task Assignment

```shell
curl -X POST \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/task_assignment/ \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
        "data": {
          "type": "task_assignments",
          "attributes": {
            "user_id": "1"
          }
      }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "task_assignments",
    "attributes": {
      "created_at": "2021-11-11T13:25:53.910Z",
      "updated_at": "2021-11-15T10:30:33.415Z"
    },
    "relationships": {
      "user": {
        "data": {
          "id": "1",
          "type": "users"
        }
      },
      "tasks": {
        "data": {
          "id": "1",
          "type": "tasks"
        }
      }
    }
  }
}
```

This endpoint assign user to the task.

### HTTP Request

`POST https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/task_assignments`

### URL Parameters

| Parameter     | Description                                            |
| ------------- | ------------------------------------------------------ |
| TEAM_ID       | The ID of the team to retrieve project from            |
| PROJECT_ID    | The ID of the project to retrieve user assignment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve user from         |
| TASK_ID       | The ID of the task to retrieve                         |

### Request body

```json
{
  "data": {
    "type": "task_assignments",
    "attributes": {
      "user_id": "2"
    }
  }
}
```

### Task Assignment attributes

| Attribute | Mandatory | Description      |
| --------- | --------- | ---------------- |
| user_id   | yes       | Role on the task |

## Remove Task Assignment

```shell
curl -X DELETE \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/task_assignment/1 \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns empty body with status code 200

This endpoint unassign user from task

### HTTP Request

`DELETE https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/task_assignments/<USER_ID>`

### URL Parameters

| Parameter     | Description                                            |
| ------------- | ------------------------------------------------------ |
| TEAM_ID       | The ID of the team to retrieve project from            |
| PROJECT_ID    | The ID of the project to retrieve user assignment from |
| EXPERIMENT_ID | The ID of the experiment to retrieve user from         |
| TASK_ID       | The ID of the task to retrieve                         |
| USER_ID       | The ID of the user                                     |
