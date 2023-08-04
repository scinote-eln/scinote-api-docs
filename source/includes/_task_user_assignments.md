# Task Users Assignments

## Get Task User Assignments

```shell
curl "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/user_assignments"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "user_assignments",
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
        "user_role": {
          "data": {
            "id": "1",
            "type": "user_roles"
          }
        },
        "assignable": {
          "data": {
            "id": "1",
            "type": "tasks"
          }
        }
      }
    }
  ],
  "links": {
    "self": "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/user_assignments?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/user_assignments?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/user_assignments?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all users who are members of the specified task.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/user_assignments(?created_at[from]=<FROM>&created_at[to]=<TO>&updated_at[from]=<FROM>&updated_at[to]=<TO>)`

### URL Parameters

| Parameter     | Description                                                                                |
| ------------- | ------------------------------------------------------------------------------------------ |
| TEAM_ID       | The ID of the team to retrieve project from                                                |
| PROJECT_ID    | The ID of the project to retrieve users from                                               |
| EXPERIMENT_ID | The ID of the experiment to retrieve users from                                            |
| TASK_ID       | The ID of the task to retrieve users from                                                  |
| INCLUDES      | can include `user`, `user_roles`, and `assignable` (on this endpoint assignable is a task) |
| FROM          | If present will filter task members corresponding timestamp above or equals value          |
| TO            | If present will filter task members corresponding timestamp below or equals value          |

## Get Task User Assignment

```shell
curl "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/user_assignments/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "user_assignments",
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
        "user_role": {
          "data": {
            "id": "1",
            "type": "user_roles"
          }
        },
        "assignable": {
          "data": {
            "id": "1",
            "type": "tasks"
          }
        }
      }
    }
  ]
}
```

This endpoint retrieves a specific user who is a member of the specified task.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/user_assignments/<USER_ASSIGMENT_ID>`

### URL Parameters

| Parameter          | Description                                                                                |
| ------------------ | ------------------------------------------------------------------------------------------ |
| TEAM_ID            | The ID of the team to retrieve project from                                                |
| PROJECT_ID         | The ID of the project to retrieve user from                                                |
| EXPERIMENT_ID      | The ID of the experiment to retrieve user from                                             |
| TASK_ID            | The ID of the task to retrieve user from                                                   |
| USER_ASSIGNMENT_ID | The ID of the user assignment to retrieve                                                  |
| INCLUDES           | can include `user`, `user_roles`, and `assignable` (on this endpoint assignable is a task) |

## Update Task User Assignment attributes

```shell
curl -X PATCH \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/tasks/1/user_assignment/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
        "data": {
          "type": "user_assignments",
          "attributes": {
            "user_role_id": "2"
          }
      }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "user_assignments",
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
        "user_role": {
          "data": {
            "id": "1",
            "type": "user_roles"
          }
        },
        "assignable": {
          "data": {
            "id": "1",
            "type": "tasks"
          }
        }
      }
    }
  ]
}
```

This endpoint updates existing user assignment in the task.
If submitted attributes are the same and no changes are made for the user assignment, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/user_assignments/<USER_ASSIGMENT_ID>`

### URL Parameters

| Parameter          | Description                                            |
| ------------------ | ------------------------------------------------------ |
| TEAM_ID            | The ID of the team to retrieve project from            |
| PROJECT_ID         | The ID of the project to retrieve user assignment from |
| EXPERIMENT_ID      | The ID of the experiment to retrieve user from         |
| TASK_ID            | The ID of the task to retrieve                         |
| USER_ASSIGNMENT_ID | The ID of the user assignment                          |

### Request body

```json
{
  "data": {
    "type": "user_assignments",
    "attributes": {
      "user_role_id": "2"
    }
  }
}
```

### Task User Assignment attributes

| Attribute    | Mandatory | Description      |
| ------------ | --------- | ---------------- |
| user_role_id | yes       | Role on the task |
