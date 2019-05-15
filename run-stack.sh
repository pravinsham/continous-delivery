#!/bin/bash

aws cloudformation $ACTION \
    --region ap-south-1 \
    --stack-name $STACK_NAME \
    --template-body file://service.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameters \
    ParameterKey=DockerImage,ParameterValue=272828950582.dkr.ecr.ap-south-1.amazonaws.com/example-web:$(git rev-parse HEAD) \
    ParameterKey=VPC,ParameterValue=vpc-30456358 \
    ParameterKey=Cluster,ParameterValue=ecsintegrations \
    ParameterKey=Listener,ParameterValue=arn:aws:elasticloadbalancing:ap-south-1:272828950582:listener/app/productionintegration/1f82222f194c9522/dfc2213b0c3fc362
