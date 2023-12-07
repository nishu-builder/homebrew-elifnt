1. Make a new tag: `git tag -a "v0.0.x" && git push v0.0.x`

2. Make a new cpython-elifnt release on github

3. Download the .tar.gz, get its hash: `shasum -a 256 cpython-elifnt-0.0.x.tar.gz`

4. Make a new brew package file here

5. Test it locally: `brew install --build-from-source elifnt@3.13.0a1-0.0.x.rb`

6. Push new brew package file to homebrew-elifnt github repo

7. Build docker image with new tag: `docker build --build-arg ELIFNT_VERSION=3.13.0a1-0.0.x . -f=Dockerfile.elifnt -t nishubuilder/python-elifnt:3.13.0a1-0.0.x`

8. Push new Docker image: `docker push nishubuilder/python-elifnt:3.13.0a1-0.0.x`
