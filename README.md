# helm-cronjob

Run `helm` command (mainly `helm upgrade`) as CronJob

## How to use

### Create base/secret.env

```secret.env
PAT=[Your personal access token (repo scope is necessary)]
OWNER=[Repository owner]
REPO=[Repository name that includes the helm chart]
```

### Determine the schedule and arguments

in `overlay/schedule-and-args.yaml`

### Check your CronJob

```
kustomize build overlay
```

### Apply

```
kustomize build overlay | kubectl apply -f -
```

### Delete

```
kustomize build overlay | kubectl delete -f -
```
