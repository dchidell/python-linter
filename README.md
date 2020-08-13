# python-linter

Super simple python linter for CICD jobs using black and flake8.

ENV var for `LINE_LEN` is available (defaults to 120 because I don't know how to write good code)

Entrypoint automatically runs the following:

`find . -name '*.py' | xargs -I % sh -c '{ black --diff -l $LINE_LEN --check -S %; flake8 --max-line-length $LINE_LEN %; }'`

Example script args within CICD (if the entrypoint isn't enough):

```
find . -name "*.py" | xargs black --diff -l $LINE_LEN --check -S
```

