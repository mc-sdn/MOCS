/*
SSH packets not blocked: invariantly !invariant_failed
*/
//@@@@@@ E<> invariant_failed
//A[] !invariant_failed
/*
 * Exists some rule (of interest) at some flow table that, 10 time units after 
 * it has been installed at the 1st router, still not installed everywhere.
 */
//E<> exists (i: int [0,ftLength-1]) exists (sw: SW) flow_table[sw][i].consist && consistent_c[flow_table[sw][i].rule_id]>=10 && !this_rule_installed_everywhere(flow_table[sw][i])
//Pr[<=100000000](<> invariant_failed)
/*
The system is deadlock-free.
*/
//A[] not deadlock
/*
 * MAC learning switch
 */
//old A[] forall (s: SW) forall (p: int[0,pqLength-1]) not packet_queue[s][p].reached[s]
//@@@@@@ A[] forall (s: SW) forall (p: pkts) not (Packets[p].reached[s] and Packets[p].pq[s] )
//A[] forall (s: SW0) forall (p: pkts) not (Packets[p].reached[s] and Packets[p].pq[s] )
//A[] forall (s: SW) forall (p: pkts) not (packet_has_visited_switch(p,s) and packet_in_pb_32(p,s) )
A[] not invariant_changed()
// A[] forall (s: SW) forall (p: pkts)   ( packet_in_pOb_32(p,s) and (p == pseudo_id)) imply ((packet_MAC(P[p])== pseudo_MAC) )
//E<> exists (s: SW) exists (p: pkts)    packet_in_pOb_32(p,s)
//A[] forall (s: SW) forall (p: pkts)   ( packet_in_pOb_32(p,s) and (p == pseudo_id)) imply ((packet_MAC(P[p])== pseudo_MAC) and (delta_MAC == pseudo_MAC) )


