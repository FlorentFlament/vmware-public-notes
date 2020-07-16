# VMware public notes

Simplest way I could find to share some notes related to VMware.

## App modernization

This is the group I am now part of. So what does "App modernization"
mean at VMware ?

On [VMware website][5], there is an "App modernization" section in the
"Solutions" tab, as well as the "Products" tab. These sections provide
the following links:

* [Solutions][7]

  - [App Modernization][8] - The "App Modernization solutions" section
    is split into 3 items:

	. [Consume Kubernetes Across Clouds][6] - The (Kubernetes)
      platform management aspect.

	. [Build Cloud-Native Apps][9] - Labs to efficiently write
      cloud-native applications from scratch.

	. [Evolve Existing Apps][10] - Labs to transform legacy
      applications, and adopt modern development patterns.


* [Products][11]

  - App Modernization

	. [Tanzu Kubernetes Grid][17]

	. [Tanzu Application Service][18]

    . [Tanzu Observability by Wavefront][14]

	. [Tanzu Service Mesh][15]

    . [Tanzu Mission Control][12]

	. [Tanzu Application Catalog][13]


Also some products in the "App Modernization" section of the [Products
page][11], though not appearing in the main "Products" roll-down menu:

. [Pivotal GemFire][16]

. [Pivotal tc Server][19]

. [Pivotal App Suite][20]

. [Pivotal RabbitMQ][21]


## App Modernization - Platform

Former (Pivotal) PCFS team maps to a subset of the app modernization
VMware groupment. We focused on platforms deployment and operations
(PAS now renamed TAS and PKS now renamed TKGI or Tanzu Kubernetes Grid
Integrated Edition)

Our core VMware products are therefore:

* [Tanzu Kubernetes Grid][17] ([doc][23]) of which 3 variants exist:

  . [Tanzu Kubernetes Grid][24], which deployment method depends on
	the version of vSphere (vSphere 7 vs vSphere 6) it will be
	deployed on.

  . [Tanzu Kubernetes Gris Integrated Edition][25] and former [Pivotal
    documentation][26]. This is the rebranding of former Pivotal's
    PKS.

* [VMware Tanzu Application Service][18] ([doc][27]) is the new name
  of former Pivotal PAS.

* [Tanzu Observability by Wavefront][14]

  - [doc][28]

  - (good) [introduction video][29]

* [Tanzu Service Mesh][15]

* [Tanzu Mission Control][12]

* [Tanzu Application Catalog][13] - This isn't specific to
  VMware. This is a catalog of curated software (by bitnami, then
  bought by VMware) that can be deployed on any Kubernetes
  cluster.


## Training

[Hands-on Labs][22] seem to be a good starting point to learn about
VMware products.


## Random

Just ordered [Programming the 80386][1] book, written by John
H. Crawford and Patrick P. Gelsinger, the later being current VMware
CEO.

Found [Frank Denneman's blog][2], looks interesting.
* Interesting [discussion about NUMA][4] (Non Uniform Memory Access).

[VMworld 2020][3], from September 29th to October 1st. There's a free
registration; a whole lot of "sessions" are programmed.


[1]: https://archive.org/details/programming8038600craw
[2]: https://frankdenneman.nl/
[3]: https://www.vmworld.com/en/index.html
[4]: https://frankdenneman.nl/numa/
[5]: https://www.vmware.com/
[6]: https://www.vmware.com/cloud-solutions/app-modernization/kubernetes.html
[7]: https://www.vmware.com/cloud-solutions.html
[8]: https://www.vmware.com/cloud-solutions/app-modernization.html
[9]: https://www.vmware.com/cloud-solutions/app-modernization/cloud-native-apps.html
[10]: https://www.vmware.com/cloud-solutions/app-modernization/existing-apps.html
[11]: https://www.vmware.com/products.html
[12]: https://tanzu.vmware.com/mission-control
[13]: https://tanzu.vmware.com/application-catalog
[14]: https://tanzu.vmware.com/observability
[15]: https://tanzu.vmware.com/service-mesh
[16]: https://www.vmware.com/products/pivotal-gemfire.html
[17]: https://tanzu.vmware.com/kubernetes-grid
[18]: https://tanzu.vmware.com/application-service
[19]: https://www.vmware.com/products/pivotal-tcserver.html
[20]: https://www.vmware.com/products/pivotal-appsuite.html
[21]: https://www.vmware.com/products/pivotal-rabbitmq.html
[22]: https://labs.hol.vmware.com/
[23]: https://docs.vmware.com/en/VMware-Tanzu-Kubernetes-Grid/index.html
[24]: https://docs.vmware.com/en/VMware-Tanzu-Kubernetes-Grid/1.1/vmware-tanzu-kubernetes-grid-11/GUID-index.html
[25]: https://docs.vmware.com/en/VMware-Tanzu-Kubernetes-Grid-Integrated-Edition/index.html
[26]: https://docs.pivotal.io/tkgi/1-8/index.html
[27]: https://docs.pivotal.io/platform/2-9/installing/pcf-docs.html
[28]: https://docs.wavefront.com/
[29]: https://www.youtube.com/watch?v=90mw6Vcmlt4
