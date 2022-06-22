FROM python AS build-stage

#Dependencies
COPY requirements.txt .
RUN pip install --user -r requirements.txt

#Logging is up to date
ENV PYTHONUNBUFFERED 1

WORKDIR /opt/app

#Move sourcefiles
COPY . .
#Copy resources from build env
COPY --from=build-stage /root/.local/ /usr/local


CMD [ "/bin/bash" ]