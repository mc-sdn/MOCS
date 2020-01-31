# MOCS

A prototype implementation of a highly expressive, optimised Software-Defined Network model in UPPAAL.

## Getting Started

These instructions will guide you through getting the MOCS underway.

### Prerequisites

* [UPPAAL](http://www.uppaal.org/) 4.1.19

### Running the model checking

Use the command line version of the verifier: `verifyta`. It takes as input (1) an instantiation of the SDN transition system, i.e. a dataplane topology and a controller program, (xml file) and (2) an invariant property (file por.q).<br/>
The network setups (data plane instantiations) used to evaluate MOCS are depicted in topo1.pdf for the MAC learning application and topo2.pdf for the stateful firewall. The topology setups for the stateless firewall follow the pattern of those with two switches in topo1.pdf.

Subfolder naming convention:<br/>

File naming convention:<br/>
The input files are conventionally named in order to provide a preview of the content. They are organised (1) by controller program name (ML for MAC-learning witch, FW for stateful firewall and SSH for stateless firewall), and (2) by topology setup (mn denotes a network of m switches and n hosts as shown in the topo1.pdf, topo2.pdf files).

### Example

In the example below, we verify the loop-freedom property: "*a packet should never come back to the same switch*" for the MAC learning application in a 3-switches-3-hosts acyclic topology (see topologies.pdf). Formally, see line 19 in por.q.
 
```sh
./verifyta -d -S2 -u  ML33.xml por.q
```

