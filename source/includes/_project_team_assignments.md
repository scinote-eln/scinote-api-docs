# Project Team Assignments

A team assignment grants all members of the team access to the project with the specified user role.

## Get Project Team Assignments

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/team_assignments" \
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
    "self": "https://<server-name>/api/v2/teams/1/projects/1/team_assignments?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v2/teams/1/projects/1/team_assignments?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v2/teams/1/projects/1/team_assignments?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all team assignments of the specified project.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/team_assignments(?filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter  | Description                                                                           |
| ---------- | ------------------------------------------------------------------------------------- |
| TEAM_ID    | The ID of the team to retrieve project from                                           |
| PROJECT_ID | The ID of the project                                                                 |
| FROM       | If present will filter team assignments corresponding timestamp above or equals value |
| TO         | If present will filter team assignments corresponding timestamp below or equals value |

## Get Project Team Assignment

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/team_assignments/1" \
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

This endpoint retrieves a specific team assignment of the specified project.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/team_assignments/<TEAM_ASSIGNMENT_ID>`

### URL Parameters

| Parameter          | Description                                 |
| ------------------ | ------------------------------------------- |
| TEAM_ID            | The ID of the team to retrieve project from |
| PROJECT_ID         | The ID of the project                       |
| TEAM_ASSIGNMENT_ID | The ID of the team assignment               |

## Create Project Team Assignment

```shell
curl -X POST \
  https://<server-name>/api/v2/teams/1/projects/1/team_assignments \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
  "data": {
    "type": "team_assignments",
    "attributes": {
      "user_role_id": "1"
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

This endpoint assigns the team specified in the URL to the project with the specified user role. Please note that we will create the corresponding assignments for the project child experiments and tasks asynchronously.

### HTTP Request

`POST https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/team_assignments`

### URL Parameters

| Parameter  | Description                                 |
| ---------- | ------------------------------------------- |
| TEAM_ID    | The ID of the team to retrieve project from |
| PROJECT_ID | The ID of the project                       |

### Request body

```json
{
  "data": {
    "type": "team_assignments",
    "attributes": {
      "user_role_id": "1"
    }
  }
}
```

### Project Team Assignment attributes

| Attribute    | Mandatory | Description                       |
| ------------ | --------- | --------------------------------- |
| user_role_id | yes       | ID of the UserRole on the project |

## Update Project Team Assignment attributes

```shell
curl -X PATCH \
  https://<server-name>/api/v2/teams/1/projects/1/team_assignments/1 \
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

This endpoint updates the user role of an existing team assignment on the project. Please note that we will update the corresponding assignments for the project child experiments and tasks asynchronously.
If submitted attributes are the same and no changes are made for the team assignment, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/team_assignments/<TEAM_ASSIGNMENT_ID>`

### URL Parameters

| Parameter          | Description                                 |
| ------------------ | ------------------------------------------- |
| TEAM_ID            | The ID of the team to retrieve project from |
| PROJECT_ID         | The ID of the project                       |
| TEAM_ASSIGNMENT_ID | The ID of the team assignment               |

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

### Project Team Assignment attributes

| Attribute    | Mandatory | Description                       |
| ------------ | --------- | --------------------------------- |
| user_role_id | yes       | ID of the UserRole on the project |

## Delete Project Team Assignment

```shell
curl -X DELETE \
  https://<server-name>/api/v2/teams/1/projects/1/team_assignments/1 \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns empty body with status code 200

This endpoint removes a specific team assignment from the project. Please note that we will remove the corresponding assignments from the project child experiments and tasks asynchronously.

### HTTP Request

`DELETE https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/team_assignments/<TEAM_ASSIGNMENT_ID>`

### URL Parameters

| Parameter          | Description                                 |
| ------------------ | ------------------------------------------- |
| TEAM_ID            | The ID of the team to retrieve project from |
| PROJECT_ID         | The ID of the project                       |
| TEAM_ASSIGNMENT_ID | The ID of the team assignment               |
