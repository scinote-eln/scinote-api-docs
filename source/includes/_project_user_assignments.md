# Project Users Assignments

## Get Project User Assignments

```shell
curl "https://<server-name>/api/v1/teams/1/projects/1/users"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data":[
    {
      "id": "1",
      "type": "user_assignments",
      "attributes":{
        "created_at": "2021-11-11T13:25:53.910Z",
        "updated_at": "2021-11-15T10:30:33.415Z"
      },
      "relationships":{
        "user":{
          "data":{
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
            "type": "projects"
          }
        }
      }
    }
  ],
  "links":{
    "self": "https://<server-name>/api/v1/teams/1/projects/1/users?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v1/teams/1/projects/1/users?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v1/teams/1/projects/1/users?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all users who are members of the specified project.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/users`

### URL Parameters

Parameter | Description
--------- | -----------
TEAM_ID | The ID of the team to retrieve project from
PROJECT_ID | The ID of the project to retrieve users from
INCLUDES | can include `user`, `user_roles`, and `assignable` (on this endpoint assignable is a project)

## Get Project User

```shell
curl "https://<server-name>/api/v1/teams/1/projects/1/users/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data":{
    "id": "1",
    "type": "user_assignments",
    "attributes":{
      "created_at": "2021-11-11T13:25:53.910Z",
      "updated_at": "2021-11-15T10:30:33.415Z"
    },
    "relationships":{
      "user":{
        "data":{
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
          "type": "projects"
        }
      }
    }
  }
}
```

This endpoint retrieves a specific user who is a member of the specified project.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/users/<USER_ASSIGMENT_ID>`

### URL Parameters

Parameter | Description
--------- | -----------
TEAM_ID | The ID of the team to retrieve project from
PROJECT_ID | The ID of the project to retrieve user from
USER_ASSIGNMENT_ID | The ID of the user assignment to retrieve
INCLUDES | can include `user`, `user_role`, and `assignable` (on this endpoint assignable is a project)

## Create Project User assignment

```shell
curl -X POST \
  https://<server-name>/api/v1/teams/1/projects/1/users \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
      "type": "user_assignments",
      "attributes": {
        "user_id": "1",
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
    "type": "user_assignments",
    "attributes": {
      "created_at": "2021-11-11T13:25:53.910Z",
      "updated_at": "2021-11-15T10:30:33.415Z"
    },
    "relationships":{
      "user":{
        "data":{
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
          "type": "projects"
        }
      }
    }
  }
}
```
This endpoint creates a new user assignment in the project. Please note that we will create the user assignments for the project child experiment and tasks asynchronous.

### HTTP Request

`POST https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/users`

### URL Parameters

Parameter     | Description
------------- | -----------
TEAM_ID       | The ID of the team to retrieve project from
PROJECT_ID    | The ID of the project to assign user to

> Request body
```json
{
  "data": {
    "type": "user_assignments",
    "attributes": {
      "user_id": "1",
      "user_role_id": "1"
    }
  }
}
```
### Project User Assignment attributes

Attribute   | Mandatory | Description
----------- | --------- | -----------
user_id     | yes       | ID of the user
user_role_id | yes       | ID of the UserRole on the project

## Update Project User Assignment attributes

```shell
curl -X PATCH \
  https://<server-name>/api/v1/teams/1/projects/1/users/1 \
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
  "data": {
    "id": "1",
    "type": "user_assignments",
    "attributes": {
      "created_at": "2021-11-11T13:25:53.910Z",
      "updated_at": "2021-11-15T10:30:33.415Z"
    },
    "relationships": {
      "user":{
        "data":{
          "id": "1",
          "type": "users"
        }
      },
      "user_role": {
        "data": {
          "id": "2",
          "type": "user_roles"
        }
      },
      "assignable": {
        "data": {
          "id": "1",
          "type": "projects"
        }
      }
    }
  }
}
```
This endpoint updates existing user assignment in the project.
If submitted attributes are the same and no changes are made for the user assignment, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/users/<USER_ASSIGMENT_ID>`

### URL Parameters

Parameter       | Description
--------------- | -----------
TEAM_ID         | The ID of the team to retrieve project from
PROJECT_ID      | The ID of the project to retrieve user assignment from
USER_ASSIGNMENT_ID | The ID of the user assignment

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

### Project User Assignments attributes

Attribute   | Mandatory | Description
----------- | --------- | -----------
user_role_id | yes       | Role on the project

## Delete Project User Assignment

```shell
curl -X DELETE \
  https://<server-name>/api/v1/teams/1/projects/1/users/1 \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns empty body with status code 200

This endpoint deletes specific user assignment from the project. Please note that we will delete the user assignments for the project child experiment and tasks asynchronous.

### HTTP Request

`DELETE https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/users/<USER_ASSIGMENT_ID>`

### URL Parameters

Parameter       | Description
--------------- | -----------
TEAM_ID         | The ID of the team to retrieve project from
PROJECT_ID      | The ID of the project to retrieve user assignment from
USER_ASSIGNMENT_ID | The ID of the user assignment
