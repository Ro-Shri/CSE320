/******************************************************************************
  Project #4 skeleton
******************************************************************************/

#include <Sim.h>

void circuits( SD, Signal, Signal, Signal, Signal, Signal, Signal );


/******************************************************************************
  Function "simnet"   -- test bed for student circuits
******************************************************************************/

void simnet()
{
  Signal Init, Clock, w, x, y, z;


  Pulser ((SD("1a"), "Init"), Init, 'i', 1000);
  Pulser ((SD("4a"), "Clock"), Clock, 'c', 1000);
 // Insert your Pulsers here

  circuits( SD("1b-4b"), Init, Clock, w, x, y, z);
  

  Probe ( (SD("1e-1f"), "w"), w);
  Probe ( (SD("2e-2f"), "x"), x);
  Probe ( (SD("3e-3f"), "y"), y);
  Probe ( (SD("4e-4f"), "z"), z);
  
  // Insert your Probes here
}


/******************************************************************************
  Function "circuits" -- implementation of student circuits
******************************************************************************/

void circuits( SD sd, Signal Init, Signal Clock, 
  Signal w, Signal x, Signal y, Signal z )
{
  Module( (sd, "circuits"), (Init, Clock), (w, x, y, z) );


  Signal W, X, Y, Z; 
  Signal notw, notx, noty, notz;
  Signal and1, and2, and3, and4, and5, and6, and7;
 // Insert your declarations for any auxiliary Signals here



  Dff (SD("1b"), (Init, W, Clock, Zero), w);  // Insert your DFFs here
  Dff (SD("2b"), (Init, Y, Clock, Zero), y);
  Dff (SD("3b"), (Zero, X, Clock, Init), x);
  Dff (SD("4b"), (Zero, Z, Clock, Init), z);
 
  // Insert your combinational logic here (Not, And, Or gates)
  Not (SD(sd, "1a"), w, notw); 
  Not (SD(sd, "1b"), x, notx);
  Not (SD(sd, "1c"), y, noty);
  Not (SD(sd, "1d"), z, notz);

  And (SD(sd, "3a"), (notw, notx), and1);
  And (SD(sd, "3b"), (notw, z), and2);
  And (SD(sd, "3c"), (notw, y), and3);
  And (SD(sd, "3d"), (x, noty,notz), and4);
  And (SD(sd, "3e"), (w, notz), and5);
  And (SD(sd, "3f"), (notw, noty, notz), and6);
  And (SD(sd, "3g"), (w, noty, notz), and7);

  Or (SD(sd, "4a"), (and1, and2, and3), W);
  Or (SD(sd, "4a"), (and4, and5), X);
  Or (SD(sd, "4a"), (and6), Y);
  Or (SD(sd, "4a"), (and7, and2), Z); 
}
