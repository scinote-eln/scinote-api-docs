# Experiment Team Assignments

A team assignment grants all members of the team access to the experiment with the specified user role.

## Get Experiment Team Assignments

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/team_assignments" \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "team_assignments",
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
        "team": {
          "data": {
            "id": "1",
            "type": "teams"
          }
        }
      }
    }
  ],
  "links": {
    "self": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/team_assignments?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/team_assignments?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/team_assignments?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all team assignments of the specified experiment.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/team_assignments(?filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter     | Description                                                                           |
| ------------- | ------------------------------------------------------------------------------------- |
| TEAM_ID       | The ID of the team to retrieve project from                                           |
| PROJECT_ID    | The ID of the project to retrieve experiment from                                     |
| EXPERIMENT_ID | The ID of the experiment                                                              |
| FROM          | If present will filter team assignments corresponding timestamp above or equals value |
| TO            | If present will filter team assignments corresponding timestamp below or equals value |

## Get Experiment Team Assignment

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/team_assignments/1" \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "team_assignments",
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
      "team": {
        "data": {
          "id": "1",
          "type": "teams"
        }
      }
    }
  }
}
```

This endpoint retrieves a specific team assignment of the specified experiment.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/team_assignments/<TEAM_ASSIGNMENT_ID>`

### URL Parameters

| Parameter          | Description                                       |
| ------------------ | ------------------------------------------------- |
| TEAM_ID            | The ID of the team to retrieve project from       |
| PROJECT_ID         | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID      | The ID of the experiment                          |
| TEAM_ASSIGNMENT_ID | The ID of the team assignment                     |

## Update Experiment Team Assignment attributes

```shell
curl -X PATCH \
  https://<server-name>/api/v2/teams/1/projects/1/experiments/1/team_assignments/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
  "data": {
    "type": "team_assignments",
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
    "type": "team_assignments",
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
      "team": {
        "data": {
          "id": "1",
          "type": "teams"
        }
      }
    }
  }
}
```

This endpoint updates the user role of an existing team assignment on the experiment. Please note that we will update the corresponding assignments for the experiment child tasks asynchronously.
If submitted attributes are the same and no changes are made for the team assignment, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/team_assignments/<TEAM_ASSIGNMENT_ID>`

### URL Parameters

| Parameter          | Description                                       |
| ------------------ | ------------------------------------------------- |
| TEAM_ID            | The ID of the team to retrieve project from       |
| PROJECT_ID         | The ID of the project to retrieve experiment from |
| EXPERIMENT_ID      | The ID of the experiment                          |
| TEAM_ASSIGNMENT_ID | The ID of the team assignment                     |

### Request body

```json
{
  "data": {
    "type": "team_assignments",
    "attributes": {
      "user_role_id": "2"
    }
  }
}
```

### Experiment Team Assignment attributes

| Attribute    | Mandatory | Description                          |
| ------------ | --------- | ------------------------------------ |
| user_role_id | yes       | ID of the UserRole on the experiment |
