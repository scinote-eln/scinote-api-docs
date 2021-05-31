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
      "type": "project_user_assignments",
      "attributes":{
        "user_role_id": "1"
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
        }
      }
    }
  ],
  "included":[
    {
      "id": "1",
      "type": "users",
      "attributes": {
        "full_name": "Sample User",
        "initials": "SU",
        "email": "sample@example.com",
        "avatar_url" : "http://example.com/avatar.png",
        "avatar_file_size" : 16181,
        "avatar_file_name" : "avatar.png"
      }
    },
    {
      "id": "1",
      "type": "user_roles",
      "attributes": {
        "id": 1,
        "name": "Owner",
        "permissions": ["project_read", "experiment_read", "task_read"]
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
    "type": "project_user_assignments",
    "attributes":{
      "user_role_id": "1"
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
      }
    }
  },
  "included":[
    {
      "id": "1",
      "type": "users",
      "attributes": {
        "full_name": "Sample User",
        "initials": "SU",
        "email": "sample@example.com",
        "avatar_url" : "http://example.com/avatar.png",
        "avatar_file_size" : 16181,
        "avatar_file_name" : "avatar.png"
      }
    },
    {
      "id": "1",
      "type": "user_roles",
      "attributes": {
        "id": 1,
        "name": "Owner",
        "permissions": ["project_read", "experiment_read", "task_read"]
      }
    }
  ]
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
USER_ASSIGMENT_ID | The ID of the user assigment to retrieve


## Create Project User assignment

```shell
curl -X POST \
  https://<server-name>/api/v1/teams/1/projects/1/users \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
      "type": "project_user_assignments",
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
    "type": "project_user_assignments",
    "attributes": {
      "user_role_id": "1"
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
      }
    }
  }
}
```
This endpoint creates a new user assignment in the project.

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
    "type": "project_user_assignments",
    "attributes": {
      "user_id": "1",
      "user_role_id": "1"
    }
  }
}
```
### Project User Assigment attributes

Attribute   | Mandatory | Description
----------- | --------- | -----------
user_id     | yes       | ID of the user
user_role_id | yes       | ID of the UserRole on the project

## Update Project User Assigment attributes

```shell
curl -X PATCH \
  https://<server-name>/api/v1/teams/1/projects/1/users/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
        "data": {
          "type": "project_user_assignments",
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
    "type": "project_user_assignments",
    "attributes": {
      "user_role_id": "2"
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
USER_ASSIGMENT_ID | The ID of the user assignment

### Request body

```json
{
  "data": {
    "type": "project_user_assignments",
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

## Delete Project User Assigment assignment

```shell
curl -X DELETE \
  https://<server-name>/api/v1/teams/1/projects/1/users/1 \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns empty body with status code 200

This endpoint deletes specific user assignment from the project.

### HTTP Request

`DELETE https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/users/<USER_ASSIGMENT_ID>`

### URL Parameters

Parameter       | Description
--------------- | -----------
TEAM_ID         | The ID of the team to retrieve project from
PROJECT_ID      | The ID of the project to retrieve user assignment from
USER_ASSIGMENT_ID | The ID of the user assignment
