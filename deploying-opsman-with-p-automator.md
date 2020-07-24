# Deploying opsman with p-automator

Here's the command:

    p-automator create-vm \
    --config "${OPSMAN_CONFIG_FILE}" \
    --image-file "${IMAGE_FILE}"  \
    --state-file "${INPUT_STATE_FILE}" \
    [--vars-file "${VARS_FILE_1}] \
    ...

Where:
* `OPSMAN_CONFIG_FILE` describes the opsman configuration (see [opsman
  configuration example][2]).
* `IMAGE_FILE` is the path to a local VM image (for instance a `.ova`
  file for vSphere deployments).
* `INPUT_STATE_FILE` is the path of the state file that `p-automator`
  will use to store its state. If it doesn't exist, the file will be
  created by `p-automator`.
* `VARS_FILE_1` is a file containing variables to be interpolated in
  the `OPSMAN_CONFIG_FILE`. There can be as many `VARS_FILES` as we
  need.

Source:
* [VMware Platform Automation task reference][1]


[1]: https://docs.pivotal.io/platform-automation/v4.4/tasks.html#create-vm
[2]: examples/vsphere/opsman.yml
