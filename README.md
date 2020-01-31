# MOCS

A prototype implementation of a highly expressive, optimised Software-Defined (SDN) Network model in UPPAAL.

## Getting Started

These instructions will guide you through getting the MOCS underway.

- `Scaling up`<br/>
Each subfolder in `Scaling up` contains data related to a specific controller program as named.<br/>
Leaf-subfolder naming convention:<br/>
The end-subfolders are named conventionally in order to provide a preview of the content. They are organised by (1) controller program name (ML for MAC-learning witch, FW for stateful firewall and SSH for stateless firewall), and (2) whether the optimisations are on/off: "wBit"/"woBit" stands for with/without efficient state representation, and "wPOR"/"woPOR" for with/without partial-order reduction.<br/> 
File naming convention:<br/>
The xml input files are also named conventionally and they are organised by (1) controller program name (same format as their immediate parent directory), and (2) topology setup (data plane instantiations), where mn denotes a network of m switches and n hosts as shown in the `Dataplane topologies` files.

- `Bugs`<br/>
In Bugs-folder there are three controller programs in buggy and corrected versions (for the `Consistent updates` one we provide only the bug-free version as the buggy one can directly obtained by blocking the barrier-reply messages). The topologies for all the examples in `Bugs` are 2-switches-2-hosts from `Dataplane topologies/ML-StatelessFW.pdf`. For more details see []. 
- `Dataplane topologies`<br/>
The network setups used to evaluate MOCS for the MAC learning and stateless firewall applications are depicted in `ML-StatelessFW.pdf`. For the stateful firewall in `StatefulFW.pdf`.

In every leaf-subdirectory there is a query file (por.q) which contains the property.

### Prerequisites

* [UPPAAL](http://www.uppaal.org/) 4.1.19


### Running the model checking

Use the command line version of the verifier: `verifyta`. It takes as input (1) an instantiation of the SDN transition system, i.e. a dataplane topology and a controller program, (xml file) and (2) an invariant property (file por.q).<br/>
The network setups (data plane instantiations) used to evaluate MOCS are depicted in topo1.pdf for the MAC learning application and topo2.pdf for the stateful firewall. The topology setups for the stateless firewall follow the pattern of those with two switches in topo1.pdf.


### Example

In the example below, we verify the loop-freedom property: "*a packet should never come back to the same switch*" for the MAC learning application in a 3-switches-3-hosts acyclic topology (see topo1.pdf). Formally, see line 19 in por.q.
 
```sh
./verifyta -d -S1 -u  ML33.xml por.q
```

