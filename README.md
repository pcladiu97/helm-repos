# Helm chart repository

This repository is a collection of Helm charts made from a chart for a Wordpress instance, a chart for a simple ASP.NET application, and a chart for SonarQube. Helm is a package manager for Kubernetes that makes it easy to deploy and manage applications on a Kubernetes cluster.

## Table of Contents

  - [Helm chart repository](#Helm-chart-repository)
  - [Description](#description)
  - [Usage](#usage)
  - [Folder Structure](#folder-structure)

## Usage / Description

This repository contains the following charts:
  - aspnet
  - sonarqube
  - wordpress

The charts for `aspnet` and `wordpress` will have three diferent values.yaml files as follows:
  - values-dev.yaml -> For DEV environment
  - values-qa.yaml -> For QA environment
  - values-production.yaml -> For PROD environment

Depending on which stage do you want to deploy your application, that respective values.yaml file will be used. (Ex.: Deploying ASP.NET on QA, for this, `values-qa.yaml` will be used)

The chart named `sonarqube` is the oficial one from the following link: https://github.com/SonarSource/helm-chart-sonarqube/tree/master/charts/sonarqube

After the needed values.yaml file was edited with our desired configuration and pushed to the repository, we can move over to creating the package and pushing it to the helm repository, which is stored in this repository but on `gh-pages` branch.

There are a few CI/CD pipelines as follows:

  - helm-chart-dev.yaml -> For creating the helm package for the desired application for DEV environment
  - helm-chart-qa.yaml -> For creating the helm package for the desired application for QA environment
  - helm-chart-production.yaml -> For creating the helm package for the desired application for PROD environment
  - helm-chart-sonarqube.yaml -> for creating the package which is used for the SonarQube instance

After selecting the desired pipeline, you can run the pipeline with ticking the desired applications, depending on what was ticked, the pipeline will create the helm package and push it to the repository.

## Folder Structure

```plaintext
helm-repos/
│
├── .github/workflows/
│           ├── helm-chart-dev.yaml
│           ├── helm-chart-production.yaml
│           ├── helm-chart-qa.yaml
│           └── helm-chart-sonarqube.yaml
└── charts/
    ├── aspnet/
    │   ├── templates/
    │   ├── Chart.yaml
    │   ├── values-dev.yaml
    │   ├── values-production.yaml
    │   └── values-qa.yaml
    ├── sonarqube/
    │   ├── templates/
    │   ├── Chart.yaml
    │   ├── values-dev.yaml
    │   ├── values-production.yaml
    │   └── values-qa.yaml
    └── wordpress/
        ├── templates/
        ├── Chart.yaml
        ├── values-dev.yaml
        ├── values-production.yaml
        └── values-qa.yaml
```