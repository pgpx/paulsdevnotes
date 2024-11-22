# DVC

* <https://dvc.org/>, [Docs](https://dvc.org/doc/)

Articles

* [Automate model deployment to Amazon SageMaker with the DVC Model Registry](https://dvc.ai/blog/sagemaker-model-deployment)

# Bugs

## Can't use git > 2.44.0

When upgraded to git 2.45.0 (from 2.44.0, via Homebrew), git credentials do not work:

```bash
2024-11-22 10:41:06,865 ERROR: unexpected error - unexpected http resp 400 for https://gitlab.devops.telekom.de/llm-assistant/models-team/pipelines/llm-evaluation.git/info/refs?service=git-upload-pack
Traceback (most recent call last):
  File "/Users/A87178287/Library/Caches/pypoetry/virtualenvs/llm-evaluation-Nbua43Tr-py3.12/lib/python3.12/site-packages/scmrepo/git/backend/dulwich/client.py", line 50, in _http_request
    result = super()._http_request(
             ^^^^^^^^^^^^^^^^^^^^^^
  File "/Users/A87178287/Library/Caches/pypoetry/virtualenvs/llm-evaluation-Nbua43Tr-py3.12/lib/python3.12/site-packages/dulwich/client.py", line 2719, in _http_request
    raise HTTPUnauthorized(resp.headers.get("WWW-Authenticate"), url)
dulwich.client.HTTPUnauthorized: No valid credentials provided

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/Users/A87178287/Library/Caches/pypoetry/virtualenvs/llm-evaluation-Nbua43Tr-py3.12/lib/python3.12/site-packages/dvc/cli/__init__.py", line 211, in main
    ret = cmd.do_run()
          ^^^^^^^^^^^^
  File "/Users/A87178287/Library/Caches/pypoetry/virtualenvs/llm-evaluation-Nbua43Tr-py3.12/lib/python3.12/site-packages/dvc/cli/command.py", line 27, in do_run
    return self.run()
           ^^^^^^^^^^
  File "/Users/A87178287/Library/Caches/pypoetry/virtualenvs/llm-evaluation-Nbua43Tr-py3.12/lib/python3.12/site-packages/dvc/commands/experiments/pull.py", line 14, in run
    pulled_exps = self.repo.experiments.pull(
                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/Users/A87178287/Library/Caches/pypoetry/virtualenvs/llm-evaluation-Nbua43Tr-py3.12/lib/python3.12/site-packages/dvc/repo/experiments/__init__.py", line 369, in pull
    return pull(self.repo, *args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/Users/A87178287/Library/Caches/pypoetry/virtualenvs/llm-evaluation-Nbua43Tr-py3.12/lib/python3.12/site-packages/dvc/repo/__init__.py", line 58, in wrapper
    return f(repo, *args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^
  File "/Users/A87178287/Library/Caches/pypoetry/virtualenvs/llm-evaluation-Nbua43Tr-py3.12/lib/python3.12/site-packages/dvc/repo/scm_context.py", line 143, in run
    return method(repo, *args, **kw)
           ^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/Users/A87178287/Library/Caches/pypoetry/virtualenvs/llm-evaluation-Nbua43Tr-py3.12/lib/python3.12/site-packages/dvc/repo/experiments/pull.py", line 35, in pull
    exp_ref_set.update(exp_refs(repo.scm, git_remote))
  File "/Users/A87178287/Library/Caches/pypoetry/virtualenvs/llm-evaluation-Nbua43Tr-py3.12/lib/python3.12/site-packages/dvc/repo/experiments/utils.py", line 86, in exp_refs
    for ref in ref_gen:
               ^^^^^^^
  File "/Users/A87178287/Library/Caches/pypoetry/virtualenvs/llm-evaluation-Nbua43Tr-py3.12/lib/python3.12/site-packages/dvc/repo/experiments/utils.py", line 119, in iter_remote_refs
    yield from scm.iter_remote_refs(url, base=base, **kwargs)
  File "/Users/A87178287/Library/Caches/pypoetry/virtualenvs/llm-evaluation-Nbua43Tr-py3.12/lib/python3.12/site-packages/scmrepo/git/backend/dulwich/__init__.py", line 592, in iter_remote_refs
    for ref in client.get_refs(path)
               ^^^^^^^^^^^^^^^^^^^^^
  File "/Users/A87178287/Library/Caches/pypoetry/virtualenvs/llm-evaluation-Nbua43Tr-py3.12/lib/python3.12/site-packages/dulwich/client.py", line 2622, in get_refs
    refs, _, _ = self._discover_references(b"git-upload-pack", url)
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/Users/A87178287/Library/Caches/pypoetry/virtualenvs/llm-evaluation-Nbua43Tr-py3.12/lib/python3.12/site-packages/dulwich/client.py", line 2343, in _discover_references
    resp, read = self._http_request(url, headers)
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/Users/A87178287/Library/Caches/pypoetry/virtualenvs/llm-evaluation-Nbua43Tr-py3.12/lib/python3.12/site-packages/scmrepo/git/backend/dulwich/client.py", line 61, in _http_request
    result = super()._http_request(
             ^^^^^^^^^^^^^^^^^^^^^^
  File "/Users/A87178287/Library/Caches/pypoetry/virtualenvs/llm-evaluation-Nbua43Tr-py3.12/lib/python3.12/site-packages/dulwich/client.py", line 2723, in _http_request
    raise GitProtocolError(
dulwich.errors.GitProtocolError: unexpected http resp 400 for https://gitlab.devops.telekom.de/llm-assistant/models-team/pipelines/llm-evaluation.git/info/refs?service=git-upload-pack
```

Git did make some changes to osxkeychain for 2.45.0:

      osxkeychain: replace deprecated SecKeychain API
      osxkeychain: erase all matching credentials
      osxkeychain: erase matching passwords only
      osxkeychain: store new attributes

https://lore.kernel.org/git/xmqq8r0ww0sj.fsf@gitster.g/T/

DVC auth logic should be handled in https://github.com/iterative/scmrepo/blob/main/src/scmrepo/git/credentials.py.