# Environment develop

- Git server.
- Jenkins.
- minikube (kubernetes).

## Flow

<pre>
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
</pre>

## Prerequisites

- VirtualBox | KVM
- Vagrant

## Gitea

- Create gitea user.

## Jenkins

- Default username/password: admin/admin

## Examples

- [Greeting](https://github.com/c0reyes/Greeting)
