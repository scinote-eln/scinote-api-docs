# Experiment Users Assignments

## Get Experiment User Assignments

```shell
curl "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/user_assignments"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data":[
    {
      "id": "1",
      "type": "experiment_user_assignments",
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
    "self": "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/user_assignments?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/user_assignments?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/user_assignments?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all users who are members of the specified experiment.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/user_assignments`

### URL Parameters

Parameter | Description
--------- | -----------
TEAM_ID | The ID of the team to retrieve project from
PROJECT_ID | The ID of the project to retrieve users from
EXPERIMENT_ID | The ID of the experiment to retrieve users from

## Get Experiment User

```shell
curl "https://<server-name>/api/v1/teams/1/projects/1/experiments/1/user_assignments/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data":{
    "id": "1",
    "type": "experiment_user_assignments",
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

This endpoint retrieves a specific user who is a member of the specified experiment.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/user_assignments/<USER_ASSIGMENT_ID>`

### URL Parameters

Parameter | Description
--------- | -----------
TEAM_ID | The ID of the team to retrieve project from
PROJECT_ID | The ID of the project to retrieve user from
EXPERIMENT_ID | The ID of the experiment to retrieve user from
USER_ASSIGMENT_ID | The ID of the user assigment to retrieve


## Create Experiment User assignment

```shell
curl -X POST \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/user_assignments \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
      "type": "experiment_user_assignments",
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
    "type": "experiment_user_assignments",
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
This endpoint creates a new user assignment in the experiment.

### HTTP Request

`POST https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/user_assignments`

### URL Parameters

Parameter     | Description
------------- | -----------
TEAM_ID       | The ID of the team to retrieve project from
PROJECT_ID    | The ID of the project to assign user to
EXPERIMENT_ID | The ID of the experiment to retrieve user from

> Request body
```json
{
  "data": {
    "type": "experiment_user_assignments",
    "attributes": {
      "user_id": "1",
      "user_role_id": "1"
    }
  }
}
```
### Experiment User Assigment attributes

Attribute   | Mandatory | Description
----------- | --------- | -----------
user_id     | yes       | ID of the user
user_role_id | yes       | ID of the UserRole on the project

## Update Experiment User Assigment attributes

```shell
curl -X PATCH \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/user_assignment/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
        "data": {
          "type": "experiment_user_assignments",
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
    "type": "experiment_user_assignments",
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
This endpoint updates existing user assignment in the experiment.
If submitted attributes are the same and no changes are made for the user assignment, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/user_assignments/<USER_ASSIGMENT_ID>`

### URL Parameters

Parameter       | Description
--------------- | -----------
TEAM_ID         | The ID of the team to retrieve project from
PROJECT_ID      | The ID of the project to retrieve user assignment from
EXPERIMENT_ID   | The ID of the experiment to retrieve user from
USER_ASSIGMENT_ID | The ID of the user assignment

### Request body

```json
{
  "data": {
    "type": "experiment_user_assignments",
    "attributes": {
      "user_role_id": "2"
    }
  }
}
```

### Experiment User Assignment attributes

Attribute   | Mandatory | Description
----------- | --------- | -----------
user_role_id | yes       | Role on the project

## Delete Experiment User Assignment

```shell
curl -X DELETE \
  https://<server-name>/api/v1/teams/1/projects/1/experiments/1/user_assignments/1 \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns empty body with status code 200

This endpoint deletes specific user assignment from the experiment.

### HTTP Request

`DELETE https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/user_assignments/<USER_ASSIGMENT_ID>`

### URL Parameters

Parameter       | Description
--------------- | -----------
TEAM_ID         | The ID of the team to retrieve project from
PROJECT_ID      | The ID of the project to retrieve user assignment from
EXPERIMENT_ID   | The ID of the experiment to retrieve user from
USER_ASSIGMENT_ID | The ID of the user assignment
