#!/bin/bash

docker build --progress=plain -t doemming/potree:develop .
docker push doemming/potree:develop
