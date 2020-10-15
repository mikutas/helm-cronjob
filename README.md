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
kubectl kustomize overlay
```

### Apply

```
kubectl apply -k overlay
```

### Delete

```
kubectl delete -k overlay
```
