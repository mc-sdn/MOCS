# MOCS

A prototype implementation of a highly expressive, optimised Software-Defined Network model in UPPAAL.

## Getting Started

These instructions will guide you through getting the MOCS underway.

### Prerequisites

* [UPPAAL](http://www.uppaal.org/) 4.1.19

### Running the model checking

Use the command line version of the verifier: `verifyta`. It takes as input an instantiation of the SDN transition system, i.e. a dataplane topology and a controller program, (xml file) and an invariant property (file por.q).<br/>
The network setups (data plane instantiations) used to evaluate MOCS are depicted in topo1.pdf for the MAC learning application and topo2.pdf for the stateful firewall. The topology setups for the stateless firewall follow the pattern of those with two switches in topo1.pdf.

### Example

In the example below, we verify the loop-freedom property: "*a packet should never come back to the same switch*" for the MAC learning application in a 3-switches-3-hosts acyclic topology (see topologies.pdf). Formally, see line 19 in por.q.
 
```sh
./verifyta -d -S2 -u  ML33.xml por.q
```

