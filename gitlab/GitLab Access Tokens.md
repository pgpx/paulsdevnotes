# GitLab Access Tokens

* [Bot users for groups](https://gitlab.devops.telekom.de/help/user/group/settings/group_access_tokens#bot-users-for-groups) - creating a group-level access token via the UI will also create a `group_<id>_bot` user in that group.

## Personal access tokens

[Self-rotate (the current personal access token)](https://docs.gitlab.com/api/group_access_tokens/#self-rotate)

```bash
curl -v --request POST  -H'PRIVATE-TOKEN: glpat-xxx' --data 'expires_at=2025-12-25'  https://gitlab/api/v4/groups/297369/access_tokens/self/rotate | jq
```

gives:

```json
{
  "id": 303344,
  "name": "token-name",
  "revoked": false,
  "created_at": "2025-10-23T12:31:32.608Z",
  "description": "",
  "scopes": [
    "self_rotate",
    "read_repository"
  ],
  "user_id": 336062,
  "last_used_at": null,
  "active": true,
  "expires_at": "2025-12-25",
  "access_level": 20,
  "resource_type": "group",
  "resource_id": 297369,
  "token": "glpat-new-token"
}
```

Use the Personal Access token [self-inform API](https://docs.gitlab.com/api/personal_access_tokens/#self-inform) Get details on the access token:

```curl
curl -v -H'PRIVATE-TOKEN: glpat-XXX' https://gitlab/api/v4/personal_access_tokens/self | jq
```

gives:

```json
{
  "id": 303350,
  "name": "token-name",
  "revoked": false,
  "created_at": "2025-10-23T12:38:40.170Z",
  "description": "token-description",
  "scopes": [
    "self_rotate",
    "read_repository"
  ],
  "user_id": 336067,
  "last_used_at": "2025-10-23T12:44:47.727Z",
  "active": true,
  "expires_at": "2026-10-23",
  "last_used_ips": [
    "1.2.3.4"
  ]
}
```

Get [user details](https://docs.gitlab.com/api/users/#as-a-regular-user-1) (needs `read_api` scope):

```bash
curl -v -H'PRIVATE-TOKEN: glpat-XXX' https://gitlab.devops.telekom.de/api/v4/users/336067 | jq
```

gives:

```json
{
  "id": 336067,
  "username": "group_297369_bot_0ranodom",
  "public_email": null,
  "name": "token-name",
  "state": "active",
  "locked": false,
  "avatar_url": null,
  "web_url": "https://gitlab/group_297369_bot_0random",
  "bio": "",
  "location": "",
  "linkedin": "",
  "twitter": "",
  "discord": "",
  "website_url": "",
  "github": "",
  "job_title": "",
  "pronouns": null,
  "organization": "",
  "bot": true,
  "work_information": null,
  "local_time": null
}
```