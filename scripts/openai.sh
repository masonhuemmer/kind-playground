#!/bin/bash

OPENAI_API_KEY=$1
kubectl create secret generic jenkins-secret --from-literal=OPENAI_API_KEY=$OPENAI_API_KEY -n jenkins