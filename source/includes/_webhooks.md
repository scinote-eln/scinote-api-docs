# Webhooks

### NOTE
If you would like to enable them in a local install, add ENABLE_WEBHOOKS=true to your environment variables.

## Setup

For integration purposes, SciNote offers setting up webhooks, which get triggered by certain activities. The first step is setting up an **activity filter** available at the global activities view (https://[YOUR-DOMAN].scinote.net/global_activities), where you need to save a filter by clicking the *Save filter* button in the top right corner.

Next, you will need to set up a webhook, by going to the Webhooks section in Settings (https://[YOUR-DOMAN].scinote.net/users/settings/webhooks). For each of the saved **activity filters** you can add multiple webhooks with the following settings:

- method (*GET*/*POST*/*PATCH*)
- URL
- Secret key (optional secret key for verifying the request on your end)
- Include serialized subject (optional, will include the activity subject serialized in the same format as in the API)


After setting up the webhook, it will be triggered for any activity matching the saved activity filter.



## Webhook request format

Depending on the type of activity, you will receive a request with a JSON payload of the following format (cURL, example for rename_project activity):


`curl -X 'POST' 'https://example.com/webhook-handler' -H 'content-length: 368' -H 'host: example.com' -H 'connection: close' -H 'webhook-secret-key: s3cr3t' -H 'content-type: application/json' -d $'{"breadcrumbs":{"team":"My projects","project":"Some project 1"},"message_items":{"user":{"id":9,"type":"User","value":"Example User","value_for":"full_name"},"project":{"id":137,"type":"Project","value":"Some project 1","value_for":"name"}},"type":"rename_project","created_at":"2022-01-03T14:51:21.492+01:00","subject":{"type":"Project","id":137}}'`

### Authentication

The optional Secret key is sent via the webhook-secret-key header, for purposes of authentication of the request on your end.

### Testing webhooks

During development you might want to test the requests and get the various webhook payloads. We suggest using an HTTP request capture tool, such as [mockbin](https://mockbin.org/) for such purposes.

### Example payloads

To the right are example payloads for different types of activities:


```json
// Change user role on experiment
{
  "message_items": {
    "experiment": {
      "type": "Experiment",
      "value": "Experiment-6",
      "id": 6,
      "value_for": "name"
    },
    "user_target": {
      "type": "User",
      "value": "admin",
      "id": 18,
      "value_for": "name"
    },
    "role": "Technician",
    "user": {
      "id": 16,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "experiment": "Experiment-6",
    "project": "My project-6",
    "team": "My team-6"
  },
  "type": "change_user_role_on_experiment",
  "created_at": "2021-12-29 11:23:14 +0000",
  "subject": {
    "type": "Experiment",
    "id": 6
  }
}
```


```json
// Change user role on my module
{
  "message_items": {
    "my_module": {
      "type": "MyModule",
      "value": "Task-6",
      "id": 6,
      "value_for": "name"
    },
    "user_target": {
      "type": "User",
      "value": "admin",
      "id": 39,
      "value_for": "name"
    },
    "role": "Technician",
    "user": {
      "id": 37,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "my_module": "Task-6",
    "experiment": "Experiment-13",
    "project": "My project-13",
    "team": "My team-13"
  },
  "type": "change_user_role_on_my_module",
  "created_at": "2021-12-29 11:23:17 +0000",
  "subject": {
    "type": "MyModule",
    "id": 6
  }
}
```


```json
// Edit image on step
{
  "message_items": {
    "step": {
      "type": "Step",
      "value": "Maranda Ankunding",
      "id": 3,
      "value_for": "name"
    },
    "step_position": {
      "type": "Step",
      "value": "1",
      "id": 3,
      "value_for": "position_plus_one"
    },
    "asset_name": {
      "type": "Asset",
      "value": "test.jpg",
      "id": 7,
      "value_for": "file_name"
    },
    "action": "editing started",
    "my_module": {
      "type": "MyModule",
      "value": "Task-11",
      "id": 11,
      "value_for": "name"
    },
    "user": {
      "id": 68,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": null,
    "my_module": "Task-11",
    "experiment": "Experiment-18",
    "project": "My project-36",
    "team": "My team-36"
  },
  "type": "edit_image_on_step",
  "created_at": "2021-12-29 11:23:22 +0000",
  "subject": {
    "type": "Protocol",
    "id": 12
  }
}
```


```json
// Archive module
{
  "message_items": {
    "my_module": {
      "type": "MyModule",
      "value": "Task-13",
      "id": 13,
      "value_for": "name"
    },
    "user": {
      "id": 70,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "my_module": "Task-13",
    "experiment": "Experiment-19",
    "project": "My project-37",
    "team": "My team-37"
  },
  "type": "archive_module",
  "created_at": "2021-12-29 11:23:23 +0000",
  "subject": {
    "type": "MyModule",
    "id": 13
  }
}
```


```json
// Move task
{
  "message_items": {
    "my_module": {
      "type": "MyModule",
      "value": "Task-18",
      "id": 18,
      "value_for": "name"
    },
    "experiment_original": {
      "type": "Experiment",
      "value": "Experiment-19",
      "id": 19,
      "value_for": "name"
    },
    "experiment_new": {
      "type": "Experiment",
      "value": "Experiment-20",
      "id": 20,
      "value_for": "name"
    },
    "user": {
      "id": 70,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "my_module": "Task-18",
    "experiment": "Experiment-20",
    "project": "My project-37",
    "team": "My team-37"
  },
  "type": "move_task",
  "created_at": "2021-12-29 11:23:23 +0000",
  "subject": {
    "type": "MyModule",
    "id": 18
  }
}
```


```json
// Designate user to my module
{
  "message_items": {
    "my_module": {
      "type": "MyModule",
      "value": "task_new1",
      "id": 20,
      "value_for": "name"
    },
    "user_target": {
      "type": "User",
      "value": "admin",
      "id": 70,
      "value_for": "name"
    },
    "user": {
      "id": 70,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "my_module": "task_new1",
    "experiment": "Experiment-19",
    "project": "My project-37",
    "team": "My team-37"
  },
  "type": "designate_user_to_my_module",
  "created_at": "2021-12-29 11:23:23 +0000",
  "subject": {
    "type": "MyModule",
    "id": 20
  }
}
```


```json
// Rename task
{
  "message_items": {
    "my_module": {
      "type": "MyModule",
      "value": "RenamedTask1",
      "id": 12,
      "value_for": "name"
    },
    "user": {
      "id": 70,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "my_module": "RenamedTask1",
    "experiment": "Experiment-19",
    "project": "My project-37",
    "team": "My team-37"
  },
  "type": "rename_task",
  "created_at": "2021-12-29 11:23:24 +0000",
  "subject": {
    "type": "MyModule",
    "id": 12
  }
}
```


```json
// Create module
{
  "message_items": {
    "my_module": {
      "type": "MyModule",
      "value": "task_new1",
      "id": 20,
      "value_for": "name"
    },
    "user": {
      "id": 70,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "my_module": "task_new1",
    "experiment": "Experiment-19",
    "project": "My project-37",
    "team": "My team-37"
  },
  "type": "create_module",
  "created_at": "2021-12-29 11:23:24 +0000",
  "subject": {
    "type": "MyModule",
    "id": 20
  }
}
```


```json
// Clone module
{
  "message_items": {
    "my_module_original": {
      "type": "MyModule",
      "value": "Task-16",
      "id": 16,
      "value_for": "name"
    },
    "my_module_new": {
      "type": "MyModule",
      "value": "clone_1",
      "id": 24,
      "value_for": "name"
    },
    "user": {
      "id": 70,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "my_module": "clone_1",
    "experiment": "Experiment-19",
    "project": "My project-37",
    "team": "My team-37"
  },
  "type": "clone_module",
  "created_at": "2021-12-29 11:23:24 +0000",
  "subject": {
    "type": "MyModule",
    "id": 24
  }
}
```


```json
// Create experiment
{
  "message_items": {
    "experiment": {
      "type": "Experiment",
      "value": "test experiment A1",
      "id": 24,
      "value_for": "name"
    },
    "user": {
      "id": 77,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "experiment": "test experiment A1",
    "project": "My project-39",
    "team": "My team-39"
  },
  "type": "create_experiment",
  "created_at": "2021-12-29 11:23:25 +0000",
  "subject": {
    "type": "Experiment",
    "id": 24
  }
}
```


```json
// Edit experiment
{
  "message_items": {
    "experiment": {
      "type": "Experiment",
      "value": "Experiment-24",
      "id": 26,
      "value_for": "name"
    },
    "user": {
      "id": 81,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "experiment": "Experiment-24",
    "project": "My project-41",
    "team": "My team-41"
  },
  "type": "edit_experiment",
  "created_at": "2021-12-29 11:23:26 +0000",
  "subject": {
    "type": "Experiment",
    "id": 26
  }
}
```


```json
// Restore experiment
{
  "message_items": {
    "experiment": {
      "type": "Experiment",
      "value": "Experiment-28",
      "id": 30,
      "value_for": "name"
    },
    "user": {
      "id": 87,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "experiment": "Experiment-28",
    "project": "My project-43",
    "team": "My team-43"
  },
  "type": "restore_experiment",
  "created_at": "2021-12-29 11:23:27 +0000",
  "subject": {
    "type": "Experiment",
    "id": 30
  }
}
```


```json
// Archive experiment
{
  "message_items": {
    "experiment": {
      "type": "Experiment",
      "value": "Experiment-30",
      "id": 32,
      "value_for": "name"
    },
    "user": {
      "id": 93,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "experiment": "Experiment-30",
    "project": "My project-45",
    "team": "My team-45"
  },
  "type": "archive_experiment",
  "created_at": "2021-12-29 11:23:27 +0000",
  "subject": {
    "type": "Experiment",
    "id": 32
  }
}
```


```json
// Invite user to team
{
  "message_items": {
    "team": {
      "type": "Team",
      "value": "My team-66",
      "id": 66,
      "value_for": "name"
    },
    "user_invited": {
      "type": "User",
      "value": "admin",
      "id": 122,
      "value_for": "name"
    },
    "role": "Guest",
    "user": {
      "id": 120,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "team": "My team-66"
  },
  "type": "invite_user_to_team",
  "created_at": "2021-12-29 11:23:30 +0000",
  "subject": {
    "type": "Team",
    "id": 66
  }
}
```


```json
// Add task tag
{
  "message_items": {
    "my_module": {
      "type": "MyModule",
      "value": "Task-47",
      "id": 53,
      "value_for": "name"
    },
    "tag": {
      "type": "Tag",
      "value": "My tag-2",
      "id": 2,
      "value_for": "name"
    },
    "user": {
      "id": 158,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "my_module": "Task-47",
    "experiment": "Experiment-50",
    "project": "My project-65",
    "team": "My team-84"
  },
  "type": "add_task_tag",
  "created_at": "2021-12-29 11:23:35 +0000",
  "subject": {
    "type": "MyModule",
    "id": 53
  }
}
```


```json
// Remove task tag
{
  "message_items": {
    "my_module": {
      "type": "MyModule",
      "value": "Task-49",
      "id": 55,
      "value_for": "name"
    },
    "tag": {
      "type": "Tag",
      "value": "My tag-4",
      "id": 4,
      "value_for": "name"
    },
    "user": {
      "id": 163,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "my_module": "Task-49",
    "experiment": "Experiment-52",
    "project": "My project-68",
    "team": "My team-87"
  },
  "type": "remove_task_tag",
  "created_at": "2021-12-29 11:23:35 +0000",
  "subject": {
    "type": "MyModule",
    "id": 55
  }
}
```


```json
// Change module description
{
  "message_items": {
    "my_module": {
      "type": "MyModule",
      "value": "Task-51",
      "id": 57,
      "value_for": "name"
    },
    "user": {
      "id": 168,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "my_module": "Task-51",
    "experiment": "Experiment-54",
    "project": "My project-71",
    "team": "My team-90"
  },
  "type": "change_module_description",
  "created_at": "2021-12-29 11:23:36 +0000",
  "subject": {
    "type": "MyModule",
    "id": 57
  }
}
```


```json
// Set task due date
{
  "message_items": {
    "my_module": {
      "type": "MyModule",
      "value": "Task-53",
      "id": 59,
      "value_for": "name"
    },
    "my_module_duedate": {
      "type": "Time",
      "value": 1553212740
    },
    "user": {
      "id": 172,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "my_module": "Task-53",
    "experiment": "Experiment-56",
    "project": "My project-73",
    "team": "My team-92"
  },
  "type": "set_task_due_date",
  "created_at": "2021-12-29 11:23:37 +0000",
  "subject": {
    "type": "MyModule",
    "id": 59
  }
}
```


```json
// Remove task due date
{
  "message_items": {
    "my_module": {
      "type": "MyModule",
      "value": "Task-55",
      "id": 61,
      "value_for": "name"
    },
    "my_module_duedate": {
      "type": "Time",
      "value": 1641330171
    },
    "user": {
      "id": 176,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "my_module": "Task-55",
    "experiment": "Experiment-58",
    "project": "My project-75",
    "team": "My team-94"
  },
  "type": "remove_task_due_date",
  "created_at": "2021-12-29 11:23:37 +0000",
  "subject": {
    "type": "MyModule",
    "id": 61
  }
}
```


```json
// Change task due date
{
  "message_items": {
    "my_module": {
      "type": "MyModule",
      "value": "Task-57",
      "id": 63,
      "value_for": "name"
    },
    "my_module_duedate": {
      "type": "Time",
      "value": 1550793540
    },
    "user": {
      "id": 180,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "my_module": "Task-57",
    "experiment": "Experiment-60",
    "project": "My project-77",
    "team": "My team-96"
  },
  "type": "change_task_due_date",
  "created_at": "2021-12-29 11:23:38 +0000",
  "subject": {
    "type": "MyModule",
    "id": 63
  }
}
```


```json
// Change status on task flow
{
  "message_items": {
    "my_module": {
      "type": "MyModule",
      "value": "Task-58",
      "id": 64,
      "value_for": "name"
    },
    "my_module_status_old": {
      "type": "MyModuleStatus",
      "value": "Not started",
      "id": 1,
      "value_for": "name"
    },
    "my_module_status_new": {
      "type": "MyModuleStatus",
      "value": "In progress",
      "id": 2,
      "value_for": "name"
    },
    "user": {
      "id": 182,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "my_module": "Task-58",
    "experiment": "Experiment-61",
    "project": "My project-78",
    "team": "My team-97"
  },
  "type": "change_status_on_task_flow",
  "created_at": "2021-12-29 11:23:38 +0000",
  "subject": {
    "type": "MyModule",
    "id": 64
  }
}
```


```json
// Restore module
{
  "message_items": {
    "my_module": {
      "type": "MyModule",
      "value": "Task-67",
      "id": 73,
      "value_for": "name"
    },
    "user": {
      "id": 194,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "my_module": "Task-67",
    "experiment": "Experiment-67",
    "project": "My project-85",
    "team": "My team-104"
  },
  "type": "restore_module",
  "created_at": "2021-12-29 11:23:41 +0000",
  "subject": {
    "type": "MyModule",
    "id": 73
  }
}
```


```json
// Add comment to project
{
  "message_items": {
    "project": {
      "type": "Project",
      "value": "My project-105",
      "id": 105,
      "value_for": "name"
    },
    "user": {
      "id": 246,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "project": "My project-105",
    "team": "My team-124"
  },
  "type": "add_comment_to_project",
  "created_at": "2021-12-29 11:23:49 +0000",
  "subject": {
    "type": "Project",
    "id": 105
  }
}
```


```json
// Edit project comment
{
  "message_items": {
    "project": {
      "type": "Project",
      "value": "My project-107",
      "id": 107,
      "value_for": "name"
    },
    "user": {
      "id": 250,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "project": "My project-107",
    "team": "My team-126"
  },
  "type": "edit_project_comment",
  "created_at": "2021-12-29 11:23:49 +0000",
  "subject": {
    "type": "Project",
    "id": 107
  }
}
```


```json
// Delete project comment
{
  "message_items": {
    "project": {
      "type": "Project",
      "value": "My project-109",
      "id": 109,
      "value_for": "name"
    },
    "user": {
      "id": 254,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "project": "My project-109",
    "team": "My team-128"
  },
  "type": "delete_project_comment",
  "created_at": "2021-12-29 11:23:50 +0000",
  "subject": {
    "type": "Project",
    "id": 109
  }
}
```


```json
// Move project
{
  "message_items": {
    "project": {
      "type": "Project",
      "value": "test project A",
      "id": 111,
      "value_for": "name"
    },
    "project_folder_to": {
      "type": "ProjectFolder",
      "value": "test folder A",
      "id": 1,
      "value_for": "name"
    },
    "project_folder_from": {
      "type": "ProjectFolder",
      "value": null,
      "value_for": "name",
      "id": null
    },
    "user": {
      "id": 256,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "project": "test project A",
    "team": "My team-129"
  },
  "type": "move_project",
  "created_at": "2021-12-29 11:23:50 +0000",
  "subject": {
    "type": "Project",
    "id": 111
  }
}
```


```json
// Move project folder
{
  "message_items": {
    "project_folder": {
      "type": "ProjectFolder",
      "value": "test folder B",
      "id": 2,
      "value_for": "name"
    },
    "project_folder_to": {
      "type": "ProjectFolder",
      "value": "test folder A",
      "id": 1,
      "value_for": "name"
    },
    "project_folder_from": {
      "type": "ProjectFolder",
      "value": null,
      "value_for": "name",
      "id": null
    },
    "user": {
      "id": 256,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "project_folder": "test folder B",
    "team": "My team-129"
  },
  "type": "move_project_folder",
  "created_at": "2021-12-29 11:23:50 +0000",
  "subject": {
    "type": "ProjectFolder",
    "id": 2
  }
}
```


```json
// Create project folder
{
  "message_items": {
    "project_folder": {
      "type": "ProjectFolder",
      "value": "My Proejct Folder",
      "id": 8,
      "value_for": "name"
    },
    "user": {
      "id": 262,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "project_folder": "My Proejct Folder",
    "team": "My team-132"
  },
  "type": "create_project_folder",
  "created_at": "2021-12-29 11:23:51 +0000",
  "subject": {
    "type": "ProjectFolder",
    "id": 8
  }
}
```


```json
// Rename project folder
{
  "message_items": {
    "project_folder": {
      "type": "ProjectFolder",
      "value": "new name",
      "id": 11,
      "value_for": "name"
    },
    "user": {
      "id": 268,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "project_folder": "new name",
    "team": "My team-135"
  },
  "type": "rename_project_folder",
  "created_at": "2021-12-29 11:23:52 +0000",
  "subject": {
    "type": "ProjectFolder",
    "id": 11
  }
}
```


```json
// Create project
{
  "message_items": {
    "project": {
      "type": "Project",
      "value": "test project A1",
      "id": 131,
      "value_for": "name"
    },
    "user": {
      "id": 272,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "project": "test project A1",
    "team": "My team-137"
  },
  "type": "create_project",
  "created_at": "2021-12-29 11:23:53 +0000",
  "subject": {
    "type": "Project",
    "id": 131
  }
}
```


```json
// Archive project
{
  "message_items": {
    "project": {
      "type": "Project",
      "value": "My project-158",
      "id": 167,
      "value_for": "name"
    },
    "user": {
      "id": 290,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "project": "My project-158",
    "team": "My team-146"
  },
  "type": "archive_project",
  "created_at": "2021-12-29 11:23:55 +0000",
  "subject": {
    "type": "Project",
    "id": 167
  }
}
```


```json
// Create protocol in repository
{
  "message_items": {
    "protocol": {
      "type": "Protocol",
      "value": "protocol_name",
      "id": 132,
      "value_for": "name"
    },
    "user": {
      "id": 300,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": "protocol_name",
    "team": "My team-151"
  },
  "type": "create_protocol_in_repository",
  "created_at": "2021-12-29 11:23:57 +0000",
  "subject": {
    "type": "Protocol",
    "id": 132
  }
}
```


```json
// Export protocol in repository
{
  "message_items": {
    "protocol": {
      "type": "Protocol",
      "value": "Rev. Waldo Crona",
      "id": 137,
      "value_for": "name"
    },
    "user": {
      "id": 306,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": "Rev. Waldo Crona",
    "team": "My team-153"
  },
  "type": "export_protocol_in_repository",
  "created_at": "2021-12-29 11:23:58 +0000",
  "subject": {
    "type": "Protocol",
    "id": 137
  }
}
```


```json
// Export protocol from task
{
  "message_items": {
    "my_module": {
      "type": "MyModule",
      "value": "Task-122",
      "id": 128,
      "value_for": "name"
    },
    "user": {
      "id": 313,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "my_module": "Task-122",
    "experiment": "Experiment-109",
    "project": "My project-178",
    "team": "My team-155"
  },
  "type": "export_protocol_from_task",
  "created_at": "2021-12-29 11:23:58 +0000",
  "subject": {
    "type": "MyModule",
    "id": 128
  }
}
```


```json
// Import protocol in repository
{
  "message_items": {
    "protocol": {
      "type": "Protocol",
      "value": "my_test_protocol",
      "id": 146,
      "value_for": "name"
    },
    "user": {
      "id": 318,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": "my_test_protocol",
    "team": "My team-157"
  },
  "type": "import_protocol_in_repository",
  "created_at": "2021-12-29 11:23:59 +0000",
  "subject": {
    "type": "Protocol",
    "id": 146
  }
}
```


```json
// Edit description in protocol repository
{
  "message_items": {
    "protocol": {
      "type": "Protocol",
      "value": "Kathyrn Bayer",
      "id": 150,
      "value_for": "name"
    },
    "user": {
      "id": 322,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": "Kathyrn Bayer",
    "team": "My team-159"
  },
  "type": "edit_description_in_protocol_repository",
  "created_at": "2021-12-29 11:23:59 +0000",
  "subject": {
    "type": "Protocol",
    "id": 150
  }
}
```


```json
// Edit keywords in protocol repository
{
  "message_items": {
    "protocol": {
      "type": "Protocol",
      "value": "Ossie Bode",
      "id": 154,
      "value_for": "name"
    },
    "user": {
      "id": 326,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": "Ossie Bode",
    "team": "My team-161"
  },
  "type": "edit_keywords_in_protocol_repository",
  "created_at": "2021-12-29 11:24:00 +0000",
  "subject": {
    "type": "Protocol",
    "id": 154
  }
}
```


```json
// Update protocol in task from repository
{
  "message_items": {
    "protocol": {
      "type": "Protocol",
      "value": "test protocol",
      "id": 160,
      "value_for": "name"
    },
    "my_module": {
      "type": "MyModule",
      "value": "Task-130",
      "id": 136,
      "value_for": "name"
    },
    "protocol_repository": {
      "type": "Protocol",
      "value": "test protocol",
      "id": 159,
      "value_for": "name"
    },
    "user": {
      "id": 330,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": "test protocol",
    "my_module": "Task-130",
    "experiment": "Experiment-117",
    "project": "My project-186",
    "team": "My team-163"
  },
  "type": "update_protocol_in_task_from_repository",
  "created_at": "2021-12-29 11:24:01 +0000",
  "subject": {
    "type": "Protocol",
    "id": 160
  }
}
```


```json
// Update protocol in repository from task
{
  "message_items": {
    "protocol": {
      "type": "Protocol",
      "value": "test protocol",
      "id": 166,
      "value_for": "name"
    },
    "my_module": {
      "type": "MyModule",
      "value": "Task-132",
      "id": 138,
      "value_for": "name"
    },
    "protocol_repository": {
      "type": "Protocol",
      "value": "test protocol",
      "id": 165,
      "value_for": "name"
    },
    "user": {
      "id": 334,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": "test protocol",
    "my_module": "Task-132",
    "experiment": "Experiment-119",
    "project": "My project-188",
    "team": "My team-165"
  },
  "type": "update_protocol_in_repository_from_task",
  "created_at": "2021-12-29 11:24:01 +0000",
  "subject": {
    "type": "Protocol",
    "id": 166
  }
}
```


```json
// Load protocol to task from repository
{
  "message_items": {
    "protocol": {
      "type": "Protocol",
      "value": "Hershel Heaney",
      "id": 172,
      "value_for": "name"
    },
    "my_module": {
      "type": "MyModule",
      "value": "Task-134",
      "id": 140,
      "value_for": "name"
    },
    "protocol_repository": {
      "type": "Protocol",
      "value": "Carson Streich",
      "id": 171,
      "value_for": "name"
    },
    "user": {
      "id": 338,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": "Hershel Heaney",
    "my_module": "Task-134",
    "experiment": "Experiment-121",
    "project": "My project-190",
    "team": "My team-167"
  },
  "type": "load_protocol_to_task_from_repository",
  "created_at": "2021-12-29 11:24:02 +0000",
  "subject": {
    "type": "Protocol",
    "id": 172
  }
}
```


```json
// Load protocol to task from file
{
  "message_items": {
    "protocol": {
      "type": "Protocol",
      "value": "Hugo Robel",
      "id": 176,
      "value_for": "name"
    },
    "my_module": {
      "type": "MyModule",
      "value": "Task-136",
      "id": 142,
      "value_for": "name"
    },
    "user": {
      "id": 342,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": "Hugo Robel",
    "my_module": "Task-136",
    "experiment": "Experiment-123",
    "project": "My project-192",
    "team": "My team-169"
  },
  "type": "load_protocol_to_task_from_file",
  "created_at": "2021-12-29 11:24:03 +0000",
  "subject": {
    "type": "Protocol",
    "id": 176
  }
}
```


```json
// Create report
{
  "message_items": {
    "report": {
      "type": "Report",
      "value": "test report created",
      "id": 2,
      "value_for": "name"
    },
    "user": {
      "id": 346,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "report": "test report created",
    "team": "My team-171"
  },
  "type": "create_report",
  "created_at": "2021-12-29 11:24:04 +0000",
  "subject": {
    "type": "Report",
    "id": 2
  }
}
```


```json
// Generate pdf report
{
  "message_items": {
    "report": {
      "type": "Report",
      "value": "test report created",
      "id": 2,
      "value_for": "name"
    },
    "user": {
      "id": 346,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "report": "test report created",
    "team": "My team-171"
  },
  "type": "generate_pdf_report",
  "created_at": "2021-12-29 11:24:04 +0000",
  "subject": {
    "type": "Report",
    "id": 2
  }
}
```


```json
// Edit report
{
  "message_items": {
    "report": {
      "type": "Report",
      "value": "test report update",
      "id": 4,
      "value_for": "name"
    },
    "user": {
      "id": 350,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "report": "test report update",
    "team": "My team-173"
  },
  "type": "edit_report",
  "created_at": "2021-12-29 11:24:06 +0000",
  "subject": {
    "type": "Report",
    "id": 4
  }
}
```


```json
// Delete report
{
  "message_items": {
    "report": {
      "type": "Report",
      "value": "test repot A1",
      "id": 6,
      "value_for": "name"
    },
    "user": {
      "id": 354,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "report": "test repot A1",
    "team": "My team-175"
  },
  "type": "delete_report",
  "created_at": "2021-12-29 11:24:08 +0000",
  "subject": {
    "type": "Report",
    "id": 6
  }
}
```


```json
// Create inventory
{
  "message_items": {
    "repository": {
      "type": "Repository",
      "value": "My Repository",
      "id": 27,
      "value_for": "name"
    },
    "user": {
      "id": 359,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "repository": "My Repository",
    "team": "My team-178"
  },
  "type": "create_inventory",
  "created_at": "2021-12-29 11:24:09 +0000",
  "subject": {
    "type": "RepositoryBase",
    "id": 27
  }
}
```


```json
// Delete inventory
{
  "message_items": {
    "repository": {
      "type": "Repository",
      "value": "My repository-27",
      "id": 29,
      "value_for": "name"
    },
    "user": {
      "id": 362,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "repository": "My repository-27",
    "team": "My team-180"
  },
  "type": "delete_inventory",
  "created_at": "2021-12-29 11:24:09 +0000",
  "subject": {
    "type": "RepositoryBase",
    "id": 29
  }
}
```


```json
// Rename inventory
{
  "message_items": {
    "repository": {
      "type": "Repository",
      "value": "new_name",
      "id": 31,
      "value_for": "name"
    },
    "user": {
      "id": 366,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "repository": "new_name",
    "team": "My team-182"
  },
  "type": "rename_inventory",
  "created_at": "2021-12-29 11:24:10 +0000",
  "subject": {
    "type": "RepositoryBase",
    "id": 31
  }
}
```


```json
// Export inventory items
{
  "message_items": {
    "repository": {
      "type": "Repository",
      "value": "My repository-31",
      "id": 33,
      "value_for": "name"
    },
    "user": {
      "id": 372,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "repository": "My repository-31",
    "team": "My team-184"
  },
  "type": "export_inventory_items",
  "created_at": "2021-12-29 11:24:11 +0000",
  "subject": {
    "type": "RepositoryBase",
    "id": 33
  }
}
```


```json
// Import inventory items
{
  "message_items": {
    "repository": {
      "type": "Repository",
      "value": "My repository-33",
      "id": 35,
      "value_for": "name"
    },
    "num_of_items": "",
    "user": {
      "id": 378,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "repository": "My repository-33",
    "team": "My team-186"
  },
  "type": "import_inventory_items",
  "created_at": "2021-12-29 11:24:11 +0000",
  "subject": {
    "type": "RepositoryBase",
    "id": 35
  }
}
```


```json
// Copy inventory item
{
  "message_items": {
    "repository_row_new": {
      "type": "RepositoryRow",
      "value": "My row-41 (1)",
      "id": 483,
      "value_for": "name"
    },
    "repository_row_original": {
      "type": "RepositoryRow",
      "value": "My row-41",
      "id": 481,
      "value_for": "name"
    },
    "user": {
      "id": 493,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "repository": "My repository-98",
    "team": "My team-251"
  },
  "type": "copy_inventory_item",
  "created_at": "2021-12-29 11:24:26 +0000",
  "subject": {
    "type": "RepositoryBase",
    "id": 100
  }
}
```


```json
// Create item inventory
{
  "message_items": {
    "repository_row": {
      "type": "RepositoryRow",
      "value": "row_name",
      "id": 489,
      "value_for": "name"
    },
    "repository": {
      "type": "Repository",
      "value": "My repository-102",
      "id": 104,
      "value_for": "name"
    },
    "user": {
      "id": 497,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "repository": "My repository-102",
    "team": "My team-255"
  },
  "type": "create_item_inventory",
  "created_at": "2021-12-29 11:24:26 +0000",
  "subject": {
    "type": "RepositoryBase",
    "id": 104
  }
}
```


```json
// Edit item inventory
{
  "message_items": {
    "repository_row": {
      "type": "RepositoryRow",
      "value": "row_name",
      "id": 492,
      "value_for": "name"
    },
    "repository": {
      "type": "Repository",
      "value": "My repository-106",
      "id": 108,
      "value_for": "name"
    },
    "user": {
      "id": 501,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "repository": "My repository-106",
    "team": "My team-259"
  },
  "type": "edit_item_inventory",
  "created_at": "2021-12-29 11:24:27 +0000",
  "subject": {
    "type": "RepositoryBase",
    "id": 108
  }
}
```


```json
// Delete item inventory
{
  "message_items": {
    "repository_row": {
      "type": "RepositoryRow",
      "value": "My row-53",
      "id": 496,
      "value_for": "name"
    },
    "repository": {
      "type": "Repository",
      "value": "My repository-110",
      "id": 112,
      "value_for": "name"
    },
    "user": {
      "id": 505,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "repository": "My repository-110",
    "team": "My team-263"
  },
  "type": "delete_item_inventory",
  "created_at": "2021-12-29 11:24:27 +0000",
  "subject": {
    "type": "RepositoryBase",
    "id": 112
  }
}
```


```json
// Archive inventory item
{
  "message_items": {
    "repository_row": {
      "type": "RepositoryRow",
      "value": "My row-55",
      "id": 498,
      "value_for": "name"
    },
    "user": {
      "id": 507,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "repository": "My repository-112",
    "team": "My team-265"
  },
  "type": "archive_inventory_item",
  "created_at": "2021-12-29 11:24:27 +0000",
  "subject": {
    "type": "RepositoryBase",
    "id": 114
  }
}
```


```json
// Restore inventory item
{
  "message_items": {
    "repository_row": {
      "type": "RepositoryRow",
      "value": "My row-67",
      "id": 510,
      "value_for": "name"
    },
    "user": {
      "id": 522,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "repository": "My repository-124",
    "team": "My team-280"
  },
  "type": "restore_inventory_item",
  "created_at": "2021-12-29 11:24:29 +0000",
  "subject": {
    "type": "RepositoryBase",
    "id": 126
  }
}
```


```json
// Edit result
{
  "message_items": {
    "result": {
      "type": "Result",
      "value": "Prof. Rocco Funk",
      "id": 4,
      "value_for": "name"
    },
    "type_of_result": "file",
    "user": {
      "id": 541,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "result": "Prof. Rocco Funk",
    "my_module": "Task-147",
    "experiment": "Experiment-132",
    "project": "My project-201",
    "team": "My team-297"
  },
  "type": "edit_result",
  "created_at": "2021-12-29 11:24:32 +0000",
  "subject": {
    "type": "Result",
    "id": 4
  }
}
```


```json
// Add comment to result
{
  "message_items": {
    "result": {
      "type": "Result",
      "value": "Prof. Dora Hahn",
      "id": 6,
      "value_for": "name"
    },
    "user": {
      "id": 545,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "result": "Prof. Dora Hahn",
    "my_module": "Task-149",
    "experiment": "Experiment-134",
    "project": "My project-203",
    "team": "My team-299"
  },
  "type": "add_comment_to_result",
  "created_at": "2021-12-29 11:24:33 +0000",
  "subject": {
    "type": "Result",
    "id": 6
  }
}
```


```json
// Edit result comment
{
  "message_items": {
    "result": {
      "type": "Result",
      "value": "Irish Koelpin LLD",
      "id": 8,
      "value_for": "name"
    },
    "user": {
      "id": 549,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "result": "Irish Koelpin LLD",
    "my_module": "Task-151",
    "experiment": "Experiment-136",
    "project": "My project-205",
    "team": "My team-301"
  },
  "type": "edit_result_comment",
  "created_at": "2021-12-29 11:24:34 +0000",
  "subject": {
    "type": "Result",
    "id": 8
  }
}
```


```json
// Delete result comment
{
  "message_items": {
    "result": {
      "type": "Result",
      "value": "Antonette Jast",
      "id": 10,
      "value_for": "name"
    },
    "user": {
      "id": 553,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "result": "Antonette Jast",
    "my_module": "Task-153",
    "experiment": "Experiment-138",
    "project": "My project-207",
    "team": "My team-303"
  },
  "type": "delete_result_comment",
  "created_at": "2021-12-29 11:24:34 +0000",
  "subject": {
    "type": "Result",
    "id": 10
  }
}
```


```json
// Add result
{
  "message_items": {
    "result": {
      "type": "Result",
      "value": "result name created",
      "id": 12,
      "value_for": "name"
    },
    "type_of_result": "table",
    "user": {
      "id": 557,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "result": "result name created",
    "my_module": "Task-155",
    "experiment": "Experiment-140",
    "project": "My project-209",
    "team": "My team-305"
  },
  "type": "add_result",
  "created_at": "2021-12-29 11:24:35 +0000",
  "subject": {
    "type": "Result",
    "id": 12
  }
}
```


```json
// Archive result
{
  "message_items": {
    "result": {
      "type": "Result",
      "value": "Fr. Kelsie Carroll",
      "id": 15,
      "value_for": "name"
    },
    "type_of_result": "table",
    "user": {
      "id": 563,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "result": "Fr. Kelsie Carroll",
    "my_module": "Task-158",
    "experiment": "Experiment-143",
    "project": "My project-212",
    "team": "My team-308"
  },
  "type": "archive_result",
  "created_at": "2021-12-29 11:24:36 +0000",
  "subject": {
    "type": "Result",
    "id": 15
  }
}
```


```json
// Destroy result
{
  "message_items": {
    "result": {
      "type": "Result",
      "value": "Rudy Hand",
      "id": 22,
      "value_for": "name"
    },
    "type_of_result": "text",
    "user": {
      "id": 577,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "result": "Rudy Hand",
    "my_module": "Task-165",
    "experiment": "Experiment-150",
    "project": "My project-219",
    "team": "My team-315"
  },
  "type": "destroy_result",
  "created_at": "2021-12-29 11:24:38 +0000",
  "subject": {
    "type": "Result",
    "id": 22
  }
}
```


```json
// Add comment to step
{
  "message_items": {
    "my_module": {
      "type": "MyModule",
      "value": "Task-167",
      "id": 173,
      "value_for": "name"
    },
    "step": {
      "type": "Step",
      "value": "Brendan Legros",
      "id": 9,
      "value_for": "name"
    },
    "step_position": {
      "type": "Step",
      "value": "1",
      "id": 9,
      "value_for": "position_plus_one"
    },
    "user": {
      "id": 581,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": null,
    "my_module": "Task-167",
    "experiment": "Experiment-152",
    "project": "My project-221",
    "team": "My team-317"
  },
  "type": "add_comment_to_step",
  "created_at": "2021-12-29 11:24:38 +0000",
  "subject": {
    "type": "Protocol",
    "id": 207
  }
}
```


```json
// Edit step comment
{
  "message_items": {
    "my_module": {
      "type": "MyModule",
      "value": "Task-169",
      "id": 175,
      "value_for": "name"
    },
    "step": {
      "type": "Step",
      "value": "Clifton Daniel",
      "id": 11,
      "value_for": "name"
    },
    "step_position": {
      "type": "Step",
      "value": "1",
      "id": 11,
      "value_for": "position_plus_one"
    },
    "user": {
      "id": 585,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": null,
    "my_module": "Task-169",
    "experiment": "Experiment-154",
    "project": "My project-223",
    "team": "My team-319"
  },
  "type": "edit_step_comment",
  "created_at": "2021-12-29 11:24:39 +0000",
  "subject": {
    "type": "Protocol",
    "id": 209
  }
}
```


```json
// Delete step comment
{
  "message_items": {
    "my_module": {
      "type": "MyModule",
      "value": "Task-171",
      "id": 177,
      "value_for": "name"
    },
    "step": {
      "type": "Step",
      "value": "Remedios Jakubowski",
      "id": 13,
      "value_for": "name"
    },
    "step_position": {
      "type": "Step",
      "value": "1",
      "id": 13,
      "value_for": "position_plus_one"
    },
    "user": {
      "id": 589,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": null,
    "my_module": "Task-171",
    "experiment": "Experiment-156",
    "project": "My project-225",
    "team": "My team-321"
  },
  "type": "delete_step_comment",
  "created_at": "2021-12-29 11:24:40 +0000",
  "subject": {
    "type": "Protocol",
    "id": 211
  }
}
```


```json
// Add step to protocol repository
{
  "message_items": {
    "step": {
      "type": "Step",
      "value": "test",
      "id": 15,
      "value_for": "name"
    },
    "step_position": {
      "type": "Step",
      "value": "1",
      "id": 15,
      "value_for": "position_plus_one"
    },
    "protocol": {
      "type": "Protocol",
      "value": "Tandy Abbott",
      "id": 215,
      "value_for": "name"
    },
    "user": {
      "id": 593,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": "Tandy Abbott",
    "team": "My team-323"
  },
  "type": "add_step_to_protocol_repository",
  "created_at": "2021-12-29 11:24:40 +0000",
  "subject": {
    "type": "Protocol",
    "id": 215
  }
}
```


```json
// Create step
{
  "message_items": {
    "step": {
      "type": "Step",
      "value": "test",
      "id": 17,
      "value_for": "name"
    },
    "step_position": {
      "type": "Step",
      "value": "1",
      "id": 17,
      "value_for": "position_plus_one"
    },
    "my_module": {
      "type": "MyModule",
      "value": "Task-175",
      "id": 181,
      "value_for": "name"
    },
    "user": {
      "id": 597,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": null,
    "my_module": "Task-175",
    "experiment": "Experiment-160",
    "project": "My project-229",
    "team": "My team-325"
  },
  "type": "create_step",
  "created_at": "2021-12-29 11:24:41 +0000",
  "subject": {
    "type": "Protocol",
    "id": 217
  }
}
```


```json
// Edit step in protocol repository
{
  "message_items": {
    "step": {
      "type": "Step",
      "value": "updated name",
      "id": 19,
      "value_for": "name"
    },
    "step_position": {
      "type": "Step",
      "value": "1",
      "id": 19,
      "value_for": "position_plus_one"
    },
    "protocol": {
      "type": "Protocol",
      "value": "Brice Gislason",
      "id": 221,
      "value_for": "name"
    },
    "user": {
      "id": 602,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": "Brice Gislason",
    "team": "My team-327"
  },
  "type": "edit_step_in_protocol_repository",
  "created_at": "2021-12-29 11:24:42 +0000",
  "subject": {
    "type": "Protocol",
    "id": 221
  }
}
```


```json
// Edit step
{
  "message_items": {
    "step": {
      "type": "Step",
      "value": "updated name",
      "id": 21,
      "value_for": "name"
    },
    "step_position": {
      "type": "Step",
      "value": "1",
      "id": 21,
      "value_for": "position_plus_one"
    },
    "my_module": {
      "type": "MyModule",
      "value": "Task-179",
      "id": 185,
      "value_for": "name"
    },
    "user": {
      "id": 607,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": null,
    "my_module": "Task-179",
    "experiment": "Experiment-164",
    "project": "My project-233",
    "team": "My team-329"
  },
  "type": "edit_step",
  "created_at": "2021-12-29 11:24:42 +0000",
  "subject": {
    "type": "Protocol",
    "id": 223
  }
}
```


```json
// Delete step in protocol repository
{
  "message_items": {
    "step": {
      "type": "Step",
      "value": "Alfredo Luettgen Jr.",
      "id": 23,
      "value_for": "name"
    },
    "step_position": {
      "type": "Step",
      "value": "1",
      "id": 23,
      "value_for": "position_plus_one"
    },
    "protocol": {
      "type": "Protocol",
      "value": "Cleo Hilll",
      "id": 227,
      "value_for": "name"
    },
    "user": {
      "id": 612,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": "Cleo Hilll",
    "team": "My team-331"
  },
  "type": "delete_step_in_protocol_repository",
  "created_at": "2021-12-29 11:24:43 +0000",
  "subject": {
    "type": "Protocol",
    "id": 227
  }
}
```


```json
// Destroy step
{
  "message_items": {
    "step": {
      "type": "Step",
      "value": "The Hon. Joleen Farrell",
      "id": 25,
      "value_for": "name"
    },
    "step_position": {
      "type": "Step",
      "value": "1",
      "id": 25,
      "value_for": "position_plus_one"
    },
    "my_module": {
      "type": "MyModule",
      "value": "Task-183",
      "id": 189,
      "value_for": "name"
    },
    "user": {
      "id": 617,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": null,
    "my_module": "Task-183",
    "experiment": "Experiment-168",
    "project": "My project-237",
    "team": "My team-333"
  },
  "type": "destroy_step",
  "created_at": "2021-12-29 11:24:44 +0000",
  "subject": {
    "type": "Protocol",
    "id": 229
  }
}
```


```json
// Check step checklist item
{
  "message_items": {
    "step": {
      "type": "Step",
      "value": "Leonel Toy",
      "id": 27,
      "value_for": "name"
    },
    "step_position": {
      "type": "Step",
      "value": "1",
      "id": 27,
      "value_for": "position_plus_one"
    },
    "my_module": {
      "type": "MyModule",
      "value": "Task-185",
      "id": 191,
      "value_for": "name"
    },
    "checkbox": "Debitis modi neque voluptatum earum ratione sunt excepturi aut dolores.",
    "num_completed": "1",
    "num_all": "1",
    "user": {
      "id": 621,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": null,
    "my_module": "Task-185",
    "experiment": "Experiment-170",
    "project": "My project-239",
    "team": "My team-335"
  },
  "type": "check_step_checklist_item",
  "created_at": "2021-12-29 11:24:44 +0000",
  "subject": {
    "type": "Protocol",
    "id": 231
  }
}
```


```json
// Uncheck step checklist item
{
  "message_items": {
    "step": {
      "type": "Step",
      "value": "Marty Jast",
      "id": 29,
      "value_for": "name"
    },
    "step_position": {
      "type": "Step",
      "value": "1",
      "id": 29,
      "value_for": "position_plus_one"
    },
    "my_module": {
      "type": "MyModule",
      "value": "Task-187",
      "id": 193,
      "value_for": "name"
    },
    "checkbox": "Magni et doloremque minus facilis earum officiis ea unde ut.",
    "num_completed": "0",
    "num_all": "1",
    "user": {
      "id": 625,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": null,
    "my_module": "Task-187",
    "experiment": "Experiment-172",
    "project": "My project-241",
    "team": "My team-337"
  },
  "type": "uncheck_step_checklist_item",
  "created_at": "2021-12-29 11:24:45 +0000",
  "subject": {
    "type": "Protocol",
    "id": 233
  }
}
```


```json
// Complete step
{
  "message_items": {
    "step": {
      "type": "Step",
      "value": "Karl Cronin",
      "id": 31,
      "value_for": "name"
    },
    "step_position": {
      "type": "Step",
      "value": "1",
      "id": 31,
      "value_for": "position_plus_one"
    },
    "my_module": {
      "type": "MyModule",
      "value": "Task-189",
      "id": 195,
      "value_for": "name"
    },
    "num_completed": "1",
    "num_all": "1",
    "user": {
      "id": 629,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": null,
    "my_module": "Task-189",
    "experiment": "Experiment-174",
    "project": "My project-243",
    "team": "My team-339"
  },
  "type": "complete_step",
  "created_at": "2021-12-29 11:24:46 +0000",
  "subject": {
    "type": "Protocol",
    "id": 235
  }
}
```


```json
// Uncomplete step
{
  "message_items": {
    "step": {
      "type": "Step",
      "value": "Ozzie Bergnaum",
      "id": 33,
      "value_for": "name"
    },
    "step_position": {
      "type": "Step",
      "value": "1",
      "id": 33,
      "value_for": "position_plus_one"
    },
    "my_module": {
      "type": "MyModule",
      "value": "Task-191",
      "id": 197,
      "value_for": "name"
    },
    "num_completed": "0",
    "num_all": "1",
    "user": {
      "id": 633,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": null,
    "my_module": "Task-191",
    "experiment": "Experiment-176",
    "project": "My project-245",
    "team": "My team-341"
  },
  "type": "uncomplete_step",
  "created_at": "2021-12-29 11:24:46 +0000",
  "subject": {
    "type": "Protocol",
    "id": 237
  }
}
```


```json
// Create tag
{
  "message_items": {
    "tag": {
      "type": "Tag",
      "value": "name",
      "id": 6,
      "value_for": "name"
    },
    "project": {
      "type": "Project",
      "value": "My project-247",
      "id": 256,
      "value_for": "name"
    },
    "user": {
      "id": 642,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "project": "My project-247",
    "team": "My team-343"
  },
  "type": "create_tag",
  "created_at": "2021-12-29 11:24:48 +0000",
  "subject": {
    "type": "Project",
    "id": 256
  }
}
```


```json
// Edit tag
{
  "message_items": {
    "tag": {
      "type": "Tag",
      "value": "Name2",
      "id": 8,
      "value_for": "name"
    },
    "project": {
      "type": "Project",
      "value": "My project-249",
      "id": 258,
      "value_for": "name"
    },
    "user": {
      "id": 646,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "project": "My project-249",
    "team": "My team-345"
  },
  "type": "edit_tag",
  "created_at": "2021-12-29 11:24:48 +0000",
  "subject": {
    "type": "Project",
    "id": 258
  }
}
```


```json
// Delete tag
{
  "message_items": {
    "tag": {
      "type": "Tag",
      "value": "My tag-8",
      "id": 10,
      "value_for": "name"
    },
    "project": {
      "type": "Project",
      "value": "My project-251",
      "id": 260,
      "value_for": "name"
    },
    "user": {
      "id": 650,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "project": "My project-251",
    "team": "My team-347"
  },
  "type": "delete_tag",
  "created_at": "2021-12-29 11:24:49 +0000",
  "subject": {
    "type": "Project",
    "id": 260
  }
}
```


```json
// Unshare inventory
{
  "message_items": {
    "repository": {
      "type": "Repository",
      "value": "My repository-136",
      "id": 138,
      "value_for": "name"
    },
    "team": {
      "type": "Team",
      "value": "My team-349",
      "id": 349,
      "value_for": "name"
    },
    "permission_level": "view-only",
    "user": {
      "id": 652,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "repository": "My repository-136",
    "team": "My team-348"
  },
  "type": "unshare_inventory",
  "created_at": "2021-12-29 11:24:49 +0000",
  "subject": {
    "type": "RepositoryBase",
    "id": 138
  }
}
```


```json
// Export projects
{
  "message_items": {
    "team": {
      "type": "Team",
      "value": "My team-362",
      "id": 362,
      "value_for": "name"
    },
    "projects": "My project-254, My project-255",
    "user": {
      "id": 674,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "team": "My team-362"
  },
  "type": "export_projects",
  "created_at": "2021-12-29 11:24:55 +0000",
  "subject": {
    "type": "Team",
    "id": 362
  }
}
```


```json
// Undesignate user from my module
{
  "message_items": {
    "my_module": {
      "type": "MyModule",
      "value": "Task-201",
      "id": 207,
      "value_for": "name"
    },
    "user_target": {
      "type": "User",
      "value": "admin",
      "id": 681,
      "value_for": "name"
    },
    "user": {
      "id": 681,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "my_module": "Task-201",
    "experiment": "Experiment-186",
    "project": "My project-259",
    "team": "My team-366"
  },
  "type": "undesignate_user_from_my_module",
  "created_at": "2021-12-29 11:24:56 +0000",
  "subject": {
    "type": "MyModule",
    "id": 207
  }
}
```


```json
// Remove user from team
{
  "message_items": {
    "team": {
      "type": "Team",
      "value": "My team-368",
      "id": 368,
      "value_for": "name"
    },
    "user_removed": {
      "type": "User",
      "value": "admin",
      "id": 686,
      "value_for": "name"
    },
    "user": {
      "id": 685,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "team": "My team-368"
  },
  "type": "remove_user_from_team",
  "created_at": "2021-12-29 11:24:56 +0000",
  "subject": {
    "type": "Team",
    "id": 368
  }
}
```


```json
// User leave team
{
  "message_items": {
    "team": {
      "type": "Team",
      "value": "My team-371",
      "id": 371,
      "value_for": "name"
    },
    "user": {
      "id": 691,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "team": "My team-371"
  },
  "type": "user_leave_team",
  "created_at": "2021-12-29 11:24:57 +0000",
  "subject": {
    "type": "Team",
    "id": 371
  }
}
```


```json
// Change users role on team
{
  "message_items": {
    "team": {
      "type": "Team",
      "value": "My team-373",
      "id": 373,
      "value_for": "name"
    },
    "user_changed": {
      "type": "User",
      "value": "admin",
      "id": 696,
      "value_for": "name"
    },
    "role": "Administrator",
    "user": {
      "id": 695,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "team": "My team-373"
  },
  "type": "change_users_role_on_team",
  "created_at": "2021-12-29 11:24:57 +0000",
  "subject": {
    "type": "Team",
    "id": 373
  }
}
```


```json
// Edit wopi file on result
{
  "message_items": {
    "result": {
      "type": "Result",
      "value": "test result",
      "id": 24,
      "value_for": "name"
    },
    "asset_name": {
      "type": "Asset",
      "value": "test.jpg",
      "id": 12,
      "value_for": "file_name"
    },
    "action": "editing finished",
    "user": {
      "id": 707,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "result": "test result",
    "my_module": "Task-203",
    "experiment": "Experiment-188",
    "project": "My project-261",
    "team": "My team-375"
  },
  "type": "edit_wopi_file_on_result",
  "created_at": "2021-12-29 11:25:00 +0000",
  "subject": {
    "type": "Result",
    "id": 24
  }
}
```


```json
// Edit wopi file on step
{
  "message_items": {
    "step": {
      "type": "Step",
      "value": "Scot Cummings",
      "id": 35,
      "value_for": "name"
    },
    "step_position": {
      "type": "Step",
      "value": "1",
      "id": 35,
      "value_for": "position_plus_one"
    },
    "asset_name": {
      "type": "Asset",
      "value": "test.jpg",
      "id": 14,
      "value_for": "file_name"
    },
    "action": "editing finished",
    "my_module": {
      "type": "MyModule",
      "value": "Task-205",
      "id": 211,
      "value_for": "name"
    },
    "user": {
      "id": 711,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": null,
    "my_module": "Task-205",
    "experiment": "Experiment-190",
    "project": "My project-263",
    "team": "My team-377"
  },
  "type": "edit_wopi_file_on_step",
  "created_at": "2021-12-29 11:25:01 +0000",
  "subject": {
    "type": "Protocol",
    "id": 251
  }
}
```


```json
// Edit wopi file on step in repository
{
  "message_items": {
    "step": {
      "type": "Step",
      "value": "Edris DuBuque",
      "id": 37,
      "value_for": "name"
    },
    "step_position": {
      "type": "Step",
      "value": "1",
      "id": 37,
      "value_for": "position_plus_one"
    },
    "asset_name": {
      "type": "Asset",
      "value": "test.jpg",
      "id": 16,
      "value_for": "file_name"
    },
    "action": "editing finished",
    "protocol": {
      "type": "Protocol",
      "value": "Msgr. Rhoda Champlin",
      "id": 255,
      "value_for": "name"
    },
    "user": {
      "id": 716,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": "Msgr. Rhoda Champlin",
    "team": "My team-379"
  },
  "type": "edit_wopi_file_on_step_in_repository",
  "created_at": "2021-12-29 11:25:02 +0000",
  "subject": {
    "type": "Protocol",
    "id": 255
  }
}
```


```json
// Add comment to module
{
  "message_items": {
    "user": {
      "id": 790,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
  },
  "type": "add_comment_to_module",
  "created_at": "2021-12-29 11:25:14 +0000",
  "subject": {
    "type": "MyModule",
    "id": 19
  }
}
```


```json
// Unassign user from project
{
  "message_items": {
    "project": {
      "type": "Project",
      "value": "My project-333",
      "id": 337,
      "value_for": "name"
    },
    "user_target": {
      "type": "User",
      "value": "admin",
      "id": 877,
      "value_for": "name"
    },
    "role": "Owner",
    "user": {
      "id": 877,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "project": "My project-333",
    "team": "My team-479"
  },
  "type": "unassign_user_from_project",
  "created_at": "2021-12-29 11:25:29 +0000",
  "subject": {
    "type": "Project",
    "id": 337
  }
}
```


```json
// Archive protocol in repository
{
  "message_items": {
    "protocol": {
      "type": "Protocol",
      "value": "Jason Prohaska PhD",
      "id": 441,
      "value_for": "name"
    },
    "user": {
      "id": 902,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": "Jason Prohaska PhD",
    "team": "My team-500"
  },
  "type": "archive_protocol_in_repository",
  "created_at": "2021-12-29 11:25:32 +0000",
  "subject": {
    "type": "Protocol",
    "id": 441
  }
}
```


```json
// Restore protocol in repository
{
  "message_items": {
    "protocol": {
      "type": "Protocol",
      "value": "Rosalia Marquardt",
      "id": 443,
      "value_for": "name"
    },
    "user": {
      "id": 906,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": "Rosalia Marquardt",
    "team": "My team-502"
  },
  "type": "restore_protocol_in_repository",
  "created_at": "2021-12-29 11:25:32 +0000",
  "subject": {
    "type": "Protocol",
    "id": 443
  }
}
```


```json
// Move protocol in repository
{
  "message_items": {
    "protocol": {
      "type": "Protocol",
      "value": "Mrs. Roxy Kshlerin",
      "id": 445,
      "value_for": "name"
    },
    "storage": "My protocols to Team protocols",
    "user": {
      "id": 910,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": "Mrs. Roxy Kshlerin",
    "team": "My team-504"
  },
  "type": "move_protocol_in_repository",
  "created_at": "2021-12-29 11:25:33 +0000",
  "subject": {
    "type": "Protocol",
    "id": 445
  }
}
```


```json
// Copy protocol in repository
{
  "message_items": {
    "protocol_new": {
      "type": "Protocol",
      "value": "Katie Crooks (1)",
      "id": 451,
      "value_for": "name"
    },
    "protocol_original": {
      "type": "Protocol",
      "value": "Katie Crooks",
      "id": 450,
      "value_for": "name"
    },
    "user": {
      "id": 918,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "protocol": "Katie Crooks",
    "team": "My team-508"
  },
  "type": "copy_protocol_in_repository",
  "created_at": "2021-12-29 11:25:33 +0000",
  "subject": {
    "type": "Protocol",
    "id": 450
  }
}
```


```json
// Copy inventory
{
  "message_items": {
    "repository_new": {
      "type": "Repository",
      "value": "name for copied repo",
      "id": 224,
      "value_for": "name"
    },
    "repository_original": {
      "type": "Repository",
      "value": "My repository-242",
      "id": 223,
      "value_for": "name"
    },
    "user": {
      "id": 1325,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "repository": "name for copied repo",
    "team": "My team-613"
  },
  "type": "copy_inventory",
  "created_at": "2021-12-29 11:26:08 +0000",
  "subject": {
    "type": "RepositoryBase",
    "id": 224
  }
}
```


```json
// Archive inventory
{
  "message_items": {
    "repository": {
      "type": "Repository",
      "value": "My repository-314",
      "id": 303,
      "value_for": "name"
    },
    "user": {
      "id": 3501,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "repository": "My repository-314",
    "team": "My team-1057"
  },
  "type": "archive_inventory",
  "created_at": "2021-12-29 11:29:53 +0000",
  "subject": {
    "type": "RepositoryBase",
    "id": 303
  }
}
```


```json
// Share inventory
{
  "message_items": {
    "repository": {
      "type": "Repository",
      "value": "My repository-322",
      "id": 311,
      "value_for": "name"
    },
    "team": {
      "type": "Team",
      "value": "My team-1063",
      "id": 1009,
      "value_for": "name"
    },
    "permission_level": "view-only",
    "user": {
      "id": 3529,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "repository": "My repository-322",
    "team": "My team-1062"
  },
  "type": "share_inventory",
  "created_at": "2021-12-29 11:29:55 +0000",
  "subject": {
    "type": "RepositoryBase",
    "id": 311
  }
}
```


```json
// Update share inventory
{
  "message_items": {
    "repository": {
      "type": "Repository",
      "value": "My repository-328",
      "id": 317,
      "value_for": "name"
    },
    "team": {
      "type": "Team",
      "value": "My team-1073",
      "id": 1019,
      "value_for": "name"
    },
    "permission_level": "view-only",
    "user": {
      "id": 3551,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "repository": "My repository-328",
    "team": "My team-1072"
  },
  "type": "update_share_inventory",
  "created_at": "2021-12-29 11:29:57 +0000",
  "subject": {
    "type": "RepositoryBase",
    "id": 317
  }
}
```


```json
// Share inventory with all
{
  "message_items": {
    "repository": {
      "type": "Repository",
      "value": "My repository-331",
      "id": 320,
      "value_for": "name"
    },
    "team": {
      "type": "Team",
      "value": "My team-1077",
      "id": 1023,
      "value_for": "name"
    },
    "permission_level": "edit",
    "user": {
      "id": 3562,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "repository": "My repository-331",
    "team": "My team-1077"
  },
  "type": "share_inventory_with_all",
  "created_at": "2021-12-29 11:29:58 +0000",
  "subject": {
    "type": "RepositoryBase",
    "id": 320
  }
}
```


```json
// Restore inventory
{
  "message_items": {
    "repository": {
      "type": "Repository",
      "value": "My repository-333",
      "id": 322,
      "value_for": "name"
    },
    "user": {
      "id": 3573,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "repository": "My repository-333",
    "team": "My team-1079"
  },
  "type": "restore_inventory",
  "created_at": "2021-12-29 11:29:58 +0000",
  "subject": {
    "type": "RepositoryBase",
    "id": 322
  }
}
```


```json
// Create column inventory
{
  "message_items": {
    "repository_column": {
      "type": "RepositoryColumn",
      "value": "myrepo",
      "id": 180,
      "value_for": "name"
    },
    "repository": {
      "type": "Repository",
      "value": "My repository-362",
      "id": 352,
      "value_for": "name"
    },
    "user": {
      "id": 3789,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "repository": "My repository-362",
    "team": "My team-1106"
  },
  "type": "create_column_inventory",
  "created_at": "2021-12-29 11:30:16 +0000",
  "subject": {
    "type": "RepositoryBase",
    "id": 352
  }
}
```


```json
// Edit column inventory
{
  "message_items": {
    "repository_column": {
      "type": "RepositoryColumn",
      "value": "my new column",
      "id": 184,
      "value_for": "name"
    },
    "repository": {
      "type": "Repository",
      "value": "My repository-370",
      "id": 360,
      "value_for": "name"
    },
    "user": {
      "id": 3817,
      "value": "admin",
      "type": "User",
      "value_for": "full_name"
    }
  },
  "breadcrumbs": {
    "repository": "My repository-370",
    "team": "My team-1117"
  },
  "type": "edit_column_inventory",
  "created_at": "2021-12-29 11:30:18 +0000",
  "subject": {
    "type": "RepositoryBase",
    "id": 360
  }
}
```
