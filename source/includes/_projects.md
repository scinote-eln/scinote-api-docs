# Projects

## Get Projects

```shell
curl "http://<server-name>/api/v1/teams/1/projects"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "projects",
      "attributes": {
        "name": "Demo project - qPCR",
        "visibility": "hidden",
        "start_date": null,
        "archived": false
      },
      "relationships": {
        "project_folder": {
          "data": null
        }
      }
    }
  ],
  "links": {
    "self": "http://<server-name>/api/v1/teams/1/projects/?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "http://<server-name>/api/v1/teams/1/projects/?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "http://<server-name>/api/v1/teams/1/projects/?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all projects from the specified team. If `?include=comments` PATH parameter is provided,
the project comments are also included.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects(?include=<INCLUDES>&filter%5Barchived%5D=<ARCHIVED>)`

### URL Parameters

| Parameter | Description                                                                                    |
| --------- | ---------------------------------------------------------------------------------------------- |
| TEAM_ID   | The ID of the team to retrieve projects from                                                   |
| INCLUDES  | if set to `comments`, project comments are also included                                       |
| ARCHIVED  | If set to `true` return only archived projects. If set to `false` return only active projects. |

## Get Project

```shell
curl "http://<server-name>/api/v1/teams/1/projects/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "projects",
    "attributes": {
      "name": "Demo project - qPCR",
      "visibility": "hidden",
      "start_date": null,
      "archived": false
    },
    "relationships": {
      "project_folder": {
        "data": null
      }
    }
  }
}
```

This endpoint retrieves a specific project from a specific team. If `?include=comments` PATH parameter is provided,
the project comments are also included.

### HTTP Request

`GET http://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>(?include=<INCLUDES>&filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter  | Description                                                                   |
| ---------- | ----------------------------------------------------------------------------- |
| TEAM_ID    | The ID of the team to retrieve project from                                   |
| PROJECT_ID | The ID of the project to retrieve                                             |
| INCLUDES   | if set to `comments`, project comments are also included                      |
| FROM       | If present will filter projects corresponding timestamp above or equals value |
| TO         | If present will filter projects corresponding timestamp below or equals value |

## Create Project

```shell
curl -X POST \
  https://<server-name>/api/v1/teams/1/projects \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
      "type": "projects",
      "attributes": {
        "name": "My project 1",
        "visibility": "visible",
        "archived": false,
        "project_folder_id": 1
      }
    }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "projects",
    "attributes": {
      "name": "My project 1",
      "visibility": "visible",
      "start_date": "01/01/2020 10:30",
      "archived": false
    },
    "relationships": {
      "project_folder": {
        "data": {
          "id": "1",
          "type": "project_folders"
        }
      }
    }
  }
}
```

This endpoint creates a new project in the team.

<aside class="notice">
  Created project has no automatically assigned users, therefore in order to access this project it is needed to create [user_projects](#project_users) record for it.
</aside>

### HTTP Request

`POST https://<server-name>/api/v1/teams/<TEAM_ID>/projects`

### URL Parameters

| Parameter | Description                                  |
| --------- | -------------------------------------------- |
| TEAM_ID   | The ID of the team to retrieve projects from |

> Request body

```json
{
  "data": {
    "type": "projects",
    "attributes": {
      "name": "My project 1",
      "visibility": "visible",
      "archived": false,
      "project_folder_id": 1
    }
  }
}
```

### Project attributes

| Attribute         | Mandatory | Description                                              |
| ----------------- | --------- | -------------------------------------------------------- |
| name              | yes       | Name of the project                                      |
| visibility        | no        | Visibility of the project                                |
| archived          | no        | Archived flag                                            |
| project_folder_id | no        | Reference to project folder, if null it is on root level |

## Update Project

```shell
curl -X PATCH \
  https://<server-name>/api/v1/teams/1/projects/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
      "id": "1",
      "type": "projects",
      "attributes": {
        "name": "Project 2",
        "visibility": "hidden",
        "archived": true,
        "project_folder_id": 5
      }
    }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "projects",
    "attributes": {
      "name": "Project 2",
      "visibility": "hidden",
      "start_date": "01/01/2020 10:30",
      "archived": true
    },
    "relationships": {
      "project_folder": {
        "data": {
          "type": "project_folders",
          "id": "5"
        }
      }
    }
  }
}
```

This endpoint updates existing project in the selected team.
If submitted attributes are the same and no changes are made for the project, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<ID>`

### URL Parameters

| Parameter | Description                                 |
| --------- | ------------------------------------------- |
| TEAM_ID   | The ID of the team to retrieve project from |
| ID        | The ID of the project                       |

### Request body

```json
{
  "data": {
    "id": "1",
    "type": "projects",
    "attributes": {
      "name": "Project 2",
      "visibility": "hidden",
      "archived": true,
      "project_folder_id": 5
    }
  }
}
```

### Project attributes

| Attribute         | Mandatory | Description                                              |
| ----------------- | --------- | -------------------------------------------------------- |
| name              | yes       | Name of the project                                      |
| visibility        | no        | Visibility of the project                                |
| archived          | no        | Archived flag                                            |
| project_folder_id | no        | Reference to project folder, if null it is on root level |
