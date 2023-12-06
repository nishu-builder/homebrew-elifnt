How to release a new version

1. Make a new tag
```
git tag -a "v0.0.5"
git push v0.0.5
```

2. Make a new release on github

3. Download the .tar.gz, get its hash: `shasum -a 256 cpython-elifnt-0.0.5.tar.gz`

4. Make a new .rb file here, use the hash.

5. Test it locally: `brew install --build-from-source ./elifnt-distribution/elifnt@3.13.0a1-0.0.5.rb`

6. Push
