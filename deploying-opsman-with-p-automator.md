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

That said, `p-automator` can't easily be used as a standalone
executable, as it relies on tools like `govc`. The usual workflow to
use `p-automator` is to use the docker image provided by VMware
[Platform Automation Toolkit][3]

Once the image has been imported by local Docker daemon:

    docker import platform-automation-image-4.4.4.tgz platform-automation:4.4.4

One would be able to launch `p-automator` like this:

    docker run -v ${PWD}:/work platform-automation:4.4.4 \
	  p-automator create-vm \
	    --config /work/${OPSMAN_CONFIG_FILE} \
		--image-file /work/${IMAGE_FILE} \
		--state-file /work/${INPUT_STATE_FILE}


[1]: https://docs.pivotal.io/platform-automation/v4.4/tasks.html#create-vm
[2]: examples/vsphere/opsman.yml
[3]: https://network.pivotal.io/products/platform-automation/
