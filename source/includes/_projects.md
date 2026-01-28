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
        "description": "This is my project",
        "visibility": "hidden",
        "start_date": null,
        "status": "done",
        "due_date": "2025-11-11",
        "start_date": "2025-12-11",
        "started_at": "2025-12-11T13:25:53.910Z",
        "done_at": "2025-12-17T13:25:53.910Z",
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

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects(?include=<INCLUDES>&filter%5Barchived%5D=<ARCHIVED>&filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>&filter[name]=<NAME>)`

### URL Parameters

| Parameter | Description                                                                                    |
| --------- | ---------------------------------------------------------------------------------------------- |
| TEAM_ID   | The ID of the team to retrieve projects from                                                   |
| INCLUDES  | if set to `comments` or `supervised_by`, project comments and/or supervisor are also included  |
| ARCHIVED  | If set to `true` return only archived projects. If set to `false` return only active projects. |
| FROM       | If present will filter projects corresponding timestamp above or equals value                 |
| TO         | If present will filter projects corresponding timestamp below or equals value                 |
| NAME       | If present will filter projects whose name contains the value                                 |

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
      "description": "This is my project",
      "visibility": "hidden",
      "start_date": null,
      "status": "done",
      "due_date": "2025-11-11",
      "start_date": "2025-12-11",
      "started_at": "2025-12-11T13:25:53.910Z",
      "done_at": "2025-12-17T13:25:53.910Z",
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

`GET http://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>(?include=<INCLUDES>)`

### URL Parameters

| Parameter  | Description                                                                   |
| ---------- | ----------------------------------------------------------------------------- |
| TEAM_ID    | The ID of the team to retrieve project from                                   |
| PROJECT_ID | The ID of the project to retrieve                                             |
| INCLUDES   | if set to `comments`, project comments are also included                      |

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
      "description": "This is my project",
      "visibility": "visible",
      "status": "done",
      "due_date": "2025-11-11",
      "start_date": "2025-12-11",
      "started_at": "2025-12-11T13:25:53.910Z",
      "done_at": "2025-12-17T13:25:53.910Z",
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
      "project_folder_id": 1,
      "metadata": {
        "status": "processing"
      }
    }
  }
}
```

### Project attributes

| Attribute         | Mandatory | Description                                               |
| ----------------- | --------- | --------------------------------------------------------- |
| name              | yes       | Name of the project                                       |
| visibility        | no        | Visibility of the project                                 |
| archived          | no        | Archived flag                                             |
| status            | no        | Status of project (not_started, in_progress, done)        |
| description       | no        | Description of the project                                |
| due_date          | no        | Due date of project                                       |
| start_date        | no        | Planned start date of project                             |
| project_folder_id | no        | Reference to project folder, if null it is on root level  |
| metadata          | no        | A JSON format metadata object, for storing arbitrary data |

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
      "description": "This is my project",
      "visibility": "hidden",
      "status": "done",
      "due_date": "2025-11-11",
      "start_date": "2025-12-11",
      "started_at": "2025-12-11T13:25:53.910Z",
      "done_at": "2025-12-17T13:25:53.910Z",
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
      "project_folder_id": 5,
      "metadata": {
        "status": "processing"
      }
    }
  }
}
```

### Project attributes

| Attribute         | Mandatory | Description                                               |
| ----------------- | --------- | --------------------------------------------------------- |
| name              | yes       | Name of the project                                       |
| visibility        | no        | Visibility of the project                                 |
| archived          | no        | Archived flag                                             |
| status            | no        | Status of project (not_started, in_progress, done)        |
| description       | no        | Description of the project                                |
| due_date          | no        | Due date of project                                       |
| start_date        | no        | Planned start date of project                             |
| project_folder_id | no        | Reference to project folder, if null it is on root level  |
| metadata          | no        | A JSON format metadata object, for storing arbitrary data |


## Project Metadata

This API supports advanced filtering using metadata fields embedded in each project record. These metadata fields can be used as dynamic filters via the filter[metadata] parameter in the query string. Additionally, metadata can be explicitly returned in API responses by using the query parameter with-metadata=true.

### Filtering Projects by Metadata

You can filter projects using custom metadata key-value pairs by including them in the `filter[metadata]` query parameter. The value should be a JSON object encoded in the query string.

Note: All metadata keys and values must be strings.

### Example HTTP Request

Example filtering projects where metadata contains key status with the value processing:

`GET https://<server-name>/api/v1/teams/1/projects?filter[metadata][status]=processing`

You can also include multiple metadata key-value pairs:

`GET https://<server-name>/api/v1/teams/1/projects?filter[metadata][status]=processing&filter[metadata][external_id]=P1337`

This will return projects where metadata includes both "status": "processing" and "external_id": "P1337".
Including Metadata in the Response

To include the metadata field in the JSON response, use the query parameter:

`with-metadata=true`

### Combined Example

`GET https://<server-name>/api/v1/teams/1/projects?filter[metadata][priority]=high&with-metadata=true`

This will return all projects that contain metadata with key priority set to high, and also include the metadata field in the project response.

If with-metadata is not set to true, metadata fields will not be shown in the response, even if data exists.
