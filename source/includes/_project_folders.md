# Project Folders

## Get Project Folders

```shell
curl "http://<server-name>/api/v1/teams/1/project_folders"
  -H "Authorization: Bearer qwerty123456..."
```
> The above command returns JSON structured like this:

```json
{
  "data":[
    {
      "id": "1",
      "type": "project_folders",
      "attributes":{
        "name": "2020 Projects"
      },
      "relationships": {
        "team": {
          "data": {
            "id": "1",
            "type": "teams"
          }
        },
        "parent_folder": {
          "data": null
        },
        "projects": {
          "data": []
        },
        "project_folders": {
          "data": []
        }
      }
    }
  ],
  "links":{
    "self": "http://<server-name>/api/v1/teams/1/project_folders/?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "http://<server-name>/api/v1/teams/1/project_folders/?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "http://<server-name>/api/v1/teams/1/project_folders/?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}

```

This endpoint retrieves all project folders from the specified team.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/project_folders`

### URL Parameters

Parameter | Description
--------- | -----------
TEAM_ID | The ID of the team to retrieve project folders from

## Get Project Folder

```shell
curl "http://<server-name>/api/v1/teams/1/project_folders/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "project_folders",
    "attributes":{
      "name": "2020 Projects"
    },
    "relationships": {
      "team": {
        "data": {
          "id": "1",
          "type": "teams"
        }
      },
      "parent_folder": {
        "data": null
      },
      "projects": {
        "data": []
      },
      "project_folders": {
        "data": []
      }
    }
  }
}
```

This endpoint retrieves a specific project folder from a specific team.

### HTTP Request

`GET http://<server-name>/api/v1/teams/<TEAM_ID>/project_folders/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
TEAM_ID | The ID of the team to retrieve project folders from
ID      | The ID of the project folder to retrieve

## Create Project Folder

```shell
curl -X POST \
  https://<server-name>/api/v1/teams/1/project_folders \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
      "type": "project_folders",
      "attributes": {
        "name": "My new Folder",
        "parent_folder_id": 1
      }
    }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "2",
    "type": "project_folders",
    "attributes": {
      "name": "My new Folder"
    },
    "relationships": {
      "team": {
        "data": {
          "id": "1",
          "type": "teams"
        }
      },
      "parent_folder": {
        "data": {
          "id": "1",
          "type": "project_folders"
        }
      },
      "projects": {
        "data": []
      },
      "project_folders": {
        "data": []
      }
    }
  }
}

```

This endpoint creates a new project folder in the team.

### HTTP Request

`POST https://<server-name>/api/v1/teams/<TEAM_ID>/project_folders`

### URL Parameters

Parameter     | Description
------------- | -----------
TEAM_ID       | The ID of the team to retrieve project folders from

> Request body

```json
{
  "data": {
    "type": "project_folders",
    "attributes": {
      "name": "My new Folder",
      "parent_folder_id": 1
    }
  }
}
```

### Project folder attributes

Attribute   | Mandatory | Description
----------- | --------- | -----------
name        | yes       | Name of the project folder
parent_folder_id| no        | Reference to parent folder, if null it is on root level



## Update Project Folder

```shell
curl -X PATCH \
  https://<server-name>/api/v1/teams/1/project_folders/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
      "type": "project_folders",
      "attributes": {
        "name": "My updated Folder",
        "parent_folder_id": 3
      }
    }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "type": "project_folders",
    "attributes": {
      "name": "My updated Folder"
    },
    "relationships": {
      "team": {
        "data": {
          "id": "1",
          "type": "teams"
        }
      },
      "parent_folder": {
        "data": {
          "type": "project_folders",
          "id": 3
        }
      },
      "projects": {
        "data": []
      },
      "project_folders": {
        "data": []
      }
    }
  }
}
```

This endpoint updates existing project folder in the selected team.
If submitted attributes are the same and no changes are made for the project, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v1/teams/<TEAM_ID>/project_folders/<ID>`

### URL Parameters

Parameter       | Description
--------------- | -----------
TEAM_ID         | The ID of the team to retrieve project folder from
ID              | The ID of the project folder

### Request body

```json
{
  "data": {
    "type": "project_folders",
    "attributes": {
      "name": "My updated Folder",
      "parent_folder_id": 3
    }
  }
}
```

### Project folder attributes

Attribute   | Mandatory | Description
----------- | --------- | -----------
name        | yes       | Name of the project folder
parent_folder_id| no        | Reference to parent folder, if null it is on root level
