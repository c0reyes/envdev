# Environment develop

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

## Jenkins

- Default username/password: admin/admin

## Examples

- [Greeting](https://github.com/c0reyes/Greeting)
