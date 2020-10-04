# Environment develop

My development environment test.

- Git server.
- Jenkins.
- minikube (kubernetes).

## Flow

    +-----------------------------------------------------+
    |                                                     |
    | Vagrant: VirtualBox or KVM                          |
    |                                                     |
    |                     +--------+                      |
    |                     | Docker |                      |
    |                     +---+----+                      |
    |                         |                           |
    |    +-----------+--------+--------+------------+     |
    |    |           |                 |            |     |
    |    |           |                 |            |     |
    |    |           |                 |            |     |
    | +--+--+    +---+---+        +----+---+   +----+---+ |
    | |Gitea|    |Jenkins|        |Registry|   |Minikube| |
    | +-----+    +-------+        +--------+   +--------+ |
    |                                                     |
    +-----------------------------------------------------+

## Prerequisites

- VirtualBox | KVM
- Vagrant

## Gitea

- Create gitea user.
