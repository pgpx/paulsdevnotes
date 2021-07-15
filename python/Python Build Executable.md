# Python Build Executable

* [](https://medium.com/analytics-vidhya/dockerizing-a-rest-api-in-python-less-than-9-mb-and-based-on-scratch-image-ef0ee3ad3f0a)
  https://medium.com/analytics-vidhya/dockerizing-a-rest-api-in-python-less-than-9-mb-and-based-on-scratch-image-ef0ee3ad3f0a
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
RUN pyinstaller --onefile build.py
# Statically link the system libraries (because kaniko does not include them!)
RUN staticx /docker-build/dist/build /docker-build/dist/build_app
RUN mkdir /empty


FROM gcr.io/kaniko-project/executor:v1.6.0-debug
ENTRYPOINT ["/docker-build/build"]
COPY --from=build /empty /tmp
COPY --from=build /docker-build/dist/build_app /usr/local/bin/build
## Needs to go at the end because it will otherwise invalidate the build cache!
#ENTRYPOINT ["python", "/docker-build/build.py"]