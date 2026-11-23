# Task User Group Assignments

A user group assignment grants all members of the user group access to the task with the specified user role.

## Get Task User Group Assignments

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/user_group_assignments" \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "user_group_assignments",
      "attributes": {
        "created_at": "2025-11-11T13:25:53.910Z",
        "updated_at": "2025-11-15T10:30:33.415Z"
      },
      "relationships": {
        "user_role": {
          "data": {
            "id": "1",
            "type": "user_roles"
          }
        },
        "user_group": {
          "data": {
            "id": "1",
            "type": "user_groups"
          }
        }
      }
    }
  ],
  "links": {
    "self": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/user_group_assignments?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/user_group_assignments?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/user_group_assignments?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all user group assignments of the specified task.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/user_group_assignments(?filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter     | Description                                                                                 |
| ------------- | ------------------------------------------------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from                                                 |
| PROJECT_ID    | The ID of the project to retrieve experiment from                                           |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from                                              |
| TASK_ID       | The ID of the task                                                                          |
| FROM          | If present will filter user group assignments corresponding timestamp above or equals value |
| TO            | If present will filter user group assignments corresponding timestamp below or equals value |

## Get Task User Group Assignment

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/user_group_assignments/1" \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "user_group_assignments",
    "attributes": {
      "created_at": "2025-11-11T13:25:53.910Z",
      "updated_at": "2025-11-15T10:30:33.415Z"
    },
    "relationships": {
      "user_role": {
        "data": {
          "id": "1",
          "type": "user_roles"
        }
      },
      "user_group": {
        "data": {
          "id": "1",
          "type": "user_groups"
        }
      }
    }
  }
}
```

This endpoint retrieves a specific user group assignment of the specified task.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/user_group_assignments/<USER_GROUP_ASSIGNMENT_ID>`

### URL Parameters

| Parameter                | Description                                       |
| ------------------------ | ------------------------------------------------- |
| TEAM_ID                  | The ID of the team to retrieve project from       |
| PROJECT_ID               | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID            | The ID of the experiment to retrieve task from    |
| TASK_ID                  | The ID of the task                                |
| USER_GROUP_ASSIGNMENT_ID | The ID of the user group assignment               |

## Update Task User Group Assignment attributes

```shell
curl -X PATCH \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/user_group_assignments/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
  "data": {
    "type": "user_group_assignments",
    "attributes": {
      "user_role_id": "2"
    }
  }
}'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "user_group_assignments",
    "attributes": {
      "created_at": "2025-11-11T13:25:53.910Z",
      "updated_at": "2025-11-15T10:30:33.415Z"
    },
    "relationships": {
      "user_role": {
        "data": {
          "id": "2",
          "type": "user_roles"
        }
      },
      "user_group": {
        "data": {
          "id": "1",
          "type": "user_groups"
        }
      }
    }
  }
}
```

This endpoint updates the user role of an existing user group assignment on the task.
If submitted attributes are the same and no changes are made for the user group assignment, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/user_group_assignments/<USER_GROUP_ASSIGNMENT_ID>`

### URL Parameters

| Parameter                | Description                                       |
| ------------------------ | ------------------------------------------------- |
| TEAM_ID                  | The ID of the team to retrieve project from       |
| PROJECT_ID               | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID            | The ID of the experiment to retrieve task from    |
| TASK_ID                  | The ID of the task                                |
| USER_GROUP_ASSIGNMENT_ID | The ID of the user group assignment               |

### Request body

```json
{
  "data": {
    "type": "user_group_assignments",
    "attributes": {
      "user_role_id": "2"
    }
  }
}
```

### Task User Group Assignment attributes

| Attribute    | Mandatory | Description                    |
| ------------ | --------- | ------------------------------ |
| user_role_id | yes       | ID of the UserRole on the task |
