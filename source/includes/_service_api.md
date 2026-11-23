# Service API

The Service API lives under the separate `/api/service` namespace and is intended for service and integration use. It uses the same authentication as the core API — send your token in the `Authorization: Bearer <token>` header on every request. Where API-key authentication is enabled, an `Api-Key: <key>` header is accepted as well, exactly as in the core API.

## Clone an Experiment into a Project

```shell
curl -X POST \
  https://<server-name>/api/service/teams/1/clone_experiment \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/json' \
  -d '{
    "clone_experiment": {
      "experiment_id": 123,
      "to_project_id": 45
    }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "125",
    "type": "experiments",
    "attributes": {
      "name": "My experiment",
      "status": "in_progress",
      "description": null,
      "archived": false,
      "started_at": null,
      "done_at": null,
      "due_date": null,
      "start_date": null,
      "created_at": "2026-07-22T10:00:00.000Z",
      "updated_at": "2026-07-22T10:00:00.000Z"
    }
  }
}
```

This endpoint clones an existing experiment into a target project within the given team and returns the newly created experiment. The target project must belong to the team given in the path.

### HTTP Request

`POST https://<server-name>/api/service/teams/<TEAM_ID>/clone_experiment`

### URL Parameters

| Parameter | Description                                        |
| --------- | -------------------------------------------------- |
| TEAM_ID   | The ID of the team the target project belongs to   |

> Request body

```json
{
  "clone_experiment": {
    "experiment_id": 123,
    "to_project_id": 45
  }
}
```

### Body Parameters

| Parameter     | Description                                                                                                           |
| ------------- | -------------------------------------------------------------------------------------------------------------------- |
| experiment_id | (Required) ID of the source experiment to clone. Nested under the `clone_experiment` object.                         |
| to_project_id | (Required) ID of the target project to clone the experiment into. Must belong to the given team. Nested under `clone_experiment`. |

## Reorder the Steps of a Protocol

```shell
curl -X POST \
  https://<server-name>/api/service/teams/1/protocols/1/reorder_steps \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/json' \
  -d '{
    "step_order": [
      { "id": 10, "position": 0 },
      { "id": 11, "position": 1 },
      { "id": 12, "position": 2 }
    ]
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "12",
      "type": "steps",
      "attributes": {
        "name": "Step 3",
        "description": "Description about step",
        "position": 0,
        "completed": false,
        "locked": false,
        "created_at": "2026-07-22T10:00:00.000Z",
        "updated_at": "2026-07-22T10:05:00.000Z"
      },
      "relationships": {
        "user": {
          "data": { "id": "1", "type": "users" }
        },
        "protocol": {
          "data": { "id": "1", "type": "protocols" }
        },
        "assets": { "data": [] },
        "checklists": { "data": [] },
        "tables": { "data": [] },
        "step_texts": { "data": [] },
        "comments": { "data": [] },
        "form_responses": { "data": [] },
        "step_elements": { "data": [] }
      }
    }
  ]
}
```

This endpoint sets the order of all steps in a protocol and returns the protocol's steps. The submitted list must include every step of the protocol, and the positions must form a contiguous, 0-based sequence.

<aside class="notice">
  The <code>step_order</code> array must contain an entry for every step of the protocol, and the positions must be exactly the contiguous set <code>0..(n-1)</code>. Any missing step or non-contiguous position set returns <code>400 Bad Request</code>.
</aside>

### HTTP Request

`POST https://<server-name>/api/service/teams/<TEAM_ID>/protocols/<PROTOCOL_ID>/reorder_steps`

### URL Parameters

| Parameter   | Description                                     |
| ----------- | ----------------------------------------------- |
| TEAM_ID     | The ID of the team                              |
| PROTOCOL_ID | The ID of the protocol whose steps are reordered |

> Request body

```json
{
  "step_order": [
    { "id": 10, "position": 0 },
    { "id": 11, "position": 1 },
    { "id": 12, "position": 2 }
  ]
}
```

### Body Parameters

| Parameter             | Description                                                                                                         |
| --------------------- | ------------------------------------------------------------------------------------------------------------------ |
| step_order            | (Required) An array of objects setting the new order of the protocol's steps. Must contain an entry for every step. |
| step_order[].id       | ID of a step belonging to the protocol.                                                                            |
| step_order[].position | New position of the step. Positions must form a contiguous, 0-based sequence covering `0..(n-1)`, where `n` is the number of steps. |

## Reorder the Orderable Elements of a Step

```shell
curl -X POST \
  https://<server-name>/api/service/teams/1/steps/1/reorder_elements \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/json' \
  -d '{
    "step_element_order": [
      { "id": 30, "position": 0 },
      { "id": 31, "position": 1 },
      { "id": 32, "position": 2 }
    ]
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "32",
      "type": "step_orderable_elements",
      "attributes": {
        "position": 0,
        "element": {
          "id": 5,
          "name": "Step text",
          "text": "Some text",
          "position": 0,
          "archived": false,
          "locked": false,
          "created_at": "2026-07-22T10:00:00.000Z",
          "updated_at": "2026-07-22T10:05:00.000Z"
        }
      }
    }
  ]
}
```

This endpoint sets the order of all orderable elements in a step and returns the step's orderable elements. The submitted list must include every orderable element of the step, and the positions must form a contiguous, 0-based sequence.

Each entry's `element` attribute is the flat serialization of the underlying orderable object (a checklist, table, step text, or form response), so its exact fields depend on the element type.

<aside class="notice">
  The <code>step_element_order</code> array must contain an entry for every orderable element of the step, and the positions must be exactly the contiguous set <code>0..(n-1)</code>. Any missing element or non-contiguous position set returns <code>400 Bad Request</code>.
</aside>

### HTTP Request

`POST https://<server-name>/api/service/teams/<TEAM_ID>/steps/<STEP_ID>/reorder_elements`

### URL Parameters

| Parameter | Description                                              |
| --------- | -------------------------------------------------------- |
| TEAM_ID   | The ID of the team                                       |
| STEP_ID   | The ID of the step whose orderable elements are reordered |

> Request body

```json
{
  "step_element_order": [
    { "id": 30, "position": 0 },
    { "id": 31, "position": 1 },
    { "id": 32, "position": 2 }
  ]
}
```

### Body Parameters

| Parameter                     | Description                                                                                                          |
| ----------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| step_element_order            | (Required) An array of objects setting the new order of the step's orderable elements. Must contain an entry for every orderable element. |
| step_element_order[].id       | ID of a step orderable element belonging to the step.                                                               |
| step_element_order[].position | New position of the element. Positions must form a contiguous, 0-based sequence covering `0..(n-1)`, where `n` is the number of elements. |
