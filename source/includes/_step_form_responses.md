# Step form responses V2

## Get step form responses

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/form_responses"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "form_responses",
      "attributes": {
        "position": 1,
        "status": "pending"
      },
      "relationships": {
        "form": {
          "data": {
            "id": "1",
            "type": "forms"
          }
        },
        "created_by": { 
          "data": {
            "id": "1",
            "type": "users"
          }
        },
        "submitted_by": {
          "data": null
        },
        "form_field_values": {
          "data": [
            {
              "id": "1",
              "type": "form_field_values"
            }
          ]
        }
      }
    },
    {
      "id": "2",
      "type": "form_responses",
      "attributes": {
        "position": 2,
        "status": "pending"
      },
      "relationships": {
        "form": {
          "data": {
            "id": "1",
            "type": "forms"
          }
        },
        "created_by": { 
          "data": {
            "id": "1",
            "type": "users"
          }
        },
        "submitted_by": {
          "data": null
        },
        "form_field_values": {
          "data": [
            {
              "id": "1",
              "type": "form_field_values"
            }
          ]
        }
      }
    }
  ],
  "links": {
    "self": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/form_responses?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/form_responses?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/form_responses?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves form_responses from specific step.
If `?include=form_field_values` PATH parameter is provided, form field values are also included.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<STEP_ID>/form_responses(?include=<INCLUDES>&filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter     | Description                                                                                |
| ------------- | -------------------------------------------------------------------------------------------|
| TEAM_ID       | The ID of the team to retrieve project from                                                |
| PROJECT_ID    | The ID of the project to retrieve experiment from                                          |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from                                             |
| TASK_ID       | The ID of the task to retrieve protocol from                                               |
| PROTOCOL_ID   | The ID of the protocol to retrieve step from                                               |
| STEP_ID       | The ID of the step to retrieve form_responses from                                         |
| INCLUDES      | if set to `form_field_values`, form field values are also included                         |
| FROM          | If present will filter steps' form_response, corresponding timestamp above or equals value |
| TO            | If present will filter steps' form_response, corresponding timestamp below or equals value |

## Get step form response

```shell
curl "https://<server-name>/api/v2/teams/1/projects/1/experiments/1/tasks/1/protocols/1/steps/1/form_responses/1"
  -H "Authorization: Bearer qwerty123456..."

```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "form_responses",
    "attributes": {
      "position": 1,
      "status": "pending"
    },
    "relationships": {
      "form": {
        "data": {
          "id": "1",
          "type": "forms"
        }
      },
      "created_by": { 
        "data": {
          "id": "1",
          "type": "users"
        }
      },
      "submitted_by": {
        "data": null
      },
      "form_field_values": {
        "data": [
          {
            "id": "1",
            "type": "form_field_values"
          }
        ]
      }
    }
  }
}
```

This endpoint retrieves specific form_response from the step.
If `?include=form_field_values` PATH parameter is provided, form field values are also included.

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/projects/<PROJECT_ID>/experiments/<EXPERIMENT_ID>/tasks/<TASK_ID>/protocols/<PROTOCOL_ID>/steps/<STEP_ID>/form_responses/<ID>(?include=<INCLUDES>)`

### URL Parameters

| Parameter     | Description                                                        |
| ------------- | -------------------------------------------------------------------|
| TEAM_ID       | The ID of the team to retrieve project from                        |
| PROJECT_ID    | The ID of the project to retrieve experiment from                  |
| EXPERIMENT_ID | The ID of the experiment to retrieve task from                     |
| TASK_ID       | The ID of the task to retrieve protocol from                       |
| PROTOCOL_ID   | The ID of the protocol to retrieve steps from                      |
| STEP_ID       | The ID of the step to retrieve form_response from                  |
| ID            | The ID of the form_response                                        |
| INCLUDES      | if set to `form_field_values`, form field values are also included |
