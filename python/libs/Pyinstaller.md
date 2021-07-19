# Pyinstaller

* <http://www.pyinstaller.org/>

PyInstaller freezes (packages) Python applications into stand-alone executables, under Windows, GNU/Linux, Mac OS X, FreeBSD, Solaris and AIX.

* Docs - <https://pyinstaller.readthedocs.io/en/stable/>
* [GitHub](https://github.com/pyinstaller/pyinstaller)
* StaticX [GitHub](https://github.com/JonathonReinhart/staticx) - Bundle dynamic executables with their library dependencies so they can be run anywhere, just like a static executable.

## Scratch-based Docker images

* <https://medium.com/analytics-vidhya/dockerizing-a-rest-api-in-python-less-than-9-mb-and-based-on-scratch-image-ef0ee3ad3f0a>
* PatchELF - <https://github.com/NixOS/patchelf>

```dockerfile
FROM python:3.9.6-buster as build
RUN apt-get update -y && apt-get install -y patchelf
WORKDIR /docker-build/
COPY requirements.txt /docker-build/
RUN pip install --upgrade --no-cache-dir pip && pip install --no-cache-dir -r requirements.txt
# Can't get this to successfully install from requirements.txt!
RUN pip install --no-cache-dir staticx==0.12.2
COPY src/ /docker-build/
RUN python3 -m unittest discover -p '*_test.py'
# Build a single executable from the Python script
# https://medium.com/analytics-vidhya/dockerizing-a-rest-api-in-python-less-than-9-mb-and-based-on-scratch-image-ef0ee3ad3f0a
RUN python3 -OO -m PyInstaller --onefile build.py
# Statically link the system libraries (because scratch-based images don't include them!)
RUN staticx --strip /docker-build/dist/build /docker-build/dist/build_app
# Need an empty tmp directory for pyinstaller
RUN mkdir tmp

FROM scratch
ENTRYPOINT ["/usr/local/bin/build"]
USER 65535
COPY --chown=65535:65535 --from=build tmp /tmp
COPY --chown=65535:65535 --from=build /docker-build/dist/build_app /usr/local/bin/build
```